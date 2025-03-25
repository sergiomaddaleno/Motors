#ifndef SOUND_HPP
#define SOUND_HPP

#include <string>
#include <AL/al.h>
#include <AL/alc.h>
#include <vector>
#include <thread>
#include <atomic>

struct Branching
{
    std::string state;
    int branching_state;
    int branching_interp_state;
    int branching_interp_buffer_index;
    bool interpolate;
    bool playbranching;
    bool initplaybranching;

    ALuint sourceForBranching;

    ALint buffersProcessed;
    size_t currentBufferIndex;
    size_t nextBufferIndex;
};

class SoundSystem {
public:

    std::vector<std::vector<ALuint>> tracksForBranching;
    std::vector<std::vector<ALuint>> tracksForInterpolateBranching;

    Branching branching;

    SoundSystem();
    ~SoundSystem();

    bool loadOggFile(const std::string& filePath, ALuint& buffer);
    bool loadWavFile(const std::string& filePath, ALuint& buffer);
    void play(ALuint source);
    void pause(ALuint source);
    void stop(ALuint source);
    void setVolume(ALuint source, float volume);
    void setLooping(ALuint source, bool loop);

    void crossfade(ALuint sourceFrom, ALuint sourceTo, float crossfadeStart);

    void cleanup();

    void addBufferToSourceQueue(ALuint source, ALuint& buffer);
    void removeBufferToSourceQueue(ALuint source, ALuint& buffer);
    void removeAllBuffersQueue(ALuint source);
    int  getBuffersProccesed(ALuint source);

private:
    ALCdevice* device;
    ALCcontext* context;

    std::vector<ALuint> buffers;
    std::vector<ALuint> sources;

};

#endif
