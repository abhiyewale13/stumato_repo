
import 'package:stumato_march/widgets/text/src/audio_player/audio_player_interface.dart';
import 'package:stumato_march/widgets/text/src/enums/asset_storage_type.dart';
import 'package:stumato_march/widgets/text/src/pigeons/messages.pigeon.dart';

/// An Audio player that uses native APIs for playing audios
///
/// On Android, this player utilizes SoundPool, and on iOS it uses AVAudioPlayer
class AudioPlayer implements AudioPlayerInterface {
  /// Creates an instance of [AudioPlayer]
  ///
  /// The [identifier] uniquely identifies this audio player instance.
  AudioPlayer({required this.identifier}) : _nativePlayer = NativeAudioPlayerApi();

  final NativeAudioPlayerApi _nativePlayer;
  final String identifier;

  /// Initializes the audio player with the provided parameters.
  ///
  /// The [uri] parameter specifies the location of the audio file.
  /// The [storageType] parameter indicates the whether file is network or local
  /// asset.
  @override
  Future<void> initialize({
    required String uri,
    AssetStorageType storageType = AssetStorageType.asset,
  }) async {
    await _nativePlayer.initialize(identifier, uri, storageType == AssetStorageType.network);
  }

  /// Unload the audio and release resources associated with the audio player
  @override
  Future<void> dispose() => _nativePlayer.deInit(identifier);

  /// Pause audio playback
  @override
  Future<void> pause() => _nativePlayer.pause(identifier);

  /// Start audio playback
  @override
  Future<void> play() => _nativePlayer.play(identifier);

  /// Stop a playback stream and is no longer ready to play.
  ///
  /// In Android, It also releases any native resources associated
  /// with this stream. If the stream is not playing, it will have no effect.
  @override
  Future<void> stop() => _nativePlayer.stop(identifier);

  /// Set stream volume
  ///
  /// The value must be in the range of `0.0` to `1.0`
  @override
  Future<void> setVolume(double volume) => _nativePlayer.setVolume(identifier, volume);
}
