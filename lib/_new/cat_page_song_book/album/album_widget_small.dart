import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_new/cat_page_song_book/album/album_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AlbumWidgetSmall extends StatelessWidget{

  static const double iconSize = 36.0;

  final Album album;
  final bool? selected;
  final Widget? trailing;
  final bool showSongCount;
  final Color? iconColor;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const AlbumWidgetSmall(
      this.album,
      { this.selected,
        this.trailing,
        this.showSongCount = true,
        this.iconColor,
        this.onTap,
        this.onLongPress,
        super.key
      });

  @override
  Widget build(BuildContext context) {

    bool selected = this.selected??Album.current == album;

    CommonColorData albColor = CommonColorData.get(album.colorsKey);
    IconData? iconData = CommonIconData.get(album.iconKey);

    Widget widget = Container(
      decoration: BoxDecoration(
          color: selected?backgroundIcon_(context):Colors.transparent,
          borderRadius: BorderRadius.circular(AppCard.bigRadius)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Hero(
            tag: AlbumWidget.heroTagGradient(album),
            child: GradientWidget(
                elevation: AppCard.bigElevation,
                radius: AppCard.bigRadius,
                colorStart: albColor.colorStart,
                colorEnd: albColor.colorEnd,
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Icon(iconData, color: iconColor??(albColor.iconWhite?Colors.white:cardEnab_(context)), size: iconSize),
                )
            ),
          ),

          const SizedBox(width: Dimen.ICON_MARG),

          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: AlbumWidget.heroTagTitle(album),
                    child: Text(
                        album.title!,
                        style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          fontSize: Dimen.TEXT_SIZE_BIG,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis
                    ),
                  ),

                  if(showSongCount)
                    const SizedBox(height: Dimen.defMarg),

                  if(showSongCount)
                    Row(
                      children: [

                        const Icon(MdiIcons.music, size: Dimen.TEXT_SIZE_NORMAL),
                        const SizedBox(width: Dimen.defMarg),
                        Hero(
                          tag: AlbumWidget.heroTagSongCnt(album),
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                                '${album.songs.length}',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_NORMAL,
                                    fontWeight: weight.halfBold,
                                    color: iconEnab_(context)
                                ),
                                maxLines: 1
                            ),
                          ),
                        ),
                      ],
                    )

                ],
              )
          ),

          if(trailing != null) trailing!,

          const SizedBox(width: Dimen.ICON_MARG)

        ],
      ),
    );

    return InkWell(
      borderRadius: BorderRadius.circular(AppCard.bigRadius),
      onTap: onTap,
      onLongPress: onLongPress,
      child: widget,
    );

  }

}