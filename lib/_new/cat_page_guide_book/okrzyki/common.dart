
import 'package:assets_audio_player/assets_audio_player.dart';

class Sound{

  static const int ITEM_COUNT = 50;

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  static List<Sound> all = [];

  Future<void> load(int index) => assetsAudioPlayer.open(
    Audio('assets/trumpet/${index + 1}.mp3'),
    autoStart: false
  );

  static Future<Sound> fromAsset(int soundIndex) async {
    Sound sound = Sound();
    await sound.load(soundIndex);
    return sound;
  }

  static Future<void> initAll({void Function(int) onProgress}) async{

    all.clear();
    for(int i=0; i<ITEM_COUNT; i++){
      onProgress(i);
      all.add(await Sound.fromAsset(i));
    }
  }

  static play(int tone, int milisec) async {
    if(tone>0) all[tone]._play();
    await Future.delayed(Duration(milliseconds: milisec));
    all[tone]._stop();
  }

  static Future<void> stop(int tone) => all[tone]._stop();

  Future<void> _play() => assetsAudioPlayer.play();

  Future<void> _stop() => assetsAudioPlayer.stop();

  Future<void> release() => assetsAudioPlayer.dispose();

  static Future<void> releaseAll() async {
    for(int i=0; i<ITEM_COUNT; i++)
      await all[i].release();
  }
}

class SoundElement{

  static const String SEPARATOR = '&';

  static const int fullLength = 2600;

  final int tone;
  final int timeFract;
  final String text;
  final String separator;

  const SoundElement(this.tone, this.timeFract, {this.text ='', this.separator =''});

  play() async{
    int duration = fullLength~/timeFract;
    if(tone == null) await Future.delayed(Duration(milliseconds: duration));
    else await Sound.play(tone, duration);
  }

  Future<void> stop() => Sound.stop(tone);

  static SoundElement decode(String code){
    List<String> elements = code.split(SEPARATOR);
    return SoundElement(
      int.parse(elements[0]),
      int.parse(elements[1]),
      text: elements.length>2?elements[2]:'',
      separator: elements.length>3?elements[3]:'',
    );
  }

  @override
  String toString() {
    return tone.toString() + SEPARATOR + timeFract.toString() + SEPARATOR + text + SEPARATOR + separator;
  }
}
