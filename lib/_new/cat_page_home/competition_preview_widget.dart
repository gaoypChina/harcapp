import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/competition_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/_main.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_prompt.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'competitions/indiv_comp/indiv_comp_loader.dart';
import 'competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'competitions/indiv_comp/models/indiv_comp.dart';
import 'competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'competitions/indiv_comp/indiv_comp_widget_small.dart';
import 'competitions/start_widgets/indiv_comp_preview_grid.dart';
import 'competitions/start_widgets/indiv_comp_prompt_login.dart';

class CompetitionPreviewWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _CompetitionPreviewWidgetState();

}

class _CompetitionPreviewWidgetState extends State<CompetitionPreviewWidget>{

  IndivCompLoaderListener _listener;

  LoginProvider loginProvider;
  LoginProviderListener loginListener;

  @override
  void initState() {

    _listener = IndivCompLoaderListener(
      onIndivCompsLoaded: (List<IndivComp> profiles){
        Provider.of<IndivCompProvider>(context, listen: false).notify();
        Provider.of<IndivCompListProvider>(context, listen: false).notify();
      },
      onError: (dynamic _) async {

      }
    );

    indivCompLoader.addListener(_listener);

    loginListener = LoginProviderListener(
      onLogin: (emailConfirmed){
        if(emailConfirmed) indivCompLoader.run();
        else setState(() {});
      }
    );

    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.addLoginListener(loginListener);

    if(IndivComp.all == null && AccSecData.loggedIn)
      indivCompLoader.run();

    super.initState();
  }

  @override
  void dispose() {
    indivCompLoader.removeListener(_listener);
    loginProvider.removeLoginListener(loginListener);

    super.dispose();
  }

  List<Widget> getCompWidgets(){
    if(IndivComp.all == null)
      return [];

    List<Widget> children = [];
    for(IndivComp comp in IndivComp.allPinned)
      children.add(_IndivCompPreviewExtWidget(comp));

    return children;
  }

  @override
  Widget build(BuildContext context) {

    return Consumer2<LoginProvider, IndivCompListProvider>(
      builder: (context, loginProv, compProv, child){

        if(loginProv.loggedIn)
          return Column(
            children: [

              Padding(
                padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                child: TitleShortcutRowWidget(
                  title: 'Współzawodnictwa',
                  onOpen:
                  IndivComp.all != null ? (context) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompetitionsPage())
                  ):null,
                  trailing: Builder(
                    builder: (context){

                      if(IndivComp.all == null && !indivCompLoader.running)
                        return IconButton(
                          icon: Icon(MdiIcons.refresh),
                          onPressed: () => indivCompLoader.run(),
                        );

                      return Container();

                    },
                  )
                ),
              ),

              if(!AccSecData.emailConf)
                Padding(
                  padding: EdgeInsets.all(Dimen.SIDE_MARG),
                  child: SizedBox(
                    width: double.infinity,
                    child: EmptyMessageWidget(
                        text: 'Konto nie jest aktywowane.',
                        icon: MdiIcons.accountReactivateOutline
                    ),
                  ),
                )
              else if(IndivComp.all == null && indivCompLoader.running)
                IndivCompLoadingWidget()
              else if(IndivComp.all == null && !indivCompLoader.running)
                Padding(
                  padding: EdgeInsets.all(Dimen.SIDE_MARG),
                  child: SizedBox(
                    width: double.infinity,
                    child: EmptyMessageWidget(
                        text: 'Upsis...',
                        icon: MdiIcons.abacus
                    ),
                  ),
                )
              else if(IndivComp.all.isEmpty)
                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: SizedBox(
                      width: double.infinity,
                      child: EmptyMessageWidget(
                          text: 'Pusto...',
                          icon: MdiIcons.abacus
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: GridView.count(
                        crossAxisSpacing: Dimen.SIDE_MARG,
                        mainAxisSpacing: Dimen.SIDE_MARG,
                        clipBehavior: Clip.none,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: .5 * MediaQuery
                            .of(context)
                            .size
                            .width /
                            (IndivCompThumbnailWidget.defSize + 2 * Dimen
                                .SIDE_MARG),
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: getCompWidgets()
                    ),
                  )

            ],
          );
        else
          return Column(
            children: [

              Stack(
                children: [

                  Positioned.fill(
                    child: SimpleButton(
                      margin: EdgeInsets.zero,
                      radius: AppCard.BIG_RADIUS,
                      onTap: () => AccountPage.open(context),
                      child: Container(),
                    ),
                  ),

                  IgnorePointer(child: IndivCompPromptLogin()),

                ],
              ),

            ],
          );
      }
    );

  }

}

class IndivCompThumbnailAnimatedWidget extends StatefulWidget{

  final Duration delay;
  final String colorsKey;
  final String iconKey;

  const IndivCompThumbnailAnimatedWidget({@required this.delay, @required this.colorsKey, @required this.iconKey});

  @override
  State<StatefulWidget> createState() => IndivCompThumbnailAnimatedWidgetState();

}

class IndivCompThumbnailAnimatedWidgetState extends State<IndivCompThumbnailAnimatedWidget>{

  Duration get delay => widget.delay;
  String get colorsKey => widget.colorsKey;
  String get iconKey => widget.iconKey;

  void run() async {
    await Future.delayed(delay);
    if(!mounted) return;
    while(true){
      if(!mounted) return;
      controllerHorizontal.toggleCard();
      await Future.delayed(controllerHorizontal.state.controller.duration);
      await Future.delayed(Duration(milliseconds: 1200));
    }
  }

  FlipCardController controllerHorizontal;

  @override
  void initState() {

    run();

    controllerHorizontal = FlipCardController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget child = IndivCompThumbnailWidget.from(colorsKey: colorsKey, iconKey: iconKey);

    return FlipCard(
      front: child,
      back: child,
      controller: controllerHorizontal,
    );
  }

}

class IndivCompLoadingWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) => IndivCompPrompt(
      child: IndivCompPreviewGrid(),
      text: 'Ładowanie współzawodnictw...',
  );

}

class _IndivCompPreviewExtWidget extends StatelessWidget{

  final IndivComp comp;

  const _IndivCompPreviewExtWidget(this.comp);

  static const String _textPkt = 'pkt.';
  static TextStyle _textPktStyle = AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold);

  double calcTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SimpleButton(
          radius: AppCard.BIG_RADIUS,
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IndivCompPage(comp))
          ),
          child: Row(
            children: [
              IndivCompThumbnailWidget(comp, heroTag: comp),
              SizedBox(width: Dimen.SIDE_MARG),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AutoSizeText(comp.profile.points.toString(), style: AppTextStyle(fontSize: IndivCompWidgetSmall.textSizeVal, fontWeight: weight.bold)),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              if(constraints.maxWidth < 2.0 + calcTextWidth(_textPkt, _textPktStyle))
                                return Container();
                              return Padding(
                                padding: EdgeInsets.only(bottom: 6.0, left: 2.0),
                                child: Text(_textPkt, style: _textPktStyle, maxLines: 1),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    RankingWidget(comp, textSize: Dimen.TEXT_SIZE_BIG, textColor: hintEnab_(context))
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

}