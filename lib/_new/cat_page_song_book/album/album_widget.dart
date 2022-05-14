import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AlbumWidget extends StatelessWidget{

  static const double ICON_SIZE = 52.0;

  static HERO_TAG_TITLE(Album album) => album.fileName! + '\$TITLE';
  static HERO_TAG_SONG_CNT(Album album) => album.fileName! + '\$SONG_CNT';
  static HERO_TAG_ICON(Album album) => album.fileName! + '\$ICON';
  static HERO_TAG_GRADIENT(Album album) => album.fileName! + '\$GRADIENT';

  final Album album;
  final Function? onTap;
  final Widget? bottom;
  final Widget? trailing;

  AlbumWidget(this.album, {this.onTap, this.bottom, this.trailing});

  @override
  Widget build(BuildContext context) {

    bool selected = Album.current == album;

    Widget widget = Row(
      children: <Widget>[

        Hero(
          tag: HERO_TAG_GRADIENT(album),
          child: GradientWidget(
              elevation: AppCard.bigElevation,
              radius: AppCard.BIG_RADIUS,
              colorStart: CommonColorData.ALL[album.colorsKey!]!.colorStart!,
              colorEnd: CommonColorData.ALL[album.colorsKey!]!.colorEnd!,
              height: 100,
              width: 100,
              child: Column(
                children: [

                  Expanded(
                    child: album.iconKey!=null?Center(
                      child: Icon(
                        CommonIconData.ALL[album.iconKey!],
                        color: background_(context),
                        size: ICON_SIZE,
                      ),
                    ):Container(),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: Dimen.ICON_MARG),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            MdiIcons.music,
                            size: 14,
                            color: CommonColorData.ALL[album.colorsKey!]!.iconColor.withOpacity(.4)
                        ),
                        SizedBox(width: Dimen.DEF_MARG),
                        Text(
                            '${album.songs.length}',
                            style: AppTextStyle(
                                fontSize: 14.0,
                                fontWeight: weight.halfBold,
                                color: CommonColorData.ALL[album.colorsKey!]!.iconColor.withOpacity(.4)
                            )
                        )

                      ],
                    ),
                  )

                ],
              )
          ),
        ),

        Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Hero(
                              tag: HERO_TAG_TITLE(album),
                              child: Material(
                                color: Colors.transparent,
                                child: Text(album.title!,
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

                if(trailing != null) trailing!
              ],
            )
        ),

      ],
    );

    if(selected)
      return AppCard(
          elevation: AppCard.bigElevation,//ELEVATION,
          radius: AppCard.BIG_RADIUS,
          padding: EdgeInsets.zero,
          onTap: onTap as void Function()?,
          child: widget
      );
    else
      return InkWell(
        borderRadius: BorderRadius.all(Radius.circular(AppCard.BIG_RADIUS)),
        onTap: onTap as void Function()?,
        child: widget,
      );
  }
}