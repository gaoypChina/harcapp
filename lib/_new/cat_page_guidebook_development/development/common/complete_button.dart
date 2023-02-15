import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/common/rank_spraw_template.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CompleteButton extends StatelessWidget{

  final RankSprawTemplate? data;
  final ConfettiController? confettiController;
  final Color color;
  final void Function()? onPressed;

  const CompleteButton(this.data, this.confettiController, {Key? key, required this.color, this.onPressed}): super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    heroTag: null,
    backgroundColor: color,
    child: Icon(MdiIcons.check, color: cardEnab_(context)),
    onPressed: (){
      data!.setCompletionDate(DateTime.now(), localOnly: true);
      data!.changeCompleted(context, value: true);
      confettiController!.play();
      onPressed?.call();
    },
  );

}