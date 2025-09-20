
abstract class AudioPlayerState {}

class AudioPlayerInitial extends AudioPlayerState {}

class AudioPlayerPlaying extends AudioPlayerState {
  final String audioPath;
  AudioPlayerPlaying(this.audioPath);
}

class AudioPlayerPaused extends AudioPlayerState {}

class AudioPlayerStopped extends AudioPlayerState {}
