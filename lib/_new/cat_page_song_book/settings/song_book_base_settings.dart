
import 'package:harcapp_core/comm_widgets/instrument_type.dart';
import 'package:harcapp_core_song_widget/settings.dart';

import '../../../_common_classes/sha_pref.dart';

class SongBookBaseSetting extends SongBookSettTempl{

  @override
  bool get alwaysOnScreen => shaPref!.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_ALWAYS_ON_SCREEN, false);
  @override
  set alwaysOnScreen(bool value) => shaPref!.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_ALWAYS_ON_SCREEN, value);

  @override
  bool get scrollText => shaPref!.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SCROLL_TEXT, true);
  @override
  set scrollText(bool value) => shaPref!.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SCROLL_TEXT, value);

  @override
  double get autoscrollTextSpeed => shaPref!.getDouble(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT_SPEED, 0.4);
  @override
  set autoscrollTextSpeed(double value) => shaPref!.setDouble(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT_SPEED, value);

  @override
  bool get showChords => shaPref!.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_CHORDS, true);
  @override
  set showChords(bool value) => shaPref!.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_CHORDS, value);

  @override
  bool get chordsTrailing => shaPref!.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_TRAILING, true);
  @override
  set chordsTrailing(bool value) => shaPref!.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_TRAILING, value);

  @override
  bool get chordsDrawShow => shaPref!.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW, true);
  @override
  set chordsDrawShow(bool value) => shaPref!.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW, value);

  @override
  InstrumentType get chordsDrawType => intToTstrumentType(shaPref!.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW_TYPE, 0)!);
  @override
  set chordsDrawType(InstrumentType value) => shaPref!.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW_TYPE, instrumentTypeToInt(value));


}
