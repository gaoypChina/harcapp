import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/start_end_button.dart';
import 'package:harcapp/_common_widgets/confetti_layer.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'abandon_button.dart';
import 'completed_widget.dart';


class RankSprawTempWidget extends StatelessWidget{

  static const double trailingSize = 64.0;

  final String title;
  final String? titleAppBar;
  final Color color;

  final String completedText;
  final Color? completedTextColor;

  final Widget? titleTrailing;

  final Widget? underTitleLeading;
  final Widget child;
  final Widget? floatingButton;
  final IconData? backgroundIcon;
  final IconData? backgroundIconComplete;

  final bool inProgress;
  final int completenessPercent;
  final bool isReadyToComplete;
  final bool? completed;
  final DateTime? completedDate;
  final void Function(DateTime)? onCompleteDateChanged;

  final void Function(bool inProgress)? onStartStopTap;
  final void Function()? onAbandonTap;

  final bool showAppBar;
  final ConfettiController? confettiController;
  final List<Widget>? actions;
  final PreferredSizeWidget? appBarBottom;

  final bool previewOnly;

  const RankSprawTempWidget({
    required this.title,
    this.titleAppBar,
    required this.color,
    required this.completedText,
    this.completedTextColor,
    this.titleTrailing,
    this.underTitleLeading,
    required this.child,
    this.floatingButton,

    this.backgroundIcon,
    this.backgroundIconComplete,

    required this.completenessPercent,
    required this.inProgress,
    required this.isReadyToComplete,
    required this.completed,
    required this.completedDate,
    required this.onCompleteDateChanged,

    required this.onStartStopTap,
    required this.onAbandonTap,

    this.showAppBar = false,
    required this.confettiController,
    this.actions,
    this.appBarBottom,

    this.previewOnly = false,
    super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => _ReachedTopProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => _ReachedBottomProvider()),
      ],
      builder: (context, _) => Stack(
        children: [

          if(backgroundIcon != null)
            Positioned(
              bottom: -0.1*screenWidth,
              right: -0.15*screenWidth,
              child: AnimatedOpacity(
                opacity: completed!?0:1,
                curve: Curves.easeOutQuart,
                duration: const Duration(milliseconds: 1000),
                child: Icon(
                  backgroundIcon,
                  color: backgroundIcon_(context),
                  size: screenWidth,
                ),
              ),
            ),

          if(backgroundIconComplete != null)
            Positioned(
              bottom: -0.1*screenWidth,
              right: -0.15*screenWidth,
              child: AnimatedOpacity(
                opacity: completed!?1:0,
                curve: Curves.easeOutQuart,
                duration: const Duration(milliseconds: 1000),
                child: Icon(
                  backgroundIconComplete,
                  color: backgroundIcon_(context),
                  size: screenWidth,
                ),
              ),
            ),

          NotificationListener<ScrollNotification>(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                if(showAppBar)
                  SliverAppBar(
                    title: Consumer<_ReachedTopProvider>(
                      builder: (context, prov, child) => AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: prov.reachedTop!?0:1,
                        child: Text(titleAppBar??title, textAlign: TextAlign.center),
                      ),
                    ),
                    centerTitle: true,
                    //backgroundColor: Colors.transparent,
                    floating: true,
                    elevation: appBarBottom==null?null:0,
                    actions: actions,
                  ),

                if(!previewOnly)
                  FloatingContainer(
                    builder: (context, __, _) => Padding(
                      padding: const EdgeInsets.all(Dimen.DEF_MARG),
                      child: appBarBottom,
                    ),
                    height: (appBarBottom?.preferredSize.height??0) + 2*Dimen.DEF_MARG,
                    rebuild: true,
                  ),

                SliverPadding(
                  padding: EdgeInsets.only(
                      left: Dimen.SIDE_MARG,
                      right: Dimen.SIDE_MARG,
                      bottom: (!previewOnly?kToolbarHeight:0) + Dimen.SIDE_MARG
                  ),
                  sliver: SliverList(delegate: SliverChildListDelegate([

                    const SizedBox(height: Dimen.SIDE_MARG),

                    Row(
                      children: [

                        if(titleTrailing != null)
                          const SizedBox(width: trailingSize),

                        const SizedBox(width: 6.0, height: trailingSize),

                        Expanded(
                          child: AutoSizeText(title,
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(width: 6.0),

                        if(titleTrailing != null)
                          SizedBox(
                            height: trailingSize,
                            width: trailingSize,
                            child: titleTrailing,
                          ),
                      ],
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    Row(
                      children: [
                        const SizedBox(height: Dimen.ICON_FOOTPRINT + 2*SimpleButton.DEF_MARG),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimen.ICON_FOOTPRINT),
                          child: underTitleLeading,
                        ),

                        Expanded(child: Container()),

                        if(completed!)
                          SimpleButton.from(
                              context: context,
                              icon: MdiIcons.calendarCheckOutline,
                              text: dateToString(completedDate!, shortMonth: true),
                              onTap: () async {
                                DateTime? dateTime = await showDatePicker(
                                    context: context,
                                    helpText: 'Data zdobycia sprawności',
                                    initialDate: completedDate??DateTime(966),
                                    firstDate: DateTime(966),
                                    lastDate: DateTime.now()
                                );
                                if(dateTime == null) return;
                                onCompleteDateChanged?.call(dateTime);
                              }
                          )
                      ],
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    child,

                  ])),
                )

              ],
            ),
            onNotification: (ScrollNotification scrollInfo) {

              _ReachedTopProvider provTop = Provider.of<_ReachedTopProvider>(context, listen: false);
              _ReachedBottomProvider provBottom = Provider.of<_ReachedBottomProvider>(context, listen: false);

              if(scrollInfo.metrics.pixels <= kToolbarHeight) {
                if (!provTop.reachedTop!) provTop.reachedTop = true;
              }else {
                if (provTop.reachedTop!) provTop.reachedTop = false;
              }

              if(scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent-1) {
                if (!provBottom.reachedBottom!) provBottom.reachedBottom = true;
              }else {
                if (provBottom.reachedBottom!) provBottom.reachedBottom = false;
              }

              return false;
            },
          ),

          if(!previewOnly && floatingButton != null)
            Positioned(
                bottom: kToolbarHeight + Dimen.FLOATING_BUTTON_MARG,
                right: Dimen.FLOATING_BUTTON_MARG,
                child: floatingButton!
            ),

          if(!previewOnly)
            Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: AppBar().preferredSize.height,
              child: completed!?
              Consumer<_ReachedBottomProvider>(
                builder: (context, prov, child) => AnimatedChildSlider(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeOutExpo,
                  switchOutCurve: Curves.easeOutExpo,
                  index: prov.reachedBottom!?1:0,
                  direction: Axis.horizontal,
                  children: [
                    CompletedWidget(
                      completedText,
                      color,
                      colorText: completedTextColor??background_(context),
                      onPressed: () => confettiController!.play(),
                    ),

                    AbandonButton(
                      onTap: onAbandonTap,
                    ),
                  ],
                ),
              ):
              StartStopButton(
                color: color,
                inProgress: () => inProgress,
                completenessPercent: () => completenessPercent,
                onPressed: (bool inProgress){
                  onStartStopTap?.call(inProgress);
                  if(!inProgress) // if start
                    Provider.of<_ReachedBottomProvider>(context, listen: false).reachedBottom = false;
                },
              ),
            ),
          ),

          if(!previewOnly)
            Positioned.fill(
            child: ConfettiLayer(confettiController),
          ),

        ],
      )
    );


  }

}

class _ReachedTopProvider extends ChangeNotifier{

  bool? _reachedTop;
  bool? get reachedTop => _reachedTop;
  set reachedTop(bool? value){
    _reachedTop = value;
    notifyListeners();
  }

  _ReachedTopProvider(){
    _reachedTop = true;
  }

}

class _ReachedBottomProvider extends ChangeNotifier{

  bool? _reachedBottom;
  bool? get reachedBottom => _reachedBottom;
  set reachedBottom(bool? value){
    _reachedBottom = value;
    notifyListeners();
  }

  _ReachedBottomProvider(){
    _reachedBottom = false;
  }

}