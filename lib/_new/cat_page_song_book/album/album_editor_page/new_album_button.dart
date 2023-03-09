
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../album_name.dart';
import '../album_widget_small.dart';
import '_main.dart';

class NewAlbumButton extends StatelessWidget{

  final void Function(OwnAlbum album)? onNewCreated;
  const NewAlbumButton({this.onNewCreated, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      clipBehavior: Clip.none,
      radius: AppCard.bigRadius,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          AppCard(
            radius: AppCard.bigRadius,
            elevation: AppCard.bigElevation,
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            margin: EdgeInsets.zero,
            child: Icon(
              MdiIcons.bookmarkPlusOutline,
              color: textEnab_(context),
              size: AlbumWidgetSmall.iconSize,
            ),
          ),
          Expanded(
              child: Text(
                  Nowy_album_,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: textEnab_(context)
                  ),
                  textAlign: TextAlign.center
              )
          ),
          const SizedBox(width: AlbumWidgetSmall.iconSize + 2*Dimen.ICON_MARG),
        ],
      ),
      onTap: () =>
        pushPage(context, builder: (context) => AlbumEditorPage(
          onSaved: (album){
            Navigator.pop(context);
            onNewCreated?.call(album as OwnAlbum);
          },
        ))
  );

}