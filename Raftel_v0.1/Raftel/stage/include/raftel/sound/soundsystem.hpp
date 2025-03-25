#ifndef __SOUND_SYSTEM_H__
#define __SOUND_SYSTEM_H__ 1

#include <AL/al.h>
#include <AL/alc.h>
#include <string>
#include <unordered_map>
#include <raftel/global_macros.hpp>

namespace Raftel{
	struct Branching 
	{
		std::string state;
		int branching_state;
		int branching_interp_state;
		int branching_interp_buffer_index;
		bool interpolate;
		bool playbranching ;
		bool initplaybranching;

		ALuint sourceForBranching;

		ALint buffersProcessed;
		size_t currentBufferIndex;
		size_t nextBufferIndex;
	};

	class SoundSystem 
	{
	public: 
		SoundSystem();
		~SoundSystem();

		virtual bool initialize();

		void play(ALuint source);
		void pause(ALuint source);
		void stop(ALuint source);

		void setVolume(ALuint source, float volume);
		void setLooping(ALuint source, bool loop);

		bool loadWavFile(const std::string& filePath, ALuint& buffer);
		bool loadOggFile(const std::string& filePath, ALuint& buffer);

	
		void playTrack(ALuint *prev_soource, ALuint* source, float timeTrack, float &elapsedTime,std::string type);

		void cleanup();

		void crossfade(ALuint sourceFrom, ALuint sourceTo, float crossfadeStart);

		void addBufferToSourceQueue(ALuint source, ALuint& buffer);
		void removeBufferToSourceQueue(ALuint source, ALuint &buffer);

		void removeAllBuffersQueue(ALuint source);

		int getBuffersProccesed(ALuint source);

		MOVABLE_BUT_NOT_COPYABLE(SoundSystem);

		std::vector<std::vector<ALuint>> tracksForBranching;
		std::vector<std::vector<ALuint>> tracksForInterpolateBranching;

		Branching branching;
	private:
		ALCdevice* device;
		ALCcontext* context;

		std::vector<ALuint> buffers;
		std::vector<ALuint> sources;
	};
}
#endif // !__SOUND_SYSTEM_H__
