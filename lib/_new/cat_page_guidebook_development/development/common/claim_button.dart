import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/common/rank_spraw_template.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ClaimButton extends StatelessWidget{

  final RankSprawTemplate? spraw;
  final Color? color;
  final ConfettiController? confettiController;
  final void Function()? onClaimed;

  const ClaimButton(this.spraw, {this.color, this.confettiController, this.onClaimed, super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    heroTag: null,
    backgroundColor: cardEnab_(context),
    foregroundColor: color,
    child: Icon(
        MdiIcons.checkCircleOutline
    ),
    onPressed: (){
      spraw!.setCompletionDate(DateTime.now(), localOnly: true);
      spraw!.changeCompleted(context, value: true);
      confettiController!.play();
      onClaimed?.call();

    },
  );

}