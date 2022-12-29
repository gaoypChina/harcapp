
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_completed_task_page/indiv_comp_completed_task_widget.dart';
import 'package:harcapp_core/dimen.dart';

import '../models/indiv_comp.dart';
import '../models/indiv_comp_task_compl.dart';


class PendingCompletedTasksPage extends StatefulWidget{

  final IndivComp comp;
  final List<IndivCompCompletedTask>? complTasks;
  final void Function(IndivCompCompletedTask)? onRemoved;

  const PendingCompletedTasksPage(this.comp, this.complTasks, {this.onRemoved, super.key});

  @override
  State<StatefulWidget> createState() => PendingCompletedTasksPageState();

}

class PendingCompletedTasksPageState extends State<PendingCompletedTasksPage> {

  IndivComp get comp => widget.comp;

  List<IndivCompCompletedTask>? get complTasks => widget.complTasks;

  void Function(IndivCompCompletedTask)? get onRemoved => widget.onRemoved;

  @override
  Widget build(BuildContext context) =>
      BottomNavScaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            
            const SliverAppBar(
              floating: true,
              title: Text('Prośby o zaliczenie'),
              centerTitle: true,
            ),

            SliverPadding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(
                delegate: SliverChildSeparatedBuilderDelegate((context, index) =>
                    IndivCompCompletedTaskWidget(
                        complTasks![index],
                        comp.taskMap,
                        comp.colors,
                        preview: true,
                        onRemoved: (text) {
                          IndivCompCompletedTask complTask = complTasks!.removeAt(index);
                          onRemoved?.call(complTask);
                          if (complTasks!.isEmpty) {
                            Navigator.pop(context);
                            return;
                          }
                          if (mounted) setState(() {});
                        }
                    ),
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                  count: complTasks!.length,
                ),
              ),
            )
          ],
        ),
      );
}