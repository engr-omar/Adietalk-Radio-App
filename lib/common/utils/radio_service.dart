import 'package:radio_player/radio_player.dart';

class RadioService {
  /// No instance needed; methods are static in radio_player 2.2.1

  static Future<void> init() async {
    await RadioPlayer.setStation(
      title: 'Adietalk Radio',
      url: 'http://s2.radio.co/sa5a2a9028/listen',
      logoAssetPath: 'assets/images/logo.png',
      parseStreamMetadata: true,
    );
  }

  static Future<void> play() => RadioPlayer.play();
  static Future<void> pause() => RadioPlayer.pause();
  static Future<void> stop() => RadioPlayer.reset();

  static Stream<PlaybackState> get stateStream =>
      RadioPlayer.playbackStateStream;
  static Stream<Metadata> get metadataStream => RadioPlayer.metadataStream;
}
