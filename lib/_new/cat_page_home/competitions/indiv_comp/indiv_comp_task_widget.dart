import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_widget.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

import 'common/indiv_comp_task_skeleton_widget.dart';
import 'models/indiv_comp_task.dart';

class IndivCompTaskWidget extends StatelessWidget{

  final IndivCompTask task;
  final Widget? bottom;

  const IndivCompTaskWidget(this.task, {this.bottom, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => IndivCompTaskSkeletonWidget(
    elevation: AppCard.bigElevation,
    trailing: PointsWidget(points: task.points, prefix: '+',),
    title: Text(task.title, style: IndivCompTaskSkeletonWidget.titleTextStyle(context)),
    description: Text(task.description!, style: IndivCompTaskSkeletonWidget.descriptionTextStyle(context)),
    bottom: bottom,
  );

}