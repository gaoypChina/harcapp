import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_app_common/stripe_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget_template.dart';
import 'package:harcapp/_new/cat_page_home/competitions/announcement_sliver.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../../_common_widgets/app_toast.dart';
import '../common.dart';
import 'announcement_edit_page/_main.dart';
import 'circle_description_page.dart';
import 'circle_editor/_main.dart';
import 'circle_palette_generator.dart';
import 'circle_role.dart';
import 'cover_image.dart';
import 'members_page/members_admin_page.dart';
import 'members_page/members_page.dart';
import 'model/announcement.dart';
import 'model/circle.dart';

enum AnnouncementCategories{
  all, pinned, awaiting
}

class CirclePage extends StatefulWidget{

  static Color? _lighten(Color? color, [double amount = .1]) {
    if(color == null) return null;

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(amount);

    return hslLight.toColor();
  }

  static Color? appBarColor(BuildContext context, PaletteGenerator? palette) =>
      backgroundColor(context, palette);

  static Color? backgroundColor(BuildContext context, PaletteGenerator? palette){
    if(palette == null) return background_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor!.color, .1);
    else
      return _lighten(palette.dominantColor!.color, .94);

  }

  static Color? cardColor(BuildContext context, PaletteGenerator? palette){
    if(palette == null) return cardEnab_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor!.color, .16);
    else
      return _lighten(palette.dominantColor!.color, .88);

  }

  static Color strongColor(BuildContext context, PaletteGenerator? palette) =>
      _lighten(palette?.dominantColor?.color, .5)??iconEnab_(context);

  static Color coverIconColor(BuildContext context, PaletteGenerator? palette){
    PaletteColor? color = palette?.dominantColor;
    if(color == null) return iconEnab_(context);
    return color.color.computeLuminance() > .5? DefColorPack.ICON_ENABLED:ColorPackBlack.ICON_ENABLED;
  }

  final Circle circle;
  final void Function()? onLeft;
  final void Function()? onDeleted;
  const CirclePage(this.circle, {this.onLeft, this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => CirclePageState();

}

class CirclePageState extends State<CirclePage>{

  static const circleCoverTag = 'circleCoverTag';
  static const circleNameTag = 'circleNameTag';

  late AnnouncementCategories currTab;

  Circle get circle => widget.circle;
  void Function()? get onLeft => widget.onLeft;
  void Function()? get onDeleted => widget.onDeleted;

  late RefreshController refreshController;

  PaletteGenerator? paletteGeneratorFirst;
  PaletteGenerator? paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    try {
      paletteGeneratorFirst = await getPaletteGenerator(circle.coverImage.local, circle.coverImage.firstFileName);
      paletteGeneratorSecond = await getPaletteGenerator(circle.coverImage.local, circle.coverImage.secondFileName);
    } catch (e){
      paletteGeneratorFirst = PaletteGenerator.fromColors([PaletteColor(Colors.white, 1)]);
      paletteGeneratorSecond = PaletteGenerator.fromColors([PaletteColor(Colors.white, 1)]);

      post(() => circle.myRole == CircleRole.OBSERVER?
      showAppToast(context, text: 'Nie można załadować tła'):
      showAppToast(context, text: 'Nie można załadować tła. Zmień grafikę tła, by przyspieszyć ładowanie', duration: const Duration(seconds: 6)));
    }

    if(!refresh) return;

    if(circle.awaitingCount != 0)
      post(() => openDialog(
          context: context,
          builder: (context) => InitAwaitingMessageDialog(palette: palette)
      ));

    setState(() {});
    notifyScrollController();
  }

  late ScrollController scrollController;

  late GlobalKey appBarKey;
  late GlobalKey tabBarKey;

  late AppBarProvider appBarProv;

  late int allLoadedPage;
  late int pinnedLoadedPage;
  late int awaitingLoadedPage;

  late bool changeShareCodeProcessing;

  late LoginListener loginListener;

  int get loadedPage{
    switch(currTab){
      case AnnouncementCategories.all: return allLoadedPage;
      case AnnouncementCategories.pinned: return pinnedLoadedPage;
      case AnnouncementCategories.awaiting: return awaitingLoadedPage;
    }
  }

  late bool moreAllToLoad;
  late bool morePinnedToLoad;
  late bool moreAwaitingToLoad;

  bool get moreToLoad{
    switch(currTab){
      case AnnouncementCategories.all: return moreAllToLoad;
      case AnnouncementCategories.pinned: return morePinnedToLoad;
      case AnnouncementCategories.awaiting: return moreAwaitingToLoad;
      default: return false;
    }
  }

  set moreToLoad(bool value){
    switch(currTab){
      case AnnouncementCategories.all:
        moreAllToLoad = value;
        logger.d('Loaded ${circle.allAnnouncements.length} "all" announcements. Any remaining: $value');
        break;
      case AnnouncementCategories.pinned:
        morePinnedToLoad = value;
        logger.d('Loaded ${circle.pinnedAnnouncements.length} "pinned" announcements. Any remaining: $value');
        break;
      case AnnouncementCategories.awaiting:
        moreAwaitingToLoad = value;
        logger.d('Loaded ${circle.awaitingAnnouncements.length} "awaiting" announcements. Any remaining: $value');
        break;
    }
  }

  int get loadedAnnouncementsCount{
    switch(currTab){
      case AnnouncementCategories.all:
        return circle.allAnnouncements.length;
      case AnnouncementCategories.pinned:
        return circle.pinnedAnnouncements.length;
      case AnnouncementCategories.awaiting:
        return circle.awaitingAnnouncements.length;
      default:
        return -1;
    }
  }

  @override
  void initState() {

    changeShareCodeProcessing = false;

    if(circle.awaitingCount != 0) {
      currTab = AnnouncementCategories.awaiting;
    }else
      currTab = AnnouncementCategories.all;

    appBarKey = GlobalKey();
    tabBarKey = GlobalKey();

    scrollController = ScrollController();
    scrollController.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;
      final appBarBox = appBarKey.currentContext?.findRenderObject() as RenderBox?;
      double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (appBarPos < kToolbarHeight && !appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = true;
      else if(appBarPos >= kToolbarHeight && appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = false;

      if (appBarPos < 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;
      else if(appBarPos >= 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;

      final tabBarBox = tabBarKey.currentContext?.findRenderObject() as RenderBox?;
      double tabBarPos = tabBarBox==null? -double.infinity: tabBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (tabBarPos <= 96 && appBarProv.elevated) appBarProv.elevated = false;
      else if(tabBarPos > 96 && !appBarProv.elevated) appBarProv.elevated = true;
    });

    refreshController = RefreshController();

    initPaletteGenerator();

    allLoadedPage = 0;
    pinnedLoadedPage = 0;
    awaitingLoadedPage = 0;

    moreAllToLoad = circle.allAnnouncements.length == Circle.announcementPageSize;
    morePinnedToLoad = circle.pinnedAnnouncements.length == Circle.announcementPageSize;
    moreAwaitingToLoad = circle.awaitingAnnouncements.length == Circle.announcementPageSize;

    loginListener = LoginListener(
        onForceLogout: () => Navigator.pop(context)
    );
    AccountData.addLoginListener(loginListener);

    super.initState();
  }

  @override
  void dispose(){
    scrollController.dispose();
    refreshController.dispose();
    AccountData.removeLoginListener(loginListener);
    super.dispose();
  }
  
  PaletteGenerator? get paletteAlways{
    if(paletteGeneratorSecond == null) return paletteGeneratorFirst;
    return AppSettings.isDark?paletteGeneratorSecond:paletteGeneratorFirst;
  }
  
  PaletteGenerator? get palette{
    if(circle.colorsKey == 'none') return null;
    return paletteAlways;
  }

  Color? get appBarColor => CirclePage.appBarColor(context, palette);
  Color? get backgroundColor => CirclePage.backgroundColor(context, palette);
  Color? get cardColor => CirclePage.cardColor(context, palette);
  Color get strongColor => CirclePage.strongColor(context, palette);
  Color get coverIconColor => CirclePage.coverIconColor(context, paletteAlways);

  void notifyScrollController() => post(() => scrollController.jumpTo(scrollController.offset + 1e-10));

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: backgroundColor,
    appBottomNavColor: backgroundColor,
    body: ChangeNotifierProvider(
      create: (context){
        appBarProv = AppBarProvider();
        return appBarProv;
      },
      builder: (context, child) =>
      paletteAlways == null?
      const _CircleLoadingWidget():

      Consumer<AnnouncementListProvider>(
        builder: (context, prov, child) => SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode){
              Widget body;
              if(!moreToLoad)
                body = loadedAnnouncementsCount==0?
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
                  color: CirclePage.strongColor(context, palette),
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
          physics: const BouncingScrollPhysics(),
          header: MaterialClassicHeader(
            backgroundColor: cardEnab_(context),
            color: strongColor
          ),
          controller: refreshController,
          onRefresh: () async {

            if(!await isNetworkAvailable()){
              showAppToast(context, text: 'Brak dostępu do Internetu');
              refreshController.refreshCompleted();
              return;
            }

            CircleListProvider circleListProv = Provider.of<CircleListProvider>(context, listen: false);

            await ApiCircle.get(
                circleKey: circle.key,
                onSuccess: (updatedCircle) async {
                  circle.name = updatedCircle.name;
                  circle.description = updatedCircle.description;
                  circle.coverImage = updatedCircle.coverImage;
                  circle.colorsKey = updatedCircle.colorsKey;
                  circle.setAllMembers(context, updatedCircle.members);
                  circle.resetAnnouncements(
                    updatedCircle.allAnnouncements,
                    updatedCircle.pinnedAnnouncements,
                    updatedCircle.awaitingAnnouncements,
                  );

                  allLoadedPage = 0;
                  pinnedLoadedPage = 0;
                  awaitingLoadedPage = 0;

                  moreAllToLoad = circle.allAnnouncements.length == Circle.announcementPageSize;
                  morePinnedToLoad = circle.pinnedAnnouncements.length == Circle.announcementPageSize;
                  moreAwaitingToLoad = circle.awaitingAnnouncements.length == Circle.announcementPageSize;

                  await initPaletteGenerator(refresh: false);

                  setState(() {});
                },
                onError: (responseStatusCode){
                  if(responseStatusCode == HttpStatus.notFound){
                    showAppToast(
                        context,
                        text: AccountData.sex == Sex.male ?
                        'Zostałeś wyproszony':
                        'Zostałaś wyproszona'
                    );
                    Circle.removeFromAll(circle);
                    circleListProv.notify();
                    popPage(context);
                    return;
                  }

                  showAppToast(context, text: 'Coś poszło nie tak...');
                }
            );

            refreshController.refreshCompleted();

          },
          onLoading: () async {

            if(!moreToLoad) {
              refreshController.loadComplete();
              return;
            }

            if(!await isNetworkAvailable()){
              showAppToast(context, text: 'Brak dostępu do Internetu');
              refreshController.loadComplete();
              return;
            }

            await ApiCircle.getCircleAnnouncements(
                circleKey: circle.key,
                page: loadedPage + 1,
                pinnedOnly: currTab == AnnouncementCategories.pinned,
                awaitingOnly: currTab == AnnouncementCategories.awaiting,
                onSuccess: (nextAnnouncements, pinnedOnly, awaitingOnly){

                  int i;
                  for(i=0; i<nextAnnouncements.length; i++)
                    if(!circle.announcementsMap.containsKey(nextAnnouncements[i].key) || (
                        (pinnedOnly && !circle.announcementsMap[nextAnnouncements[i].key]!.inPinned) ||
                        (awaitingOnly && !circle.announcementsMap[nextAnnouncements[i].key]!.inAwaiting) ||
                        (!awaitingOnly && !pinnedOnly && !circle.announcementsMap[nextAnnouncements[i].key]!.inAll)
                    )) break;

                  if(pinnedOnly) {
                    circle.addPinnedAnnouncements(nextAnnouncements.sublist(i));
                    pinnedLoadedPage += 1;
                  }else if(awaitingOnly) {
                    circle.addAwaitingAnnouncements(nextAnnouncements.sublist(i));
                    awaitingLoadedPage += 1;
                  }else {
                    circle.addAllAnnouncements(nextAnnouncements.sublist(i));
                    allLoadedPage += 1;
                  }

                  Provider.of<AnnouncementListProvider>(context, listen: false).notify();

                  if(nextAnnouncements.length != Circle.announcementPageSize)
                    setState(() => moreToLoad = false);

                },
                onError: () => showAppToast(context, text: 'Coś nie pykło...')
            );

            refreshController.loadComplete();

          },
          child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [

                Consumer<AppBarProvider>(
                  builder: (context, prov, child) => SliverAppBar(
                    iconTheme: IconThemeData(
                        color: prov.coverVisible?coverIconColor:iconEnab_(context)
                    ),
                    centerTitle: true,
                    pinned: true,
                    excludeHeaderSemantics: true,
                    elevation: prov.elevated?AppCard.bigElevation:0,
                    backgroundColor: backgroundColor,
                    expandedHeight: 200,
                    actions: [

                      if(circle.myRole == CircleRole.ADMIN)
                        IconButton(
                          icon: Icon(
                              circle.shareCodeSearchable?
                              MdiIcons.accessPoint:
                              MdiIcons.accessPointOff,

                              color: prov.coverVisible?coverIconColor:iconEnab_(context)

                          ),
                          onPressed: changeShareCodeProcessing?null:() async {
                            setState(() => changeShareCodeProcessing = true);
                            await ApiCircle.setShareCodeSearchable(
                                compKey: circle.key,
                                searchable: !circle.shareCodeSearchable,
                                onSuccess: (searchable) => setState(() => circle.shareCodeSearchable = searchable)
                            );
                            setState(() => changeShareCodeProcessing = false);
                          },
                        ),

                      IconButton(
                        icon: Icon(
                            MdiIcons.cogOutline,
                            color: prov.coverVisible?coverIconColor:iconEnab_(context)
                        ),
                        onPressed: () => pushPage(
                            context,
                            builder: (context) => CircleEditorPage(
                              initCircle: circle,
                              palette: palette,
                              onSaved: (updatedCircle) async {

                                circle.name = updatedCircle.name;
                                circle.description = updatedCircle.description;
                                circle.coverImage = updatedCircle.coverImage;
                                circle.colorsKey = updatedCircle.colorsKey;

                                if(mounted) Provider.of<CircleProvider>(context, listen: false).notify();
                                if(mounted) Provider.of<CircleListProvider>(context, listen: false).notify();

                                await initPaletteGenerator(refresh: false);

                                setState(() {});
                              },
                              onDeleted: onDeleted,
                              onLeft: onLeft,
                            )
                        ),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: prov.showTitleOnAppBar?1:0,
                        duration: Duration(milliseconds: prov.showTitleOnAppBar?200:0),
                        child: Text(
                          circle.name,
                          style: AppTextStyle(
                              color: iconEnab_(context)
                          ),
                          maxLines: 1,
                        ),
                      ),
                      centerTitle: true,
                      background: Hero(
                        tag: circleCoverTag,
                        child: CoverImage(circle.coverImage),
                      ),
                    ),
                  ),
                ),

                SliverList(delegate: SliverChildListDelegate([

                  Padding(
                      padding: const EdgeInsets.only(
                        top: Dimen.SIDE_MARG,
                        left: Dimen.SIDE_MARG,
                        right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                        bottom: Dimen.SIDE_MARG,
                      ),
                      child: Hero(
                          tag: circleNameTag,
                          child: Material(
                            color: Colors.transparent,
                            child: Row(
                              children: [

                                Expanded(
                                  child: Text(
                                    circle.name,
                                    style: AppTextStyle(
                                        fontSize: 28.0,
                                        fontWeight: weight.bold
                                    ),
                                    key: appBarKey,
                                  ),
                                ),

                                IconButton(
                                  icon: const Icon(MdiIcons.chevronDown),
                                  onPressed: () => pushPage(
                                      context,
                                      builder: (context) => CircleDescriptionPage(
                                        circle,
                                        palette,
                                        onIndivCompTap: (comp) async {
                                          HomePartProvider.of(context).selectedDrawerPage = HomePartProvider.drawerPageCompetitions;
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          await Future.delayed(Duration.zero);
                                          CatPageHomeState.openCompPage(context, comp);
                                        },
                                      )
                                  ),
                                )

                              ],
                            ),
                          )
                      )
                  ),

                  if(circle.myRole == CircleRole.ADMIN)
                    AnimatedSize(
                      alignment: Alignment.bottomCenter,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutQuad,
                      clipBehavior: Clip.none,
                      child: SizedBox(
                        height: circle.shareCodeSearchable?null:0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: Dimen.SIDE_MARG,
                            left: Dimen.SIDE_MARG,
                            right: Dimen.SIDE_MARG
                          ),
                          child: ShareCodeWidget(
                            circle.shareCode!,
                            circle.shareCodeSearchable,
                            enabled: !changeShareCodeProcessing,
                            backgroundColor: CirclePage.backgroundColor(context, palette),
                            borderColor: CirclePage.cardColor(context, palette),
                            resetShareCode: () => ApiCircle.resetShareCode(
                                circleKey: circle.key,
                                onSuccess: (shareCode){
                                  setState(() => circle.shareCode = shareCode);
                                },
                                onError: (dynamic errData){
                                  if(errData is Map && errData['errors'] != null && errData['errors']['shareCode'] == 'share_code_changed_too_soon')
                                    showAppToast(context, text: 'Za często zmieniasz kod dostępu');
                                }
                            ),
                          ),
                        ),
                      ),
                    ),

                  AccountThumbnailRowWidget(
                    circle.members.map((m) => m.name).toList(),
                    elevated: AnnouncementWidgetTemplate.elevation != 0,
                    color: backgroundColor,
                    borderColor: cardColor,
                    backgroundColor: backgroundColor,
                    padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                    onTap: () => pushPage(
                      context,
                      builder: (context) => circle.myRole == CircleRole.ADMIN || circle.myRole == CircleRole.MODERATOR?
                      MembersAdminPage(circle, palette):
                      MembersPage(circle, palette)
                    ),
                    heroBuilder: (index) => circle.members[index],
                  ),

                  if(circle.myRole == CircleRole.MODERATOR || circle.myRole == CircleRole.ADMIN)
                    Padding(
                      padding: const EdgeInsets.only(top: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
                      child: SimpleButton(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        onTap: () => pushPage(
                            context,
                            builder: (context) => AnnouncementEditorPage(
                              circle: circle,
                              palette: palette,
                              onSaved: (announcement){
                                circle.addAllAnnouncement(announcement);
                                setState(() {});
                              },
                            )
                        ),
                        color: cardColor,
                        clipBehavior: Clip.antiAlias,
                        radius: AnnouncementWidgetTemplate.radius,
                        elevation: AnnouncementWidgetTemplate.elevation,
                        child: Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: Row(
                            children: [
                              Icon(MdiIcons.draw, color: hintEnab_(context)),
                              const SizedBox(width: Dimen.SIDE_MARG),
                              Text(
                                'Dodaj ogłoszenie...',
                                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: hintEnab_(context))
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(height: Dimen.SIDE_MARG),

                  const SizedBox(height: Dimen.SIDE_MARG),

                ])),

                FloatingContainer(
                  builder: (context, double shrinkOffset, bool overlapsContent){
                    bool overlaps = shrinkOffset!=0 || overlapsContent;
                    return Material(
                      key: tabBarKey,
                      color: CirclePage.backgroundColor(context, palette),
                      elevation: overlaps?AppCard.bigElevation:0,
                      child: SizedBox(
                        height: Dimen.ICON_FOOTPRINT,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          children: [

                            const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG + 2),

                            SimpleButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimen.ICON_MARG,
                                  vertical: Dimen.ICON_MARG,
                                ),
                                margin: EdgeInsets.zero,
                                child: Text(
                                    circle.pinnedAnnouncements.isEmpty?
                                    'Przypięte':
                                    'Przypięte (${circle.pinnedCount})',
                                    style: AppTextStyle(
                                        fontSize: Dimen.TEXT_SIZE_BIG,
                                        fontWeight: currTab == AnnouncementCategories.pinned?weight.halfBold:weight.normal,
                                        color: currTab == AnnouncementCategories.pinned?iconEnab_(context):iconDisab_(context)
                                    )
                                ),
                                onTap: () {
                                  // notifyScrollController();
                                  scrollController.jumpTo(0);
                                  appBarProv.set(elevated: false, showTitleOnAppBar: false, coverVisible: true);

                                  setState(() => currTab = AnnouncementCategories.pinned);
                                }
                            ),

                            SimpleButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimen.ICON_MARG,
                                  vertical: Dimen.ICON_MARG,
                                ),
                                margin: EdgeInsets.zero,
                                child: Text(
                                    'Wszystkie',
                                    style: AppTextStyle(
                                        fontSize: Dimen.TEXT_SIZE_BIG,
                                        fontWeight: currTab == AnnouncementCategories.all?weight.halfBold:weight.normal,
                                        color: currTab == AnnouncementCategories.all?iconEnab_(context):iconDisab_(context)
                                    )
                                ),
                                onTap: (){
                                  // notifyScrollController();
                                  scrollController.jumpTo(0);
                                  appBarProv.set(elevated: false, showTitleOnAppBar: false, coverVisible: true);

                                  setState(() => currTab = AnnouncementCategories.all);
                                }
                            ),

                            if(circle.awaitingAnnouncements.isNotEmpty)
                              SimpleButton(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Dimen.ICON_MARG,
                                    vertical: Dimen.ICON_MARG,
                                  ),
                                  margin: EdgeInsets.zero,
                                  child: Text(
                                      'Oczekujące (${circle.awaitingCount})',
                                      style: AppTextStyle(
                                          fontSize: Dimen.TEXT_SIZE_BIG,
                                          fontWeight: currTab == AnnouncementCategories.awaiting?weight.halfBold:weight.normal,
                                          color: currTab == AnnouncementCategories.awaiting?iconEnab_(context):iconDisab_(context)
                                      )
                                  ),
                                  onTap: (){
                                    // notifyScrollController();
                                    scrollController.jumpTo(0);
                                    appBarProv.set(elevated: false, showTitleOnAppBar: false, coverVisible: true);

                                    setState(() => currTab = AnnouncementCategories.awaiting);
                                  }
                              ),

                          ],
                        ),
                      ),
                    );
                  },
                  height: Dimen.ICON_FOOTPRINT,
                  rebuild: true,
                ),

                if(currTab == AnnouncementCategories.all)
                  getAllAnnouncements()
                else if(currTab == AnnouncementCategories.pinned)
                  getPinnedAnnouncements()
                else if(currTab == AnnouncementCategories.awaiting)
                  getAwaitingAnnouncements()

              ]
          )

        ),
      )

    ),
  );

  Widget getAllAnnouncements() => getAnnouncementsSliver(
      context,
      circle.allAnnouncements,
      padding: const EdgeInsets.only(
        top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
        right: Dimen.SIDE_MARG,
        left: Dimen.SIDE_MARG,
        bottom: Dimen.SIDE_MARG,
      ),
      palette: palette,
      onAnnouncementUpdated: () => setState((){})
  );

  Widget getPinnedAnnouncements() => getAnnouncementsSliver(
      context,
      circle.pinnedAnnouncements,
      padding: const EdgeInsets.only(
        top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
        right: Dimen.SIDE_MARG,
        left: Dimen.SIDE_MARG,
        bottom: Dimen.SIDE_MARG,
      ),
      palette: palette,
      emptyMessage: 'Brak przypiętych ogłoszeń',
      onAnnouncementUpdated: () => setState((){})
  );

  Widget getAwaitingAnnouncements() => getAnnouncementsSliver(
      context,
      circle.awaitingAnnouncements,
      padding: const EdgeInsets.only(
        top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
        right: Dimen.SIDE_MARG,
        left: Dimen.SIDE_MARG,
        bottom: Dimen.SIDE_MARG,
      ),
      palette: palette,
      emptyMessage: 'Brak oczekujących ogłoszeń',
      onAnnouncementUpdated: () => setState((){})
  );

}

class _CircleLoadingWidget extends StatelessWidget{

  const _CircleLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: SpinKitDualRing(color: iconEnab_(context), size: 48.0),
  );

}

class AppBarProvider extends ChangeNotifier{

  late bool _elevated;
  bool get elevated => _elevated;
  set elevated(bool value){
    _elevated = value;
    notifyListeners();
  }

  late bool _showTitleOnAppBar;
  bool get showTitleOnAppBar => _showTitleOnAppBar;
  set showTitleOnAppBar(bool value){
    _showTitleOnAppBar = value;
    notifyListeners();
  }

  late bool _coverVisible;
  bool get coverVisible => _coverVisible;
  set coverVisible(bool value){
    _coverVisible = value;
    notifyListeners();
  }

  void set({
    bool? elevated,
    bool? showTitleOnAppBar,
    bool? coverVisible,
  }){
    if(elevated != null) _elevated = elevated;
    if(showTitleOnAppBar != null) _showTitleOnAppBar = showTitleOnAppBar;
    if(coverVisible != null) _coverVisible = coverVisible;
    notifyListeners();
  }

  AppBarProvider(){
    _elevated = true;
    _showTitleOnAppBar = false;
    _coverVisible = true;
  }

}

class InitAwaitingMessageDialog extends StatelessWidget{

  final PaletteGenerator? palette;

  const InitAwaitingMessageDialog({required this.palette, super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: StripeWidget(
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS - 4),
            color: CirclePage.backgroundColor(context, palette),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Text(
                    'Konieczne działanie!',
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(Dimen.SIDE_MARG),
                  child: AppText(
                    'Niektóre <b>ogłoszenia oczekują</b> na deklarację Twojej obecności!'
                        '\n\nIgnorowanie ogłoszeń jest <b>wyrazem braku szacunku</b> dla ich autorów.'
                        '\n\nNie zwlekaj :)'
                        '\n<b>Czuwaj!</b>',
                    size: Dimen.TEXT_SIZE_BIG,
                  ),
                ),

                SimpleButton(
                    radius: 0,
                    margin: EdgeInsets.zero,
                    onTap: () => Navigator.pop(context),
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    child: const Icon(MdiIcons.check)
                )

              ],
            ),
          ),
        ),
      ),
    ),
  );

}