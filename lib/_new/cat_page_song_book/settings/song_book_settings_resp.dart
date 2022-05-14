import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';

import '../../api/sync_resp_body/sync_entity_resp.dart';

class SongBookSettingsResp extends SyncGetResp{

  static const collName = SongBookSettings.syncClassId;

  bool? alwaysOnScreen;
  bool? scrollText;
  double? autoscrollTextSpeed;
  bool? showChords;
  bool? showDrawChords;
  InstrumentType? drawChordsType;
  bool? showAlbumIcon;
  bool? showTabOfContOnStart;

  SongBookSettingsResp({
    required this.alwaysOnScreen,
    required this.scrollText,
    required this.autoscrollTextSpeed,
    required this.showChords,
    required this.showDrawChords,
    required this.drawChordsType,
    required this.showAlbumIcon,
    required this.showTabOfContOnStart
  });

  static SongBookSettingsResp from(Map respData) => SongBookSettingsResp(
      alwaysOnScreen: respData[SongBookSettings.PARAM_ALWAYS_ON_SCREEN],
      scrollText: respData[SongBookSettings.PARAM_SCROLL_TEXT],
      autoscrollTextSpeed: respData[SongBookSettings.PARAM_AUTOSCROLL_TEXT_SPEED],
      showChords: respData[SongBookSettings.PARAM_SHOW_CHORDS],
      showDrawChords: respData[SongBookSettings.PARAM_SHOW_DRAW_CHORDS],
      drawChordsType: respData[SongBookSettings.PARAM_DRAW_CHORDS_TYPE]==null?null:intToTstrumentType(respData[SongBookSettings.PARAM_DRAW_CHORDS_TYPE]),
      showAlbumIcon: respData[SongBookSettings.PARAM_SHOW_ALBUM_ICON],
      showTabOfContOnStart: respData[SongBookSettings.PARAM_SHOW_TAB_OF_CONT_ON_START],
  );

}