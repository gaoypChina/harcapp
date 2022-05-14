import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/scan_qr_code.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core_own_song/song_raw.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../_common_widgets/bottom_sheet.dart';
import 'own_song_page.dart';

class AddSongBottomSheet extends StatelessWidget{

  final void Function(Song song, EditType editType)? onSaved;

  const AddSongBottomSheet({this.onSaved, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => BottomSheetDef(
      title: 'Dodaj piosenkę',
      childMargin: EdgeInsets.zero,
      builder: (context) => Stack(
        children: [

          Positioned(
            bottom: -.07*MediaQuery.of(context).size.width,
            right: -.07*MediaQuery.of(context).size.width,
            child: Icon(
              MdiIcons.musicNotePlus,
              color: backgroundIcon_(context),
              size: 0.7*MediaQuery.of(context).size.width,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(Dimen.BOTTOM_SHEET_MARG + Dimen.ICON_MARG),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                TitleShortcutRowWidget(
                  title: 'Nowa piosenka',
                  icon: MdiIcons.plus,
                  onOpen: (context){
                    Navigator.pop(context);
                    openOwnSongPage(context, onSaved: onSaved);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Text(
                    'Spisz piosenkę od zera - od tytułu, poprzez wykonawcę, po ostatni przecinek w tekście i chwyty!',
                    style: AppTextStyle(color: hintEnab_(context)),
                  ),
                ),

                const SizedBox(height: 42),

                TitleShortcutRowWidget(
                  title: 'Skanuj kod piosenki',
                  icon: MdiIcons.qrcodeScan,
                  onOpen: (context) async {
                    Navigator.pop(context);

                    if(await Permission.camera.request().isGranted) {

                      String? code = await scanQrCode();
                      if(code == null) return;
                      SongRaw song;

                      try {
                        song = SongRaw.from('${OwnSong.lastFileName + 1}', code);
                      }
                      on Exception {
                        showAppToast(context, text: 'Coś tu nie gra...');
                        return;
                      }

                      openOwnSongPage(context, song: song, onSaved: onSaved);
                    }
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Text(
                    'Zeskanuj kod QR z dowolnej piosenki w innej harcappce!',
                    style: AppTextStyle(color: hintEnab_(context)),
                  ),
                ),

                const SizedBox(height: Dimen.ICON_MARG),

              ],
            ),
          ),

        ],
      )
  );

}

void openOwnSongPage(BuildContext context, {SongRaw? song, Function(Song song, EditType editType)? onSaved}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => OwnSongPage.from(
        song: song,
        onSaved: onSaved
    )));