import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_app_common/stripe_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/announcements_sliver.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../common.dart';
import '../common/community_cover_colors.dart';
import '../common/community_cover_image_data.dart';
import '../community_publishable_widget_template.dart';
import '../community_sliver_app_bar.dart';
import 'announcement_editor/_main.dart';
import 'announcement_extended_page.dart';
import 'circle_description_page.dart';
import 'circle_editor/_main.dart';
import 'circle_editor/common.dart';
import 'circle_role.dart';
import 'members_page/members_page.dart';
import 'model/announcement.dart';
import 'model/circle.dart';
import 'model/member.dart';

enum AnnouncementCategories{
  all, pinned, awaiting
}

class CirclePage extends StatefulWidget{

  final Circle circle;
  final AnnouncementCategories? initTab;
  final void Function()? onLeft;
  final void Function()? onDeleted;
  const CirclePage(this.circle, {this.initTab, this.onLeft, this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => CirclePageState();

}

class CirclePageState extends State<CirclePage>{

  static const circleCoverTag = 'circleCoverTag';
  static const circleNameTag = 'circleNameTag';

  late AnnouncementCategories currTab;

  Circle get circle => widget.circle;
  AnnouncementCategories? get initTap => widget.initTab;
  void Function()? get onLeft => widget.onLeft;
  void Function()? get onDeleted => widget.onDeleted;

  late RefreshController refreshController;

  PaletteGenerator? paletteGeneratorFirst;
  PaletteGenerator? paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    if(CommunityCoverImageData.palettes.containsKey(circle.coverImage.uniqueID)) {
      paletteGeneratorFirst = CommunityCoverImageData.palettes[circle.coverImage.uniqueID]!.item1;
      paletteGeneratorSecond = CommunityCoverImageData.palettes[circle.coverImage.uniqueID]!.item2;
      return;
    }

    try {
      paletteGeneratorFirst = await getPaletteGenerator(circle.coverImage);
      paletteGeneratorSecond = await getPaletteGenerator(circle.coverImage, darkSample: true);
    } catch (e){
      paletteGeneratorFirst = PaletteGenerator.fromColors([PaletteColor(Colors.white, 1)]);
      paletteGeneratorSecond = PaletteGenerator.fromColors([PaletteColor(Colors.white, 1)]);

      post(() => circle.myRole == CircleRole.OBSERVER?
      showAppToast(context, text: 'Nie można załadować tła'):
      showAppToast(context, text: 'Nie można załadować tła. Zmień grafikę tła, by przyspieszyć ładowanie', duration: const Duration(seconds: 6)));
    }

    CommunityCoverImageData.palettes[circle.coverImage.uniqueID] = Tuple2(paletteGeneratorFirst, paletteGeneratorSecond);

    if(!refresh) return;

    setState(() {});
    notifyScrollController();
  }

  late ScrollController scrollController;

  late GlobalKey nameWidgetKey;
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

    if(initTap != null)
      currTab = AnnouncementCategories.pinned;
    else if(circle.awaitingCount != 0) {
      currTab = AnnouncementCategories.awaiting;
      post(() => openDialog(
          context: context,
          builder: (context) => InitAwaitingMessageDialog(palette: palette)
      ));
    }else
      currTab = AnnouncementCategories.all;

    nameWidgetKey = GlobalKey(debugLabel: 'nameWidgetKey');
    tabBarKey = GlobalKey(debugLabel: 'tabBarKey');

    scrollController = ScrollController();
    scrollController.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;

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

  Color get appBarColor => CommunityCoverColors.appBarColor(context, palette);
  Color get backgroundColor => CommunityCoverColors.backgroundColor(context, palette);
  Color get cardColor => CommunityCoverColors.cardColor(context, palette);
  Color get strongColor => CommunityCoverColors.strongColor(context, palette);
  Color get coverIconColor => CommunityCoverColors.coverIconColor(context, paletteAlways);

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

      Consumer2<CircleProvider, AnnouncementListProvider>(
        builder: (context, circleProv, prov, child) => SmartRefresher(
          enablePullDown: true,
          enablePullUp: !refreshController.isRefresh,
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
                  color: strongColor,
                  size: Dimen.ICON_SIZE,
                );

              else if(mode == LoadStatus.failed)
                body = Text("Coś poszło nie tak!", style: AppTextStyle());

              else if(mode == LoadStatus.canLoading)
                body = Text("Puść, by załadować", style: AppTextStyle());

              else
                body = Text(
                  'Nie wiem co tu wyświtlić. Pozdrawiam mamę!',
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

            await ApiCircle.get(
                circleKey: circle.key,
                community: circle.community,
                onSuccess: (updatedCircle) async {
                  circle.description = updatedCircle.description;
                  circle.coverImage = updatedCircle.coverImage;
                  circle.colorsKey = updatedCircle.colorsKey;
                  // circle.setAllMembers(updatedCircle.members, context: context);
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
                onServerMaybeWakingUp: () {
                  if(mounted) showServerWakingUpToast(context);
                  return true;
                },
                onError: (responseStatusCode){
                  if(responseStatusCode == HttpStatus.notFound){

                    Community.removeCircle(circle, context: context);

                    showAppToast(
                        context,
                        text: AccountData.sex == Sex.male ?
                        'Zostałeś wyproszony':
                        'Zostałaś wyproszona'
                    );
                    popPage(context);
                    return;
                  }

                  showAppToast(context, text: simpleErrorMessage);
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

                  AnnouncementListProvider.notify_(context);

                  if(nextAnnouncements.length != Circle.announcementPageSize)
                    setState(() => moreToLoad = false);

                },
                onServerMaybeWakingUp: () {
                  if(mounted) showServerWakingUpToast(context);
                  return true;
                },
                onError: (){
                  if(mounted) showAppToast(context, text: simpleErrorMessage);
                }
            );

            refreshController.loadComplete();

          },
          child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [

                CommunitySliverAppBar(
                  circle.community,
                  palette: palette,
                  coverImage: circle.coverImage,
                  backgroundColor: cardColor,
                  preBackgroundColor: backgroundColor,
                  backgroundMarg: Dimen.defMarg,
                  mainScrollController: scrollController,
                  communityNameWidgetKey: nameWidgetKey,
                  heroTag: circleCoverTag,
                  actions: (appBarProv) => [

                    if(circle.myRole == CircleRole.ADMIN)
                      IconButton(
                        icon: Icon(
                            circle.shareCodeSearchable?
                            ShareCodeDialog.iconOn:
                            ShareCodeDialog.iconOff,

                            color: (appBarProv.coverVisible?coverIconColor:iconEnab_(context))
                                .withOpacity(changeShareCodeProcessing?0.4:1)

                        ),
                        onPressed: () => openDialog(
                            context: context,
                            builder: (context) => ShareCodeDialog.from(
                              circle.shareCode!,
                              circle.shareCodeSearchable,
                              !changeShareCodeProcessing,
                              backgroundColor: cardColor,
                              borderColor: backgroundColor,
                              resetShareCode: () async {
                                await ApiCircle.resetShareCode(
                                    circleKey: circle.key,
                                    onSuccess: (shareCode){
                                      circle.shareCode = shareCode;
                                      if(mounted) setState((){});
                                    },
                                    onServerMaybeWakingUp: () {
                                      if(mounted) showServerWakingUpToast(context);
                                      return true;
                                    },
                                    onError: (dynamic errData){
                                      if(errData is Map && errData['errors'] != null && errData['errors']['shareCode'] == 'share_code_changed_too_soon')
                                        if(mounted) showAppToast(context, text: 'Za często zmieniasz kod dostępu');
                                    }
                                );
                                return circle.shareCode;
                              },
                              changeShareCodeSearchable: () async {
                                await ApiCircle.setShareCodeSearchable(
                                    compKey: circle.key,
                                    searchable: !circle.shareCodeSearchable,
                                    onSuccess: (searchable){
                                      circle.shareCodeSearchable = searchable;
                                      if(!mounted) return;
                                      setState((){});
                                      showAppToast(
                                          context,
                                          text: searchable?
                                          'Każdy może teraz dołączyć do kręgu znając kod dostępu':
                                          'Dołączanie po kodzie dostępu wyłączone',
                                          duration: searchable?const Duration(seconds: 5):const Duration(seconds: 3)
                                      );
                                    },
                                    onServerMaybeWakingUp: () {
                                      if(mounted) showServerWakingUpToast(context);
                                      return true;
                                    },
                                    onError: (){
                                      if(mounted) showAppToast(context, text: simpleErrorMessage);
                                    }
                                );
                                return circle.shareCodeSearchable;
                              },
                              description: 'To, co widzisz, to <b>kod dostępu</b>.'
                                  '\n\nPozwala on dołączyć do kręgu tym, którzy go znają.',
                              resetFrequencyDays: 2,
                            ),
                        )
                      ),

                    IconButton(
                      icon: Icon(
                          MdiIcons.cogOutline,
                          color: appBarProv.coverVisible?coverIconColor:iconEnab_(context)
                      ),
                      onPressed:
                      circle.myRole == CircleRole.ADMIN?() =>
                          pushPage(
                              context,
                              builder: (context) => CircleEditorPage(
                                community: circle.community,
                                initCircle: circle,
                                palette: palette,
                                onSaved: (updatedCircle) async {

                                  circle.description = updatedCircle.description;
                                  circle.coverImage = updatedCircle.coverImage;
                                  circle.colorsKey = updatedCircle.colorsKey;

                                  if(mounted) Provider.of<CircleProvider>(context, listen: false).notify();

                                  await initPaletteGenerator(refresh: false);

                                  setState(() {});
                                },
                                onDeleted: onDeleted,
                                onLeft: onLeft,
                              )
                          ):

                          () => showScrollBottomSheet(
                          context: context,
                          builder: (context) => BottomSheetDef(
                            builder: (context) => LeaveNotAdminDialog(circle),
                          )
                      ),
                    ),
                  ],
                ),

                SliverList(delegate: SliverChildListDelegate([

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimen.defMarg),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(communityRadius)),
                          color: cardColor,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [

                            Padding(
                                padding: const EdgeInsets.only(
                                  top: Dimen.SIDE_MARG,
                                  left: Dimen.SIDE_MARG - Dimen.defMarg,
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
                                            child: Consumer<CommunityProvider>(
                                              builder: (context, prov, child) => AutoSizeText(
                                                circle.name,
                                                style: AppTextStyle(
                                                    fontSize: CommunitySliverAppBar.communityNameFontSize,
                                                    color: iconEnab_(context),
                                                    fontWeight: weight.bold
                                                ),
                                                maxLines: 2,
                                                key: nameWidgetKey,
                                              ),
                                            ),
                                          ),

                                          SimpleButton.from(
                                            context: context,
                                            radius: communityRadius,
                                            icon: MdiIcons.chevronDown,
                                            onTap: () => pushPage(
                                                context,
                                                builder: (context) => CircleDescriptionPage(
                                                  circle,
                                                  palette,
                                                )
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                )
                            ),

                            MembersWidget(
                              circle,
                              palette: palette,
                            ),

                            const SizedBox(height: Dimen.SIDE_MARG),

                          ],
                        )
                    ),
                  ),

                  if(circle.myRole == CircleRole.EDITOR || circle.myRole == CircleRole.ADMIN)
                    Padding(
                      padding: const EdgeInsets.only(top: Dimen.SIDE_MARG, right: Dimen.defMarg, left: Dimen.defMarg),
                      child: SimpleButton(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        onTap: () => openNewAnnouncementCreator(),
                        color: cardColor,
                        clipBehavior: Clip.antiAlias,
                        radius: CommunityPublishableWidgetTemplate.radius,
                        elevation: CommunityPublishableWidgetTemplate.elevation,
                        child: Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: Row(
                            children: [
                              Icon(MdiIcons.draw, color: hintEnab_(context)),
                              const SizedBox(width: Dimen.SIDE_MARG),
                              Text(
                                'Co w trawie piszczy?',
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
                      color: backgroundColor,
                      elevation: overlaps?AppCard.bigElevation:0,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        children: [

                          const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG + 2),

                          SimpleButton(
                              borderRadius: BorderRadius.vertical(
                                top: const Radius.circular(communityRadius),
                                bottom: Radius.circular(loadedAnnouncementsCount==0?communityRadius:0)
                              ),

                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimen.ICON_MARG,
                                vertical: Dimen.ICON_MARG,
                              ),
                              margin: EdgeInsets.zero,

                              color: currTab == AnnouncementCategories.pinned?
                              cardColor:
                              backgroundColor,

                              child: Text(
                                  circle.pinnedAnnouncements.isEmpty?
                                  'Przypięte':
                                  'Przypięte [${circle.pinnedCount}]',
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
                              borderRadius: BorderRadius.vertical(
                                  top: const Radius.circular(communityRadius),
                                  bottom: Radius.circular(loadedAnnouncementsCount==0?communityRadius:0)
                              ),

                              padding: const EdgeInsets.symmetric(
                                horizontal: Dimen.ICON_MARG,
                                vertical: Dimen.ICON_MARG,
                              ),

                              color: currTab == AnnouncementCategories.all?
                              cardColor:
                              backgroundColor,

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
                                borderRadius: BorderRadius.vertical(
                                    top: const Radius.circular(communityRadius),
                                    bottom: Radius.circular(loadedAnnouncementsCount==0?communityRadius:0)
                                ),

                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimen.ICON_MARG,
                                  vertical: Dimen.ICON_MARG,
                                ),

                                color: currTab == AnnouncementCategories.awaiting?
                                cardColor:
                                backgroundColor,

                                margin: EdgeInsets.zero,
                                child: Text(
                                    'Oczekujące [${circle.awaitingCount}]',
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
                    );
                  },
                  height: 2*Dimen.ICON_MARG + Dimen.TEXT_SIZE_BIG,
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
        right: CommunityPublishableWidgetTemplate.borderHorizontalMarg,
        left: CommunityPublishableWidgetTemplate.borderHorizontalMarg,
      ),
      palette: palette,
      onAnnouncementUpdated: (announcement) => setState((){})
  );

  Widget getPinnedAnnouncements() => getAnnouncementsSliver(
      context,
      circle.pinnedAnnouncements,
      padding: const EdgeInsets.only(
        right: CommunityPublishableWidgetTemplate.borderHorizontalMarg,
        left: CommunityPublishableWidgetTemplate.borderHorizontalMarg,
      ),
      palette: palette,
      emptyMessage: 'Brak przypiętych ogłoszeń',
      onAnnouncementUpdated: (announcement) => setState((){})
  );

  Widget getAwaitingAnnouncements() => getAnnouncementsSliver(
      context,
      circle.awaitingAnnouncements,
      padding: const EdgeInsets.only(
        right: CommunityPublishableWidgetTemplate.borderHorizontalMarg,
        left: CommunityPublishableWidgetTemplate.borderHorizontalMarg,
      ),
      palette: palette,
      emptyMessage: 'Brak oczekujących ogłoszeń',
      onAttendanceChanged: (announcement){
        showAppToast(
          context,
          text: 'Dzięki! Ogłoszenie przeniesione.',
          buttonText: 'Zobacz',
          onButtonPressed: () => pushPage(
            context,
            builder: (context) => AnnouncementExpandedPage(
              announcement,
              palette: palette,
              onAnnouncementUpdated: () => setState(() {}),
              showCommunityInfo: false,
            ),
          ),
          duration: const Duration(seconds: 7)
        );
      },
      onAnnouncementUpdated: (announcement) => setState((){}),
  );

  void openNewAnnouncementCreator() async {

    bool? isEvent;

    await showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        color: CommunityCoverColors.backgroundColor(context, palette),
        builder: (context) => Column(
          children: [

            CreateNewButton(
                icon: MdiIcons.noteTextOutline,
                title: 'Ogłoszenie',
                description: 'Dodaj ogłoszenie, przypomnienie, informację, zasady drużyny lub listę ekwipunku',
                onTap: (){
                  isEvent = false;
                  Navigator.pop(context);
                }
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            CreateNewButton(
                icon: MdiIcons.calendarRangeOutline,
                title: 'Wydarzenie',
                description: 'Dodaj wydarzenie służby, zbiórki, biwaku, rajdu, mszy lub obozu!',
                onTap: (){
                  isEvent = true;
                  Navigator.pop(context);
                }
            ),

          ],
        )
      )
    );

    if(isEvent == null) return;

    pushPage(
      context,
      builder: (context) => AnnouncementEditorPage(
        circle: circle,
        palette: palette,
        isEvent: isEvent!,
        onSaved: (announcement){
          circle.addAllAnnouncement(announcement);
          if(announcement.pinned) {
            circle.addPinnedAnnouncement(announcement);
            circle.pinnedCount += 1;
          }
          if(announcement.isAwaitingMyResponse) {
            circle.addAwaitingAnnouncement(announcement);
            circle.awaitingCount += 1;
          }
          setState(() => currTab = AnnouncementCategories.all);
        },
      )
    );

  }

}

class MembersWidget extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  final EdgeInsets padding;

  const MembersWidget(this.circle, {this.palette, this.padding=EdgeInsets.zero, super.key});

  static void onTap(Circle circle, PaletteGenerator? palette, BuildContext context) => pushPage(
      context,
      builder: (context) => MembersPage(circle: circle, palette: palette)
  );

  @override
  State<StatefulWidget> createState() => MembersWidgetState();

}

class MembersWidgetState extends State<MembersWidget>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;
  EdgeInsets get padding => widget.padding;

  late bool isLoading;

  Future<void> loadMoreMembers() async {
    setState(() => isLoading = true);
    if(!await isNetworkAvailable()){
      setState(() => isLoading = false);
      return;
    }
    await ApiCircle.getMembers(
      circleKey: circle.key,
      pageSize: Circle.memberPageSize,
      lastRole: circle.members.length==1?null:circle.members.last.role,
      lastUserName: circle.members.length==1?null:circle.members.last.name,
      lastUserKey: circle.members.length==1?null:circle.members.last.key,
      onSuccess: (membersPage){
        Member me = circle.membersMap[AccountData.key]!;
        membersPage.removeWhere((member) => member.key == me.key);
        membersPage.insert(0, me);
        circle.addMembers(membersPage, context: context);
        setState((){});
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        setState(() {});
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        return true;
      },
      onError: (){
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
      },
    );

    setState(() => isLoading = false);

  }

  @override
  void initState() {
    isLoading = circle.members.length == 1;
    if(isLoading) loadMoreMembers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: padding,
    child: Row(
      children: [

        Expanded(
          child: AccountThumbnailLoadableRowWidget(
            circle.members.map((m) => m.name).toList(),
            elevated: CommunityPublishableWidgetTemplate.elevation != 0,
            color: CommunityCoverColors.backgroundColor(context, palette),
            borderColor: CommunityCoverColors.backgroundColor(context, palette),
            backgroundColor: CommunityCoverColors.cardColor(context, palette),
            padding: const EdgeInsets.symmetric(horizontal: Dimen.defMarg),
            onTap: () => pushPage(
              context,
              builder: (context) => MembersPage(circle: circle, palette: palette)
            ),
            heroBuilder: (index) => circle.members[index],

            onLoadMore: () => loadMoreMembers(),
            isLoading: isLoading,
            isMoreToLoad: circle.members.length < circle.memberCount,
          ),
        ),

        if(circle.memberCount == 1)
          SimpleButton(
              color: CommunityCoverColors.backgroundColor(context, palette),
              radius: 100,
              child: Row(
                children: [
                  const SizedBox(width: 2*Dimen.ICON_MARG),

                  Text(
                    'Dodaj członków',
                    style: AppTextStyle(
                        fontWeight: weight.halfBold,
                        color: textEnab_(context),
                        fontSize: Dimen.TEXT_SIZE_APPBAR
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(width: Dimen.ICON_MARG),

                  AccountThumbnailWidget(
                    elevated: false,
                    color: CommunityCoverColors.cardColor(context, palette),
                    borderColor: CommunityCoverColors.backgroundColor(context, palette),
                    icon: MdiIcons.accountPlusOutline,
                  )
                ],
              ),
              onTap: () => MembersWidget.onTap(circle, palette, context)
          ),

        const SizedBox(width: Dimen.defMarg),

      ],
    ),
  );

}

class _CircleLoadingWidget extends StatelessWidget{

  const _CircleLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: SpinKitDualRing(color: iconEnab_(context), size: 48.0),
  );

}

class InitAwaitingMessageDialog extends StatelessWidget{

  final PaletteGenerator? palette;

  const InitAwaitingMessageDialog({required this.palette, super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: StripeWidget(
        borderRadius: BorderRadius.circular(communityRadius),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.defMarg),
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(communityRadius - 2),
            color: CommunityCoverColors.backgroundColor(context, palette),
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

class LeaveNotAdminDialog extends StatelessWidget{

  final Circle circle;
  const LeaveNotAdminDialog(this.circle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TitleShortcutRowWidget(
          title: 'Strefa zagrożenia!',
          titleColor: hintEnab_(context),
        ),

        LeaveCircleButton(circle)

      ],
    );
  }

}