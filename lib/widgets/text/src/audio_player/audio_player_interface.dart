
import 'package:stumato_march/widgets/text/src/enums/asset_storage_type.dart';

/// An interface defining API of the audio player.
abstract interface class AudioPlayerInterface {
  /// Initializes the audio player with the provided parameters.
  ///
  /// The [uri] parameter specifies the location of the audio file.
  /// The [storageType] parameter indicates the whether file is network or local
  /// asset.
  ///
  /// Defaults to [AssetStorageType.asset].
  Future<void> initialize({
    required String uri,
    AssetStorageType storageType = AssetStorageType.asset,
  });

  /// Starts playback of the audio
  Future<void> play();

  /// Stops the playback of the audio
  Future<void> stop();

  /// Pauses the currently playing audio
  Future<void> pause();

  /// Releases resources associated with the audio player
  Future<void> dispose();

  /// Sets the volume of the audio player.
  ///
  /// The [volume] parameter should be a value between `0.0` (mute) and `1.0` (maximum volume)
  Future<void> setVolume(double volume);
}
