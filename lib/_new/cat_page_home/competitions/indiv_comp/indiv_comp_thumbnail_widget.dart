
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/indiv_comp.dart';


class IndivCompThumbnailWidget extends StatelessWidget{

  static const double defSize = 72.0;
  static const double iconSizeFactor = .6;

  final IndivComp comp;
  final double size;
  final void Function() onTap;
  final heroTag;

  const IndivCompThumbnailWidget(this.comp, {this.size=defSize, this.onTap, this.heroTag});

  //static double height(double size) => size + 3*Dimen.ICON_MARG;

  static IndivCompThumbnailWidget random() => IndivCompThumbnailWidget(
      IndivComp(
        key: null,
        iconKey: CommonIconData.randomKey,
        colorsKey: CommonColorData.randomKey,
        name: null,
        startTime: null,
        overviewMode: null,
        profile: IndivCompProfile(
          active: null,
          role: null
        ),
        particips: [],
        tasks: [],
        awards: [],
        shareCode: null,
        shareCodeSearchable: null
      )
  );

  static IndivCompThumbnailWidget from({@required String iconKey, @required String colorsKey}) => IndivCompThumbnailWidget(
      IndivComp(
        key: null,
        iconKey: iconKey,
        colorsKey: colorsKey,
        name: null,
        startTime: null,
        overviewMode: null,
        profile: IndivCompProfile(
          active: null,
          role: CompRole.OBSERVER
        ),
        particips: [],
        tasks: [],
        awards: [],
        shareCode: null,
        shareCodeSearchable: null
      )
  );

  @override
  Widget build(BuildContext context) {

    CommonColorData colorData = comp.colors;

    Widget widget = SizedBox(
      width: size,
      height: size,
      child: AppCard(
          onTap: onTap,
          elevation: 0,
          //elevation: AppCard.bigElevation,
          radius: .25*size,
          padding: EdgeInsets.zero,
          child: Stack(
            children: [

              GradientWidget(
                colorStart: colorData.colorStart,
                colorEnd: colorData.colorEnd,
                child: Center(
                  child: Icon(comp.icon, color: cardEnab_(context), size: iconSizeFactor*size),
                ),
              ),

              if(comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: AppCard(
                    padding: EdgeInsets.only(
                        bottom: size/18,
                        right: size/18,
                        left: size/18,
                        top: size/18
                    ),
                    color: background_(context),
                    elevation: 0,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(.25*size)
                    ),
                    margin: EdgeInsets.zero,
                    child: Icon(
                      comp.profile.role == CompRole.ADMIN?
                      MdiIcons.star:MdiIcons.pencil,
                      size: size/5,//16.0,
                      color: comp.colors.colorEnd,
                    ),
                  ),
                )

            ],
          )
      ),
    );

    if(heroTag == null)
      return widget;
    else
      return Hero(
        tag: heroTag,
        child: widget,
      );
  }

}