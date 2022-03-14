import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/spraw_task_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/claim_button.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/complete_button.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/rank_spraw_temp_widget.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';
import '../models/spraw_book.dart';
import '../models/spraw_task.dart';


class SprawWidget extends StatefulWidget{
  
  final Spraw spraw;
  final bool showBack;
  final bool iconHeroTag;

  final void Function() onClaimed;
  final void Function() onSaveChanged;
  final void Function() onReqComplChanged;
  final void Function() onCompleted;
  final void Function() onAbandoned;
  final void Function(bool) onStartStop;

  const SprawWidget(this.spraw, {this.showBack = true, this.iconHeroTag = false, this.onClaimed, this.onSaveChanged, this.onReqComplChanged, this.onCompleted, this.onAbandoned, this.onStartStop});

  @override
  State<StatefulWidget> createState() => SprawWidgetState();

}

class SprawWidgetState extends State<SprawWidget> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.sprawnosci;

  Spraw get spraw => widget.spraw;
  bool get showBack => widget.showBack;

  void Function() get onClaimed => widget.onClaimed;
  void Function() get onSaveChanged => widget.onSaveChanged;
  void Function() get onReqComplChanged => widget.onReqComplChanged;

  void Function() get onCompleted => widget.onCompleted;
  void Function() get onAbandoned => widget.onAbandoned;
  void Function(bool) get onStartStop => widget.onStartStop;

  ConfettiController confettiController;

  @override
  void initState() {
    confettiController = ConfettiController(duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return RankSprawTempWidget(
      title: spraw.title,
      color: SprawBookData.mapIdColorMap[spraw.sprawBook.id].avgColor(false),

      completedText: 'Sprawność zdobyta!',

      titleTrailing:
      widget.iconHeroTag?
      Hero(
        tag: spraw.iconPath,
        child: TrailingWidget(spraw),
      ):
      TrailingWidget(spraw),

      underTitleLeading: LevelWidget(spraw),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          RequirementsWidget(
            spraw,
            onChanged: (){
              Provider.of<SprawInProgressListProv>(context, listen: false).notify();
              setState(() {});
              if(widget.onReqComplChanged != null) widget.onReqComplChanged();
            },
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          if(spraw.comment != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
                  child: Text(
                    'Komentarz',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                        fontWeight: weight.halfBold
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: AppText(
                    spraw.comment,
                    size: Dimen.TEXT_SIZE_BIG,
                  ),
                )

              ],
            ),

        ],
      ),
      floatingButton: buildFloatingButton(),
      backgroundIcon: SprawBookData.mapIdIconMap[spraw.sprawBook.id],
      backgroundIconComplete: MdiIcons.trophyVariant,

      inProgress: spraw.inProgress,
      completenessPercent: spraw.completenessPercent,
      isReadyToComplete: spraw.isReadyToComplete,
      completed: spraw.completed,
      completedDate: spraw.completionDate,
      onCompleteDateChanged: (DateTime dateTime) => setState(() => spraw.setCompletionDate(dateTime)),

      onStartStopTap: (bool inProgress){
          setState(() => spraw.changeInProgress(context, value: !inProgress));
          onStartStop?.call(inProgress);
      },
      onAbandonTap: (){
        spraw.changeCompleted(context);
        //spraw.changeInProgress(context);
        onAbandoned?.call();
        setState(() {});
      },

      showAppBar: showBack,
      confettiController: confettiController,
    );
  }

  Widget buildFloatingButton(){

    bool showComplete = spraw.isReadyToComplete && !spraw.completed && spraw.inProgress;
    bool showClaim = !spraw.inProgress && !spraw.completed;

    return Stack(
      children: [

        Column(
          children: [

            Stack(
              children: [

                AnimatedOpacity(
                  opacity: showComplete?1:0,
                  duration: const Duration(milliseconds: 300),
                  child: IgnorePointer(
                    ignoring: !showComplete,
                    child: CompleteButton(
                      spraw,
                      confettiController,
                      color: SprawBookData.mapIdColorMap[spraw.sprawBook.id].avgColor(false),
                      onPressed: (){
                        onCompleted?.call();
                        setState((){});
                      },
                    ),
                  ),
                ),

                AnimatedOpacity(
                  opacity: showClaim?1:0,
                  duration: const Duration(milliseconds: 300),
                  child: IgnorePointer(
                    ignoring: !showClaim,
                    child: ClaimButton(
                      spraw,
                      color: SprawBookData.mapIdColorMap[spraw.sprawBook.id].avgColor(false),
                      confettiController: confettiController,
                      onClaimed: (){
                        setState(() {});
                        onClaimed?.call();
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: Dimen.FLOATING_BUTTON_MARG),

            SaveFloatingButton(
              spraw,
              SprawBookData.mapIdColorMap[spraw.sprawBook.id].avgColor(false),
              onTap: () => onSaveChanged?.call(),
            ),

          ],
        )



      ],
    );

  }

}

class RequirementsWidget extends StatelessWidget{

  final Spraw spraw;
  final void Function() onChanged;

  const RequirementsWidget(this.spraw, {this.onChanged});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<spraw.tasks.length; i++){
      Widget child = SprawTaskWidget(
        spraw.tasks[i],
        onCompletedChanged: (SprawTask _task, bool selected) => onChanged?.call()
      );

      children.add(child);

      if(i != spraw.tasks.length-1)
        children.add(const SizedBox(height: 2*Dimen.ICON_MARG));
    }

    return Column(children: children);
  }

}


class SaveFloatingButton extends StatefulWidget{

  final Spraw spraw;
  final Color color;
  final void Function() onTap;

  const SaveFloatingButton(this.spraw, this.color, {this.onTap});

  @override
  State<StatefulWidget> createState() => SaveFloatingButtonState();

}

class SaveFloatingButtonState extends State<SaveFloatingButton>{

  Spraw get spraw => widget.spraw;
  Color get color => widget.color;
  void Function() get onTap => widget.onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: color,
      foregroundColor: background_(context),
      child: SprawBookmarkWidget(
          spraw,
          color: background_(context),
          onSavedChaned: (saved){
            setState((){});
            onTap?.call();
          }),
      onPressed: null,
      clipBehavior: Clip.hardEdge,
    );
  }

}

class TrailingWidget extends StatelessWidget{

  final Spraw spraw;

  const TrailingWidget(this.spraw);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SprawIcon(
          spraw,
          size: SprawIcon.sizeBig,
          onTap: ()async{

            try {
              await rootBundle.loadString(spraw.iconPath);
              await openDialog(
                  context: context,
                  builder: (context) => AppScaffold(
                      appBar: AppBar(elevation: 0, title: Text(spraw.title), centerTitle: true,),
                      body: Center(
                        child: Material(
                          color: Colors.transparent,
                          child: Hero(
                              tag: spraw.iconPath,
                              child: SprawIcon(
                                spraw,
                                size: MediaQuery.of(context).size.shortestSide,
                              )
                          ),
                        ),
                      )
                  )
              );
            } catch(_) {
              showAppToast(context, text: 'Oczywiście ta grafika to pic.');
            }
          }
      ),
    );
  }

}