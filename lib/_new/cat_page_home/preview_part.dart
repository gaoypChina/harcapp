import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_loader.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../_common_widgets/harc_app.dart';
import '../api/circle.dart';
import 'community/circle/announcements_sliver.dart';
import 'community/circle/model/announcement.dart';
import 'community/circle/model/circle.dart';
import 'competitions/indiv_comp/indiv_comp_preview_widget.dart';

class PreviewPart extends StatefulWidget{

  final void Function()? onCompHeaderOpen;
  final void Function()? onAllAnnouncementsHeaderOpen;
  final void Function(Circle)? onCircleTap;

  const PreviewPart({this.onCompHeaderOpen, this.onAllAnnouncementsHeaderOpen, this.onCircleTap, super.key});

  @override
  State<StatefulWidget> createState() => PreviewPartState();

}

class PreviewPartState extends State<PreviewPart>{

  void Function()? get onCompHeaderOpen => widget.onCompHeaderOpen;
  void Function()? get onAllAnnouncementsHeaderOpen => widget.onAllAnnouncementsHeaderOpen;
  void Function(Circle)? get onCircleTap => widget.onCircleTap;

  late RefreshController refreshController;
  late ScrollController scrollController;

  late int loadedPage;
  late bool moreToLoad;

  bool get shouldScroll => AccountData.loggedIn;

  late IndivCompLoaderListener indivCompLoaderListener;

  late LoginListener loginListener;

  @override
  void initState() {

    indivCompLoaderListener = IndivCompLoaderListener(
      onStart: () => setState((){}),
      onIndivCompsLoaded: (loadedIndivComps) => setState((){}),
      onError: (_) => setState((){}),
    );
    indivCompLoader.addListener(indivCompLoaderListener);

    loginListener = LoginListener(
      onForceLogout: () => Provider.of<LoginProvider>(context, listen: false).notify()
    );

    AccountData.addLoginListener(loginListener);

    scrollController = ScrollController();
    refreshController = RefreshController(initialRefresh: AccountData.loggedIn && Announcement.all == null);

    loadedPage = -1;
    moreToLoad = true;

    super.initState();
  }

  @override
  void dispose(){
    indivCompLoader.removeListener(indivCompLoaderListener);
    AccountData.removeLoginListener(loginListener);

    scrollController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer3<LoginProvider, IndivCompListProvider, CircleListProvider>(
    builder: (context, loginProv, indivCompListProv, circleListProv, child) => ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: SmartRefresher(
          enablePullDown: AccountData.loggedIn,
          physics:
          shouldScroll?
          const BouncingScrollPhysics():
          const AlwaysScrollableScrollPhysics(),

          header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
          controller: refreshController,
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode){
              Widget body;
              if(!moreToLoad)
                body = Announcement.all!.isEmpty?
                Container():
                Icon(MdiIcons.circleMedium, color: hintEnab_(context));

              else if(mode == LoadStatus.idle)
                body = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(MdiIcons.arrowUp),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text(
                        'Przeciągnij, by załadować kolejne',
                        style: AppTextStyle()
                    ),
                  ],
                );

              else if(mode == LoadStatus.loading)
                body = SpinKitDualRing(
                  color: iconEnab_(context),
                  size: Dimen.ICON_SIZE,
                );

              else if(mode == LoadStatus.failed)
                body = Text("Coś poszło nie tak!", style: AppTextStyle());

              else if(mode == LoadStatus.canLoading)
                body = Text("Puść, by załadować", style: AppTextStyle());

              else
                body = Text(
                  'Nie wiem co tu wyświtlić',
                  style: AppTextStyle(),
                );

              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),

          onRefresh: () async {

            if(!await isNetworkAvailable()){
              showAppToast(context, text: 'Brak dostępu do Internetu');
              refreshController.refreshCompleted();
              return;
            }

            await ApiCircle.getFeedAnnouncements(
                page: 0,
                onSuccess: (List<Announcement> newFeedAnnouncements) async {

                  Announcement.init(newFeedAnnouncements, context: mounted?context:null);
                  if(!mounted) return;

                  loadedPage = 0;
                  moreToLoad = newFeedAnnouncements.length == Announcement.feedPageSize;
                  setState((){});
                },
                onServerMaybeWakingUp: () {
                  if(!mounted) return true;
                  showServerWakingUpToast(context);
                  setState((){});
                  return true;
                },
                onForceLoggedOut: (){
                  if(!mounted) return true;
                  showAppToast(context, text: forceLoggedOutMessage);
                  setState(() {});
                  return true;
                },
                onError: (){
                  if(!mounted) return;
                  showAppToast(context, text: simpleErrorMessage);
                  setState((){});
                }
            );

            if(mounted) refreshController.refreshCompleted();

          },
          onLoading: () async {

            AnnouncementListProvider annListProv = Provider.of<AnnouncementListProvider>(context, listen: false);

            if(!moreToLoad) {
              refreshController.loadComplete();
              return;
            }

            if(!await isNetworkAvailable()){
              showAppToast(context, text: 'Brak dostępu do Internetu');
              refreshController.loadComplete();
              return;
            }

            await ApiCircle.getFeedAnnouncements(
                page: loadedPage + 1,
                onSuccess: (nextAnnouncements){

                  int i;
                  for(i=0; i<nextAnnouncements.length; i++)
                    if(!Announcement.allMap!.containsKey(nextAnnouncements[i].key)) break;

                  Announcement.addListToAll(
                      nextAnnouncements.sublist(i),
                      context: mounted?context:null
                  );

                  if(!mounted) return;

                  loadedPage += 1;

                  if(mounted) annListProv.notify();

                  if(nextAnnouncements.length != Announcement.feedPageSize)
                    moreToLoad = false;

                  setState((){});

                },
                onServerMaybeWakingUp: () {
                  if(!mounted) return true;
                  showServerWakingUpToast(context);
                  setState((){});
                  return true;
                },
                onForceLoggedOut: (){
                  if(!mounted) return true;
                  showAppToast(context, text: forceLoggedOutMessage);
                  setState(() {});
                  return true;
                },
                onError: (){
                  if(!mounted) return;
                  showAppToast(context, text: simpleErrorMessage);
                  setState((){});
                }
            );

            refreshController.loadComplete();

          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              SliverAppBar(
                backgroundColor: background_(context),
                title: const HarcApp(size: Dimen.TEXT_SIZE_APPBAR),
                floating: true,
                centerTitle: true,
                pinned: !shouldScroll,
              ),

              if(!AccountData.loggedIn)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: NotLoggedInWidget(),
                ),

              if(AccountData.loggedIn)
                SliverList(delegate: SliverChildListDelegate([

                  if(IndivComp.all == null || IndivComp.all!.isNotEmpty)
                    Row(
                      children: [

                        const SizedBox(width: Dimen.SIDE_MARG),

                        Expanded(
                          child: Text(
                            'Współzawodnictwa',
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                fontWeight: weight.halfBold
                            ),
                          ),
                        ),

                        IconButton(
                          icon: const Icon(MdiIcons.arrowRight),
                          onPressed: onCompHeaderOpen,
                        )

                      ],
                    ),


                  if(IndivComp.all == null && indivCompLoader.running)
                    const Padding(
                      padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, bottom: Dimen.SIDE_MARG),
                      child: IndivCompRowLoadingWidget(),
                    )
                  else if (IndivComp.all == null && !indivCompLoader.running)
                    const Padding(
                      padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, bottom: Dimen.SIDE_MARG),
                      child: IndivCompRowProblemWidget(),
                    )
                  // else if(IndivComp.all!.isEmpty)
                  //   const IndivCompRowEmptyWidget()
                  else if(IndivComp.all!.isNotEmpty)
                      const IndivCompRowPreviewWidget(
                        padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, bottom: Dimen.SIDE_MARG),
                      ),

                  if(IndivComp.all != null && IndivComp.all!.isNotEmpty)
                      const SizedBox(height: Dimen.SIDE_MARG),

                  Row(
                    children: [

                      const SizedBox(width: Dimen.SIDE_MARG),

                      Expanded(
                        child: Text(
                          'Kręgi i ogłoszenia',
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_BIG,
                              fontWeight: weight.halfBold
                          ),
                        ),
                      ),

                      IconButton(
                        icon: const Icon(MdiIcons.arrowRight),
                        onPressed: onAllAnnouncementsHeaderOpen,
                      )

                    ],
                  ),

                ])),

              if(AccountData.loggedIn)
                getAnnouncementsSliver(
                  context,
                  Announcement.all??[],
                  showCircleButton: true,
                  onCircleButtonTap: (circle) => onCircleTap?.call(circle),
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  loading: indivCompLoader.running,
                  onAnnouncementUpdated: () => setState((){}),
                )

            ],
          )
      ),
    ),
  );

}

class IndivCompAutoRotatThumbnail extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => IndivCompAutoRotatThumbnailState();

}

class IndivCompAutoRotatThumbnailState extends State<IndivCompAutoRotatThumbnail>{

  late String iconFrontKey;
  late String iconBackKey;

  late String colorsDataFrontKey;
  late String colorsDataBackKey;

  late FlipCardController controller;

  void autoRotate() async {
    while(mounted){
      await Future.delayed(const Duration(seconds: 1));
      if(!mounted) return;
      controller.toggleCard();
      iconBackKey = CommonIconData.randomKey;
      colorsDataBackKey = CommonColorData.randomKey;
      setState((){});

      await Future.delayed(const Duration(seconds: 1));

      if(!mounted) return;
      controller.toggleCard();
      iconFrontKey = CommonIconData.randomKey;
      colorsDataFrontKey = CommonColorData.randomKey;
      setState((){});

    }
  }

  @override
  void initState() {
    controller = FlipCardController();
    iconFrontKey = CommonIconData.randomKey;
    iconBackKey = CommonIconData.randomKey;

    colorsDataFrontKey = CommonColorData.randomKey;
    colorsDataBackKey = CommonColorData.randomKey;

    autoRotate();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FlipCard(
    front: IndivCompThumbnailWidget(iconKey: iconFrontKey, colorsKey: colorsDataFrontKey),
    back: IndivCompThumbnailWidget(iconKey: iconBackKey, colorsKey: colorsDataBackKey),
    controller: controller,
  );

}

class IndivCompRowLoadingWidget extends StatelessWidget{

  const IndivCompRowLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: IndivCompPreviewWidget.height,
      child: Row(
        children: [

          IndivCompAutoRotatThumbnail(),

          const SizedBox(width: Dimen.SIDE_MARG),

          Text(
            'Ładowanie\nwspółzawodnictw...',
            style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_BIG,
              height: 1.2,
              fontWeight: weight.halfBold
            ),
          ),

        ],
      )
  );

}

class IndivCompRowProblemWidget extends StatelessWidget{

  const IndivCompRowProblemWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: IndivCompPreviewWidget.height,
      child: Row(
        children: [

          IndivCompThumbnailWidget(iconKey: 'rocketLaunchOutline', colorsKey: CommonColorData.SPACE_COLORS_KEY),

          const SizedBox(width: Dimen.SIDE_MARG),

          Text(
            'Hjuston\nmamy problem...',
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                height: 1.2,
                fontWeight: weight.halfBold
            ),
          ),

        ],
      )
  );

}

class IndivCompRowPreviewWidget extends StatelessWidget{

  final EdgeInsets? padding;

  const IndivCompRowPreviewWidget({this.padding, super.key});

  @override
  Widget build(BuildContext context){

    return Consumer2<IndivCompProvider, IndivCompListProvider>(
      builder: (context, indivCompProv, indivCompListProv, child){
        if(IndivComp.all!.length == 1)
          return Padding(
            padding: padding??EdgeInsets.zero,
            child: IndivCompTile(IndivComp.all![0]),
          );

        return SizedBox(
            height: IndivCompPreviewWidget.height + (padding?.bottom??0) + (padding?.top??0),
            child: Consumer<IndivCompProvider>(
              builder: (context, _, child) => ListView.separated(
                padding: padding,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: IndivComp.all?.length??0,
                itemBuilder: (context, index) => IndivCompPreviewWidget(IndivComp.all![index]),
                separatorBuilder: (context, index) => const SizedBox(width: Dimen.SIDE_MARG),
              ),
            )
        );

      }
    );

  }

}

class NotLoggedInWidget extends StatelessWidget{

  const NotLoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      Positioned(
        bottom: 350,
        right: 30,
        child: RotationTransition(
            turns: const AlwaysStoppedAnimation(-20 / 360),
            child: Center(
              child: GradientIcon(
                MdiIcons.crownCircleOutline,
                size: 96,
                colorStart: CommonColorData.ALL.values.toList()[10].colorStart,
                colorEnd: CommonColorData.ALL.values.toList()[10].colorEnd,
              ),
            )
        ),
      ),

      Positioned(
        bottom: 320,
        left: 140,
        child: RotationTransition(
            turns: const AlwaysStoppedAnimation(-20 / 360),
            child: Center(
              child: GradientIcon(
                MdiIcons.cogOutline,
                size: 96,
                colorStart: CommonColorData.ALL.values.toList()[9].colorStart,
                colorEnd: CommonColorData.ALL.values.toList()[9].colorEnd,
              ),
            )
        ),
      ),

      Positioned(
        bottom: 350,
        left: 30,
        child: RotationTransition(
            turns: const AlwaysStoppedAnimation(0 / 360),
            child: Center(
              child: GradientIcon(
                MdiIcons.chevronDoubleRight,
                size: 96,
                colorStart: CommonColorData.ALL.values.toList()[8].colorStart,
                colorEnd: CommonColorData.ALL.values.toList()[8].colorEnd,
              ),
            )
        ),
      ),

      Positioned(
        bottom: 240,
        left: 30,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(-10 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.googleCircles,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[5].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[5].colorEnd,
            ),
          )
        ),
      ),

      Positioned(
        bottom: 240,
        right: 60,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(10 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.trophyVariantOutline,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[6].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[6].colorEnd,
            ),
          )
        ),
      ),

      Positioned(
        bottom: 130,
        left: 45,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(-10 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.shareVariant,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[4].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[4].colorEnd,
            ),
          )
        ),
      ),

      Positioned(
        bottom: 190,
        left: 140,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(-10 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.bookmarkOutline,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[7].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[7].colorEnd,
            ),
          )
        ),
      ),

      Positioned(
        bottom: 140,
        right: 30,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(10 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.cloudOutline,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[3].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[3].colorEnd,
            ),
          )
        ),
      ),

      Positioned(
        bottom: 30,
        left: 30,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(-10 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.license,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[2].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[2].colorEnd,
            ),
          )
        ),
      ),

      Positioned(
        bottom: 60,
        left: 170,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(10 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.newspaperVariantOutline,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[1].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[1].colorEnd,
            ),
          )
        ),
      ),

      Positioned(
        bottom: 30,
        right: 30,
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(20 / 360),
          child: Center(
            child: GradientIcon(
              MdiIcons.musicNoteEighth,
              size: 96,
              colorStart: CommonColorData.ALL.values.toList()[0].colorStart,
              colorEnd: CommonColorData.ALL.values.toList()[0].colorEnd,
            ),
          )
        ),
      ),

      SimpleButton(
        radius: AppCard.BIG_RADIUS,
        color: cardEnab_(context),
        elevation: AppCard.bigElevation,
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        margin: const EdgeInsets.all(Dimen.SIDE_MARG),
        onTap: () => AccountPage.open(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              'Powiedzmy to wprost.',
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                  fontWeight: weight.bold
              ),
            ),

            const AppText(
              '\nCzas ogarnąć sobie <b>konto HarcApp</b>!',
              size: Dimen.TEXT_SIZE_BIG,
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            Material(
                color: background_(context),
                borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Row(
                    children: [
                      const Icon(MdiIcons.accountCircleOutline, size: 60),
                      const SizedBox(width: 20),
                      Text(
                        'Zaloguj się\nlub ogarnij konto',
                        style: AppTextStyle(
                            fontSize: 20.0,
                            color: iconEnab_(context),
                            height: 1.2
                        ),
                      )
                    ],
                  ),
                )
            ),

          ],
        ),
      )
      
    ],
  );

}