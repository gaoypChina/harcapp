import 'dart:async';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_common_widgets/harc_app.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/announcement.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/community_preview_page.dart';
import 'package:harcapp/_new/cat_page_home/feed_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app_bottom_navigator.dart';
import 'community/all_comunities_page.dart';
import 'community/circle/circle_page.dart';
import 'community/circle/model/announcement_attendance_resp_mode.dart';
import 'community/circle/model/circle.dart';
import 'community/common/community_cover_image_data.dart';
import 'community/community_publishable_widget_template.dart';
import 'community/forum/forum_page.dart';
import 'community/forum/model/forum.dart';
import 'community/forum/model/post.dart';
import 'community/model/community.dart';
import 'community/model/community_category.dart';
import 'competitions/all_competitions_page.dart';
import 'competitions/indiv_comp/indiv_comp_page.dart';
import 'competitions/indiv_comp/models/indiv_comp.dart';
import 'competitions/start_widgets/competition_preview_grid.dart';


class CatPageHome extends StatefulWidget{

  const CatPageHome({super.key});

  @override
  State<StatefulWidget> createState() => CatPageHomeState();

}

class CatPageHomeState extends State<CatPageHome> with AfterLayoutMixin, TickerProviderStateMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHome());
  }

  late Map<int, ScrollPosition> tabToPosition;

  late TabController tabController;
  late ValueNotifier<double> notifier;

  late GlobalKey<NestedScrollViewState> nestedScrollViewKey;
  ScrollController get innerController => nestedScrollViewKey.currentState!.innerController;
  ScrollController get outerController => nestedScrollViewKey.currentState!.outerController;

  void onBottomTabTap(int index){
    if(index == AppBottomNavigator.bottomNavBarToIndex(AppBottomNavItem.home)) {

      Duration duration = const Duration(seconds: 1);
      Curve curve = Curves.easeInOutQuad;

      tabToPosition[tabController.index]?.animateTo(
          -0.0001,
          duration: duration,
          curve: curve
      );
    }
  }

  late StreamSubscription<ConnectivityResult> networkListener;

  late LoginListener loginListener;

  @override
  void initState() {
    tabToPosition = {};
    tabController = TabController(length: 3, vsync: this);
    tabController.animation?.addListener((){
      notifier.value = tabController.animation!.value;
    });

    if(AccountData.loggedIn)
      post(() => tabToPosition[tabController.index] = innerController.positions.last);

    tabController.addListener(() {

      if(!tabToPosition.containsKey(tabController.index))
        tabToPosition[tabController.index] = innerController.positions.last;
    });

    notifier = ValueNotifier(0);

    nestedScrollViewKey = GlobalKey<NestedScrollViewState>();

    networkListener = addConnectionListener((hasConnection) async{
      if(!mounted) return;
      if(hasConnection)
        showAppToast(context, text: 'Przywrócono połączenie');
      else
        showAppToast(context, text: 'Brak internetu');
    });

    loginListener = LoginListener(
      onLogin: (_) => post(() => tabToPosition[tabController.index] = innerController.positions.last),
      onEmailConfirmChanged: (_) => post(() => tabToPosition[tabController.index] = innerController.positions.last),
      onRegistered: () => post(() => tabToPosition[tabController.index] = innerController.positions.last),
      onForceLogout: () => Provider.of<LoginProvider>(context, listen: false).notify()
    );

    AppBottomNavigatorProvider.addOnSelectedListener(onBottomTabTap);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    networkListener.cancel();
    AppBottomNavigatorProvider.removeOnSelectedListener(onBottomTabTap);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<LoginProvider>(
      builder: (context, loginProv, child){

        if(loginProv.loggedIn)
          return AnimatedBuilder(
              animation: notifier,
              child: AppScaffold(
                backgroundColor: Colors.transparent,
                body: NestedScrollView(
                  key: nestedScrollViewKey,
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leading: const AccountHeaderIcon(),
                      title: const HarcApp(size: Dimen.TEXT_SIZE_APPBAR),
                      centerTitle: true,
                      floating: true,
                      pinned: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        physics: const BouncingScrollPhysics(),
                        controller: tabController,
                        isScrollable: true,
                        indicator: AppTabBarIncdicator(color: iconEnab_(context)),
                        tabs: [
                          Tab(
                              child: Row(
                                children: [
                                  const Icon(MdiIcons.newspaperVariantOutline),
                                  const SizedBox(width: Dimen.ICON_MARG),
                                  Text('Potok', style: AppTextStyle(fontWeight: weight.halfBold))
                                ],
                              )
                          ),
                          Tab(
                              child: Row(
                                children: [
                                  const Icon(Community.icon),
                                  const SizedBox(width: Dimen.ICON_MARG),
                                  Text('Środowiska', style: AppTextStyle(fontWeight: weight.halfBold))
                                ],
                              )
                          ),
                          Tab(
                              child: Row(
                                children: [
                                  const Icon(MdiIcons.trophyVariantOutline),
                                  const SizedBox(width: Dimen.ICON_MARG),
                                  Text('Współzawodnictwa', style: AppTextStyle(fontWeight: weight.halfBold))
                                ],
                              )
                          ),
                        ],
                      ),
                      actions: [

                        AnimatedBuilder(
                          animation: notifier,
                          builder: (context, child) => Transform.translate(
                            offset: Offset(0, -1.3*Dimen.ICON_FOOTPRINT*sin(pi*notifier.value).abs()),
                            child: Opacity(
                                opacity: notifier.value > .5 ? 1: 0,
                                child: child
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(MdiIcons.plus),
                            onPressed: (){
                              if(tabController.index == 0)
                                return;
                              else if(tabController.index == 1)
                                NewCommunityButton.newCommunity(context);
                              else if(tabController.index == 2)
                                NewIndivCompButton.newCompetition(context);
                            },
                          ),
                        )

                      ],
                    )

                  ],
                  body: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      controller: tabController,
                      children: [

                        FeedPage(
                          key: const PageStorageKey("FeedPageStorageKey"),
                          onCircleTap: (circle){
                            openCirclePage(context, circle);
                          },
                          onForumTap: (forum){
                            openForumPage(context, forum);
                          },
                        ),

                        AllCommunitiesPage(
                          key: const PageStorageKey("AllCommunitiesPageStorageKey"),
                          onCircleTap: (circle) => openCirclePage(context, circle),
                          onForumTap: (forum) => openForumPage(context, forum),
                        ),

                        AllCompetitionsPage(
                          key: const PageStorageKey("AllCompetitionsPageStorageKey"),
                          onCompetitionTap: (comp) => openCompPage(context, comp),
                        ),

                      ]
                  ),
                ),
                bottomNavigationBar: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Consumer<ConnectivityProvider>(
                      builder: (context, prov, child) =>
                      prov.connected?
                      Container():
                      SizedBox(
                        height: 2*Dimen.defMarg + Dimen.TEXT_SIZE_BIG,
                        child: Material(
                            elevation: AppCard.bigElevation,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                'Brak połączenia z siecią',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      )
                    ),
                    const AppBottomNavigator()
                  ],
                ),
              ),
              builder: (context, child) => Consumer<LoginProvider>(
                child: child!,
                builder: (context, loginProv, child) => Container(
                    color:
                    loginProv.loggedIn?
                    CommunityCoverColors.nonPaletteBackgroundColor().withOpacity(max(0, 1 - notifier.value)):
                    background_(context),
                    child: child
                ),
              )
          );

        return const NotLoggedInWidget();

      }
  );

  static void openCommunityPage(
      BuildContext context,
      Community community,
      { bool replacePage = false,
      }) => (replacePage?pushReplacePage:pushPage).call(
      context,
      builder: (context) => CommunityPreviewPage(
        community,
      )
  );

  static void openCirclePage(
      BuildContext context,
      Circle circle,
      { AnnouncementCategories? initTab,
        bool replacePage = false,
      }) => (replacePage?pushReplacePage:pushPage).call(
      context,
      builder: (context) => CirclePage(
        circle,
        initTab: initTab,
        onLeft: () {
          Navigator.pop(context); // Close circle page.
        },
        onDeleted: () {
          Navigator.pop(context); // Close circle page.
        },
      )
  );

  static void openForumPage(
      BuildContext context,
      Forum forum,
      { void Function()? onDeleted,
        void Function(bool)? onFollowChanged,
        void Function(bool)? onLikeChanged,
        bool replacePage = false,
      }) => (replacePage?pushReplacePage:pushPage).call(
      context,
      builder: (context) => ForumPage(
        forum,
        onDeleted: (){
          Navigator.pop(context); // Close forum page.
          onDeleted?.call();
        },
        onFollowChanged: onFollowChanged,
        onLikeChanged: onLikeChanged,
      )
  );

  static void openCompPage(
      BuildContext context,
      IndivComp comp,
      { bool replacePage = false }) => (replacePage?pushReplacePage:pushPage).call(
        context,
        builder: (context) => IndivCompPage(comp)
      );

}

class NotLoggedInWidget extends StatefulWidget{

  const NotLoggedInWidget({super.key});

  @override
  State<StatefulWidget> createState() => NotLoggedInWidgetState();


}

class NotLoggedInWidgetState extends State<NotLoggedInWidget>{

  late PageController controller;
  late bool tapped;

  void autoScroll() async {

    while(true){
      await Future.delayed(const Duration(seconds: 5));
      if(!mounted) return;
      if(!tapped)
        controller.animateToPage(
            (controller.page!.toInt() + 1)%3,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic
        );
    }

  }

  @override
  void initState() {
    controller = PageController();
    tapped = false;
    autoScroll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      leading: const AccountHeaderIcon(),
      elevation: 0,
      title: HarcApp(color: iconEnab_(context), size: Dimen.TEXT_SIZE_APPBAR),
      centerTitle: true,
    ),
    body: Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(
              top: Dimen.SIDE_MARG,
              left: Dimen.SIDE_MARG,
              right: Dimen.SIDE_MARG
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                'Powiedzmy to wprost.',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                    fontWeight: weight.bold,
                    color: iconEnab_(context)
                ),
                textAlign: TextAlign.center,
              ),

              AppText(
                  '\nCzas ogarnąć sobie <b>konto HarcApp</b>.',
                  size: Dimen.TEXT_SIZE_BIG,
                  textAlign: TextAlign.center,
                  color: iconEnab_(context)
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              SimpleButton(
                onTap: () => AccountPage.open(context),
                color: cardEnab_(context),
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
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
        ),

        Expanded(
          child: GestureDetector(
            onTapDown: (_){
              tapped = true;
              print('down');
            },
            onTapUp: (_){
              tapped = false;
              print('up');
            },
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              children: const [

                NotLoggedInPartAllWidget(),

                NotLoggedInPartCommunitiesWidget(),

                NotLoggedInPartCompetitionsWidget(),

              ],
            ),
          )
        ),

        SmoothPageIndicator(
            controller: controller,  // PageController
            count: 3,
            effect: WormEffect(
                dotColor: iconDisab_(context),
                activeDotColor: iconEnab_(context),
                dotWidth: 8,
                dotHeight: 8
            ),
            onDotClicked: (index){}
        ),

        const SizedBox(height: Dimen.defMarg),

      ],
    ),
    bottomNavigationBar: const AppBottomNavigator(),
  );

}


class NotLoggedInPartAllWidget extends StatelessWidget{

  const NotLoggedInPartAllWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
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
                colorStart: CommonColorData.all.values.toList()[10].colorStart,
                colorEnd: CommonColorData.all.values.toList()[10].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[9].colorStart,
                colorEnd: CommonColorData.all.values.toList()[9].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[8].colorStart,
                colorEnd: CommonColorData.all.values.toList()[8].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[5].colorStart,
                colorEnd: CommonColorData.all.values.toList()[5].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[6].colorStart,
                colorEnd: CommonColorData.all.values.toList()[6].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[4].colorStart,
                colorEnd: CommonColorData.all.values.toList()[4].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[7].colorStart,
                colorEnd: CommonColorData.all.values.toList()[7].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[3].colorStart,
                colorEnd: CommonColorData.all.values.toList()[3].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[2].colorStart,
                colorEnd: CommonColorData.all.values.toList()[2].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[1].colorStart,
                colorEnd: CommonColorData.all.values.toList()[1].colorEnd,
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
                colorStart: CommonColorData.all.values.toList()[0].colorStart,
                colorEnd: CommonColorData.all.values.toList()[0].colorEnd,
              ),
            )
        ),
      ),

    ],
  );

}

class NotLoggedInPartCommunitiesWidget extends StatelessWidget{

  const NotLoggedInPartCommunitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      Positioned(
        top: -30,
        left: -20,
        right: 20,
        child: Center(
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(-10 / 360),
            child: Transform.scale(
              scale: .7,
              child: CommunityPublishableWidgetTemplate(
                Announcement(
                    key: '',
                    title: 'Biwak',
                    publishTime: DateTime(2021, 10, 28, 18, 21),
                    startTime: null,
                    endTime: null,
                    place: null,
                    urlToPreview: null,
                    author: const UserData(
                        key: '',
                        name: 'Teresa Szynewiczówna',
                        shadow: false,
                        sex: Sex.female
                    ),
                    coverImage: CommunityCoverImageData(
                        CommunityCoverImageDataType.sample,
                        sample: [CommunityCoverImageData.allSample[20].sample!.first]
                    ),
                    text: 'Widzimy się już w piątek! Przypominam o wzięciu legitymacji - o reszcie możecie zapomnieć na własną odpowiedzialność :)'
                        '\n\nO 7:10 zbiórka na dworcu. Do zobaczenia!',
                    pinned: false,
                    circle: Circle(
                      key: '',
                      description: '',
                      coverImage: CommunityCoverImageData.allSample[10],
                      shareCode: 'nieInterere',
                      shareCodeSearchable: false,
                      colorsKey: CommonColorData.defColorsKey,
                      members: [],
                      allAnnouncements: [],
                      pinnedCount: 0,
                      pinnedAnnouncements: [],
                      awaitingCount: 0,
                      awaitingAnnouncements: [],
                      bindedIndivComps: [],
                      community: CommunityBasicData(
                        key: '',
                        name: '30 PgDH "Czarne Stopy"',
                        iconKey: 'shoePrint',
                        category: CommunityCategory.druzyna,
                        contact: CommunityContactData(
                          email: [],
                          phone: [],
                          website: [],
                          other: null,
                        )
                      ),
                    ),
                    respMode: AnnouncementAttendanceRespMode.NONE,
                    attendance: {},
                    waivedAttRespMembers: []
                ),
                null,
                showCommunityInfo: true,
              ),
            )
          ),
        ),
      ),

      Positioned(
        bottom: -30,
        left: 20,
        right: -20,
        child: Center(
          child: RotationTransition(
              turns: const AlwaysStoppedAnimation(10 / 360),
              child: Transform.scale(
                scale: .7,
                child: CommunityPublishableWidgetTemplate(
                  Post(
                      key: '',
                      title: 'Służba, bo kończy się szkoła!',
                      publishTime: DateTime(2022, 6, 14, 15, 35),
                      urlToPreview: null,
                      author: null,
                      coverImage: CommunityCoverImageData(
                          CommunityCoverImageDataType.sample,
                          sample: [CommunityCoverImageData.allSample[15].sample!.first]
                      ),
                      text: 'W miniony łikend "Uroczysko" (znów!) podjęło służbę w gminnym starym tartaku! '
                          'Liczycie na zdjęcia Rudego ciosającego kłody albo Burgera z siekierą? Nie ta okazja! '
                          'Przygotowywaliśmy nadchodzącą potańcówkę z okazji zakończenia roku szkolnego - na którą, swoją drogą, serdecznie zapraszamy! '
                          'Podobno Durszlak uczył się baletu specjalnie na tę okazję ostatni rok.',
                      forum: Forum(
                        key: '',
                        description: '',
                        coverImage: CommunityCoverImageData.allSample[10],
                        colorsKey: CommonColorData.defColorsKey,
                        liked: true,
                        likeCnt: 0,
                        followed: true,
                        followers: [],
                        followersCnt: 0,
                        managers: [],
                        allPosts: [],
                        community: CommunityBasicData(
                          key: '',
                          name: '72 WDHS "Uroczysko"',
                          iconKey: 'deathStarVariant',
                          category: CommunityCategory.druzyna,
                          contact: CommunityContactData(
                            email: [],
                            phone: [],
                            website: [],
                            other: null,
                          )
                        ),
                      )
                  ),
                  null,
                  showCommunityInfo: true,
                ),
              )
          ),
        ),
      ),

    ],
  );

}

class NotLoggedInPartCompetitionsWidget extends StatelessWidget{

  const NotLoggedInPartCompetitionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Column(
          children: [

            const CompetitionPreviewGrid(),

            Expanded(
              child: Center(
                child: Text(
                  'Zyskaj dostęp do współzawodnictw\ni miej swoje punkty zawsze w kieszeni!',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      );

}
