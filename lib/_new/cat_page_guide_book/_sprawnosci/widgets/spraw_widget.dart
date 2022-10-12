import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/spraw_task_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/claim_button.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/complete_button.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/rank_spraw_temp_widget.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_guide_book/providers.dart';
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

  final void Function()? onClaimed;
  final void Function()? onSaveChanged;
  final void Function()? onReqComplChanged;
  final void Function()? onCompleted;
  final void Function()? onAbandoned;
  final void Function(bool)? onStartStop;

  final void Function()? onStateChanged;

  const SprawWidget(
      this.spraw,
      { this.showBack = true,
        this.iconHeroTag = false,
        this.onClaimed,
        this.onSaveChanged,
        this.onReqComplChanged,
        this.onCompleted,
        this.onAbandoned,
        this.onStartStop,

        this.onStateChanged,

        super.key
      });

  @override
  State<StatefulWidget> createState() => SprawWidgetState();

}

class SprawWidgetState extends State<SprawWidget> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.sprawnosci;

  Spraw get spraw => widget.spraw;
  bool get showBack => widget.showBack;

  void onClaimed(){
    widget.onClaimed?.call();
    onStateChanged?.call();
  }
  void onSaveChanged(){
    widget.onSaveChanged?.call();
    onStateChanged?.call();
  }
  void onReqComplChanged(){
    widget.onReqComplChanged?.call();
    onStateChanged?.call();
  }

  void onCompleted(){
    widget.onCompleted?.call();
    onStateChanged?.call();
  }
  void onAbandoned(){
    widget.onAbandoned?.call();
    onStateChanged?.call();
  }
  void onStartStop(bool value){
    widget.onStartStop?.call(value);
    onStateChanged?.call();
  }

  void Function()? get onStateChanged => widget.onStateChanged;

  late ConfettiController confettiController;

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
  Widget build(BuildContext context) => RankSprawTempWidget(
    title: spraw.title,
    color: SprawBookData.mapIdColorMap[spraw.sprawBook.id]!.avgColor(false),

    completedText: 'Sprawność zdobyta!',

    titleTrailing:
    widget.iconHeroTag?
    Hero(
      tag: spraw.iconPath,
      child: TrailingWidget(spraw),
    ):
    TrailingWidget(spraw),

    underTitleLeading: LevelWidget(spraw),
    floatingButton: buildFloatingButton(),
    // backgroundIcon: SprawBookData.mapIdIconMap[spraw.sprawBook.id],
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
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        if(spraw.requirements != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
                child: Text(
                  'Wymagania ogólne',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.halfBold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: Dimen.defMarg,
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                ),
                child: Builder(
                  builder: (context){

                    List<Widget> children = [];

                    for(int i=0; i<spraw.requirements!.length; i++){
                      String req = spraw.requirements![i];
                      children.add(Text(
                        'Wymaganie ${i+1}.',
                        style: AppTextStyle(
                          fontSize: Dimen.SIDE_MARG,
                          fontWeight: weight.halfBold,
                        ),
                      ));
                      children.add(AppText(
                        req,
                        size: Dimen.TEXT_SIZE_BIG,
                      ));

                      if(i < spraw.requirements!.length - 1)
                        children.add(const SizedBox(height: Dimen.ICON_MARG));
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: children,
                    );

                  },
                ),
              )

            ],
          ),

        if(spraw.requirements != null)
          const SizedBox(height: 2*Dimen.SIDE_MARG),

        if(spraw.requirements != null)
          Icon(
            MdiIcons.circleMedium,
            color: hintEnab_(context),
          ),

        if(spraw.requirements != null)
          const SizedBox(height: 2*Dimen.SIDE_MARG),

        RequirementsWidget(
          spraw,
          onChanged: (){
            Provider.of<SprawInProgressListProv>(context, listen: false).notify();
            setState(() {});
            if(widget.onReqComplChanged != null) widget.onReqComplChanged!();
          },
        ),

        if(spraw.comment != null)
          const SizedBox(height: 2*Dimen.SIDE_MARG),

        if(spraw.comment != null)
          Icon(
            MdiIcons.circleMedium,
            color: hintEnab_(context),
          ),

        if(spraw.comment != null)
          const SizedBox(height: 2*Dimen.SIDE_MARG),

        if(spraw.comment != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
                child: Text(
                  'Komentarz',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.halfBold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: Dimen.defMarg,
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                ),
                child: AppText(
                  spraw.comment!,
                  size: Dimen.TEXT_SIZE_BIG,
                ),
              )

            ],
          ),

        if(spraw.notesForLeaders != null)
          const SizedBox(height: 2*Dimen.SIDE_MARG),

        if(spraw.notesForLeaders != null)
          Icon(
            MdiIcons.circleMedium,
            color: hintEnab_(context),
          ),

        if(spraw.notesForLeaders != null)
          const SizedBox(height: 2*Dimen.SIDE_MARG),

        if(spraw.notesForLeaders != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
                child: Text(
                  'Dla drużynowego',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.halfBold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: Dimen.defMarg,
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.SIDE_MARG,
                ),
                child: Builder(
                  builder: (context){

                    List<Widget> children = [];

                    for(int i=0; i<spraw.notesForLeaders!.length; i++){
                      String note = spraw.notesForLeaders![i];
                      children.add(AppText(
                        note,
                        size: Dimen.TEXT_SIZE_BIG,
                      ));

                      if(i < spraw.notesForLeaders!.length - 1)
                        children.add(const SizedBox(height: Dimen.ICON_MARG));
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: children,
                    );

                  },
                ),
              )

            ],
          ),

        if(spraw.notesForLeaders != null)
          const SizedBox(height: Dimen.SIDE_MARG),

      ],
    ),
  );

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
                      color: SprawBookData.mapIdColorMap[spraw.sprawBook.id]!.avgColor(false),
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
                      color: SprawBookData.mapIdColorMap[spraw.sprawBook.id]!.avgColor(false),
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
              SprawBookData.mapIdColorMap[spraw.sprawBook.id]!.avgColor(false),
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
  final void Function()? onChanged;

  const RequirementsWidget(this.spraw, {this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<spraw.tasks!.length; i++){
      Widget child = SprawTaskWidget(
        spraw.tasks![i],
        isExample: spraw.tasksAreExamples,
        onCompletedChanged: (SprawTask _task, bool selected) => onChanged?.call()
      );

      children.add(child);

      if(i != spraw.tasks!.length-1)
        children.add(const SizedBox(height: 2*Dimen.ICON_MARG));
    }

    return Column(children: children);
  }

}


class SaveFloatingButton extends StatefulWidget{

  final Spraw? spraw;
  final Color color;
  final void Function()? onTap;

  const SaveFloatingButton(this.spraw, this.color, {this.onTap, super.key});

  @override
  State<StatefulWidget> createState() => SaveFloatingButtonState();

}

class SaveFloatingButtonState extends State<SaveFloatingButton>{

  Spraw? get spraw => widget.spraw;
  Color get color => widget.color;
  void Function()? get onTap => widget.onTap;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    heroTag: null,
    backgroundColor: color,
    foregroundColor: background_(context),
    onPressed: null,
    clipBehavior: Clip.hardEdge,
    child: SprawBookmarkWidget(
        spraw,
        color: background_(context),
        onSavedChaned: (saved){
          setState((){});
          onTap?.call();
        }),
  );

}

class TrailingWidget extends StatelessWidget{

  final Spraw? spraw;

  const TrailingWidget(this.spraw, {super.key});

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: SprawIcon(
        spraw,
        size: SprawIcon.sizeBig,
        onTap: ()async{

          try {
            await rootBundle.loadString(spraw!.iconPath);
            await openDialog(
                context: context,
                builder: (context) => AppScaffold(
                    appBar: AppBar(elevation: 0, title: Text(spraw!.title), centerTitle: true,),
                    body: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: Hero(
                            tag: spraw!.iconPath,
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