import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/providers.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/widgets/spraw_tile_template_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class SprawTileWidget extends StatefulWidget{

  static const IconData ICON_SAVED = MdiIcons.eyeOutline;
  static const IconData ICON_IN_PROGRESS = MdiIcons.timerSandEmpty;
  static const IconData ICON_COMPLETED = MdiIcons.trophyOutline;

  final Spraw spraw;
  final EdgeInsets padding;
  final Function(Spraw spraw)? onPicked;

  const SprawTileWidget({required this.spraw, this.padding = EdgeInsets.zero, this.onPicked, super.key});

  @override
  State<StatefulWidget> createState() => SprawTileWidgetState();
}

class SprawTileWidgetState extends State<SprawTileWidget>{

  Spraw get spraw => widget.spraw;
  EdgeInsets get padding => widget.padding;

  String get title => spraw.title;
  String get level => spraw.level;

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      SprawTileTemplateWidget(
        spraw: spraw,
        padding: padding,
        onTap: () => widget.onPicked!(spraw),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Consumer<CurrentSprawGroupProvider>(
              builder: (context, prov, child){
                if(spraw.inProgress)
                  return SprawTileProgressWidget(spraw: spraw);

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