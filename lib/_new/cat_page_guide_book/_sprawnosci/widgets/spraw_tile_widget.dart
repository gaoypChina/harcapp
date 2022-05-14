import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/providers.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class SprawTileWidget extends StatefulWidget{

  static const IconData ICON_SAVED = MdiIcons.eyeOutline;
  static const IconData ICON_IN_PROGRESS = MdiIcons.timerSandEmpty;
  static const IconData ICON_COMPLETED = MdiIcons.trophyOutline;

  final Spraw spraw;
  final String? groupName;
  final Function(Spraw spraw)? onPicked;

  const SprawTileWidget({required this.spraw, this.groupName, this.onPicked});

  @override
  State<StatefulWidget> createState() => SprawTileWidgetState();
}

class SprawTileWidgetState extends State<SprawTileWidget>{

  Spraw get spraw => widget.spraw;
  String? get groupName => widget.groupName;

  String get title => spraw.title;
  String get level => spraw.level;

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      ListTile(
        onTap: () => widget.onPicked!(spraw),
        title: Text(
            title,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
                color: textEnab_(context)
            )
        ),
        subtitle: LevelWidget(spraw, size: 16.0),
        leading: SizedBox(
          width: Dimen.ICON_FOOTPRINT,
          child: SprawIcon(
              spraw,
              size: SprawIcon.sizeSmall
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Consumer<CurrentSprawGroupProvider>(
              builder: (context, prov, child){
                if(spraw.inProgress)
                  return Text(
                    '${spraw.completenessPercent}%',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                        fontWeight: weight.halfBold,
                        color: hintEnab_(context)
                    ),
                  );

                return Container();
              },
            ),

            const SizedBox(width: 2*Dimen.ICON_MARG),

            Consumer<CurrentSprawGroupProvider>(
              builder: (context, prov, child) => SprawBookmarkWidget(
                  spraw,
                  onSavedChaned: (saved){
                    setState((){});
                  }
              ),
            ),

          ],
        ),
      ),

      Consumer<CurrentSprawGroupProvider>(
          builder: (context, prov, child) {

            if(spraw.completed)
              return Positioned(
                  top: -16,
                  right: 0,
                  child: IgnorePointer(
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(15 / 360),
                      child: Icon(
                        completeIcon,
                        color: backgroundIcon_(context),
                        size: 100.0,
                      ),
                    ),
                  )
              );

            return Container();

          }
      ),



    ],
  );

  IconData get completeIcon{
    switch(level){
      case '1': return MdiIcons.trophyOutline;
      case '2': return MdiIcons.trophy;
      case '3': return MdiIcons.trophyAward;
      default: return MdiIcons.trophyVariant;
    }
  }
}