import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:zker/feature/adhkar/presentation/view_model/audio_player_cubit/audio_player_cubit_state.dart';


class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayerService _audioService;

  AudioPlayerCubit(this._audioService) : super(AudioPlayerInitial());

  Future<void> play(String audioPath) async {
    await _audioService.play(audioPath);
    emit(AudioPlayerPlaying(audioPath));
  }

  Future<void> pause() async {
    await _audioService.pause();
    emit(AudioPlayerPaused());
  }

  Future<void> stop() async {
    await _audioService.stop();
    emit(AudioPlayerStopped());
  }

  @override
  Future<void> close() {
    _audioService.dispose();
    return super.close();
  }
}


class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> play(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
