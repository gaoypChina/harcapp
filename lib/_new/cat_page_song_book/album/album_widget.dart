import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp_core/dimen.dart';

class AlbumWidget extends StatelessWidget{

  static const double iconSize = 52.0;
  static const double titlePaddingVal = 16.0;

  static heroTagTitle(BaseAlbum album) => '${album.lclId}\$TITLE';
  static heroTagSongCnt(BaseAlbum album) => '${album.lclId}\$SONG_CNT';
  static heroTagIcon(BaseAlbum album) => '${album.lclId}\$ICON';
  static heroTagGradient(BaseAlbum album) => '${album.lclId}\$GRADIENT';

  final BaseAlbum album;
  final void Function()? onTap;
  final Widget? bottom;

  const AlbumWidget(this.album, {this.onTap, this.bottom, super.key});

  @override
  Widget build(BuildContext context) {

    bool selected = BaseAlbum.current == album;

    return SimpleButton(
      clipBehavior: Clip.none,
      radius: AppCard.bigRadius,
      onTap: onTap,
      color: selected?cardEnab_(context):null,
      child: SizedBox(
        height: Dimen.ICON_FOOTPRINT + 20.0 + 2*Dimen.ICON_MARG,
        child: Row(
          children: <Widget>[

            Hero(
              tag: heroTagGradient(album),
              child: GradientWidget(
                elevation: AppCard.bigElevation,
                radius: AppCard.bigRadius,
                colorStart: CommonColorData.get(album.colorsKey).colorStart,
                colorEnd: CommonColorData.get(album.colorsKey).colorEnd,
                height: Dimen.ICON_FOOTPRINT + 20.0 + 2*Dimen.ICON_MARG,
                width: Dimen.ICON_FOOTPRINT + 20.0 + 2*Dimen.ICON_MARG,
                child: Icon(
                  CommonIconData.get(album.iconKey),
                  color: background_(context),
                  size: iconSize,
                ),
              ),
            ),

            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                        padding: const EdgeInsets.only(
                          top: Dimen.ICON_MARG,
                          left: 16.0
                        ),
                        child: Hero(
                            tag: heroTagTitle(album),
                            child: Material(
                              color: Colors.transparent,
                              child: Text(album.title,
                                  style: AppTextStyle(
                                      fontSize: 20.0,
                                      fontWeight: weight.halfBold,
                                      color: textEnab_(context))
                              ),
                            )
                        )
                    ),

                    if(bottom != null) bottom!,
                  ],
                ),
            ),

          ],
        ),
      )
    );
  }
}