import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
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

import '../../../_common_classes/sliver_child_builder_separated_delegate.dart';
import '../../../_common_widgets/app_toast.dart';
import 'announcement_edit_page/_main.dart';
import 'circle_editor/_main.dart';
import 'circle_palette_generator.dart';
import 'circle_role.dart';
import 'cover_image.dart';
import 'members_page/members_admin_page.dart';
import 'members_page/members_page.dart';
import 'model/announcement.dart';
import 'model/circle.dart';

class CirclePage extends StatefulWidget{

  static Color? _lighten(Color? color, [double amount = .1]) {
    if(color == null) return null;

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(amount);

    return hslLight.toColor();
  }

  static Color? appBarColor(BuildContext context, PaletteGenerator? palette){
    if(palette == null) return background_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor!.color, .1);
    else
      return _lighten(palette.dominantColor!.color, .86);
  }

  static Color? backgroundColor(BuildContext context, PaletteGenerator? palette){
    if(palette == null) return background_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor!.color, .1);
    else
      return _lighten(palette.dominantColor!.color, .86);

  }

  static Color? cardColor(BuildContext context, PaletteGenerator? palette){
    if(palette == null) return cardEnab_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor!.color, .16);
    else
      return _lighten(palette.dominantColor!.color, .8);

  }

  static Color strongColor(BuildContext context, PaletteGenerator? palette) =>
      _lighten(palette?.dominantColor?.color, .5)??iconEnab_(context);

  final Circle circle;
  final void Function()? onLeft;
  final void Function()? onDeleted;
  const CirclePage(this.circle, {this.onLeft, this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => CirclePageState();

}

class CirclePageState extends State<CirclePage>{

  static const String allAnnsTab = 'all_announcements';
  static const String pinnedAnnsTab = 'pinned_announcements';
  static const String awaitingAnnsTab = 'awaiting_announcements';

  late String currTab;

  Circle get circle => widget.circle;
  void Function()? get onLeft => widget.onLeft;
  void Function()? get onDeleted => widget.onDeleted;

  late RefreshController refreshController;

  late AppBottomNavigatorProvider appBottomNavigatorProvider;

  PaletteGenerator? paletteGeneratorFirst;
  PaletteGenerator? paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    paletteGeneratorFirst = await getPaletteGenerator(circle.coverImage!.local, circle.coverImage!.firstFileName);
    paletteGeneratorSecond = await getPaletteGenerator(circle.coverImage!.local, circle.coverImage!.secondFileName);

    appBottomNavigatorProvider.background = backgroundColor;

    if(refresh) setState(() {});
  }

  ScrollController? scrollController;

  GlobalKey? appBarKey;
  GlobalKey? tabBarKey;

  late bool showTitleOnAppBar;
  AppBarElevationProvider? appBarElevationProv;

  void onBottomNavSelected(int page){
    if(page != AppBottomNavigator.HOME)
      appBottomNavigatorProvider.background = null;
  }

  @override
  void initState() {

    currTab = allAnnsTab;

    appBarKey = GlobalKey();
    tabBarKey = GlobalKey();

    showTitleOnAppBar = false;

    scrollController = ScrollController();
    scrollController!.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;
      final appBarBox = appBarKey!.currentContext?.findRenderObject() as RenderBox?;
      double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (appBarPos < kToolbarHeight/2 && !showTitleOnAppBar) setState(() => showTitleOnAppBar = true);
      else if(appBarPos >= kToolbarHeight/2 && showTitleOnAppBar) setState(() => showTitleOnAppBar = false);

      final tabBarBox = tabBarKey!.currentContext?.findRenderObject() as RenderBox?;
      double tabBarPos = tabBarBox==null? -double.infinity: tabBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (tabBarPos <= 96 && appBarElevationProv!.elevated!) appBarElevationProv!.elevated = false;
      else if(tabBarPos > 96 && !appBarElevationProv!.elevated!) appBarElevationProv!.elevated = true;
    });

    refreshController = RefreshController();
    appBottomNavigatorProvider = Provider.of<AppBottomNavigatorProvider>(context, listen: false);
    post(() => appBottomNavigatorProvider.background = null);
    AppBottomNavigatorProvider.addOnSelectedListener(onBottomNavSelected);
    initPaletteGenerator();

    super.initState();
  }

  @override
  void dispose(){
    AppBottomNavigatorProvider.removeOnSelectedListener(onBottomNavSelected);
    scrollController!.dispose();
    super.dispose();
  }

  PaletteGenerator? get paletteGenerator{
    if(circle.colorsKey == 'none') return null;

    if(paletteGeneratorSecond == null) return paletteGeneratorFirst;
    return AppSettings.isDark?paletteGeneratorSecond:paletteGeneratorFirst;
  }

  Color? get appBarColor => CirclePage.appBarColor(context, paletteGenerator);
  Color? get backgroundColor => CirclePage.backgroundColor(context, paletteGenerator);
  Color? get cardColor => CirclePage.cardColor(context, paletteGenerator);
  Color get strongColor => CirclePage.strongColor(context, paletteGenerator);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context){
      appBarElevationProv = AppBarElevationProvider();
      return appBarElevationProv;
    },
    builder: (context, child) => Material(
      animationDuration: const Duration(milliseconds: 300),
      color: backgroundColor,
      child: SmartRefresher(
          enablePullDown: true,
          physics: const BouncingScrollPhysics(),
          header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: strongColor),
          controller: refreshController,
          onRefresh: () async {

            if(!await isNetworkAvailable()){
              showAppToast(context, text: 'Brak dostępu do Internetu');
              refreshController.refreshCompleted();
              return;
            }

            await ApiCircle.get(
                circleKey: circle.key,
                onSuccess: (updatedCircle) async {
                  circle.name = updatedCircle.name;
                  circle.description = updatedCircle.description;
                  circle.coverImage = updatedCircle.coverImage;
                  circle.colorsKey = updatedCircle.colorsKey;

                  await initPaletteGenerator(refresh: false);

                  setState(() {});
                },
                onError: () => null
            );
            refreshController.refreshCompleted();

          },
          child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [

                Consumer<AppBarElevationProvider>(
                  builder: (context, prov, child) => SliverAppBar(
                    centerTitle: true,
                    pinned: true,
                    excludeHeaderSemantics: true,
                    elevation: prov.elevated!?AppCard.bigElevation:0,
                    backgroundColor: backgroundColor,
                    expandedHeight: 200,
                    actions: [
                      IconButton(
                        icon: const Icon(MdiIcons.cogOutline),
                        onPressed: () => pushPage(
                            context,
                            builder: (context) => CircleEditorPage(
                              initCircle: circle,
                              palette: paletteGenerator,
                              onSaved: (updatedCircle) async {

                                circle.name = updatedCircle.name;
                                circle.description = updatedCircle.description;
                                circle.coverImage = updatedCircle.coverImage;
                                circle.colorsKey = updatedCircle.colorsKey;
                                circle.setAllAnnouncement(updatedCircle.announcements);
                                circle.setAllMembers(context, updatedCircle.members);

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
                        opacity: showTitleOnAppBar?1:0,
                        duration: const Duration(milliseconds: 200),
                        child: Text(
                          circle.name,
                          style: AppTextStyle(
                              color: iconEnab_(context)
                          ),
                          maxLines: 1,
                        ),
                      ),
                      centerTitle: true,
                      background: CoverImage(circle.coverImage),
                    ),
                  ),
                ),

                SliverList(delegate: SliverChildListDelegate([

                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Center(
                      child: Text(
                        circle.name,
                        style: AppTextStyle(
                            fontSize: 28.0,
                            fontWeight: weight.halfBold
                        ),
                        textAlign: TextAlign.center,
                        key: appBarKey,
                      ),
                    ),
                  ),

                  AccountThumbnailRowWidget(
                    circle.members.map((m) => m.name).toList(),
                    elevated: true,
                    backgroundColor: backgroundColor,
                    padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                    onTap: () => pushPage(
                      context,
                      builder: (context) => circle.myRole == CircleRole.ADMIN || circle.myRole == CircleRole.MODERATOR?
                      MembersAdminPage(circle, paletteGenerator):
                      MembersPage(circle, paletteGenerator)
                    ),
                    heroBuilder: (index) => circle.members[index],
                  ),

                  if(circle.members.firstWhere((mem) => mem.key == AccountData.key).role != CircleRole.OBSERVER)
                    Padding(
                      padding: const EdgeInsets.only(top: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
                      child: SimpleButton(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        onTap: () => pushPage(
                          context,
                          builder: (context) => AnnouncementEditorPage(
                            circle: circle,
                            palette: paletteGenerator,
                            onSaved: (announcement){
                              circle.addAnnouncement(announcement);
                              setState(() {});
                            },
                          )
                        ),
                        color: cardColor,
                        clipBehavior: Clip.antiAlias,
                        radius: AppCard.BIG_RADIUS,
                        elevation: AppCard.bigElevation,
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
                      color: CirclePage.backgroundColor(context, paletteGenerator),
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
                                  'Przypięte (${circle.pinnedAnnouncements.length})',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      fontWeight: currTab == pinnedAnnsTab?weight.halfBold:weight.normal,
                                      color: currTab == pinnedAnnsTab?iconEnab_(context):iconDisab_(context)
                                  )
                                ),
                                onTap: () => setState(() => currTab = pinnedAnnsTab)
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
                                  fontWeight: currTab == allAnnsTab?weight.halfBold:weight.normal,
                                  color: currTab == allAnnsTab?iconEnab_(context):iconDisab_(context)
                                )
                              ),
                              onTap: () => setState(() => currTab = allAnnsTab)
                            ),

                            SimpleButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimen.ICON_MARG,
                                  vertical: Dimen.ICON_MARG,
                                ),
                                margin: EdgeInsets.zero,
                                child: Text(
                                  circle.awaitingAnnouncements.isEmpty?
                                  'Oczekujące':
                                  'Oczekujące (${circle.awaitingAnnouncements.length})',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      fontWeight: currTab == awaitingAnnsTab?weight.halfBold:weight.normal,
                                      color: currTab == awaitingAnnsTab?iconEnab_(context):iconDisab_(context)
                                  )
                                ),
                                onTap: () => setState(() => currTab = awaitingAnnsTab)
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                  height: Dimen.ICON_FOOTPRINT,
                  rebuild: true,
                ),

                if(currTab == allAnnsTab)
                  getAllAnnouncements()
                else if(currTab == pinnedAnnsTab)
                  getPinnedAnnouncements()
                else if(currTab == awaitingAnnsTab)
                  getAwaitingAnnouncements()
              ]
          )

      ),
    ),
  );

  Widget getAllAnnouncements(){

    if(circle.announcements.isEmpty)
      return SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
          right: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          bottom: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildListDelegate([
          const SizedBox(height: 2*Dimen.SIDE_MARG),
          EmptyMessageWidget(
            icon: MdiIcons.newspaperVariantOutline,
            text: 'Brak postów',
            color: cardColor,
          ),
        ])),
      );
    else
      return SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
          right: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          bottom: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
            (context, index) => AnnouncementWidget(
              circle.announcements.reversed.toList()[index],
              paletteGenerator: paletteGenerator,
              onUpdateTap: (){

                Announcement announcement  = circle.announcements.reversed.toList()[index];

                pushPage(
                    context,
                    builder: (context) => AnnouncementEditorPage(
                      circle: circle,
                      initAnnouncement: announcement,
                      palette: paletteGenerator,
                      onSaved: (updatedAnnouncement){
                        circle.updateAnnouncement(updatedAnnouncement);
                        setState(() {});
                      },
                      onRemoved: (){
                        circle.removeAnnouncement(announcement);
                        setState(() {});
                      },
                    )
                );

              },
              onPinTap: () async {

                Announcement announcement = circle.announcements.reversed.toList()[index];

                await ApiCircle.updateAnnouncement(
                    annKey: announcement.key,
                    pinned: !announcement.pinned,
                    onSuccess: (updatedAnnouncement) async {

                      circle.announcements.reversed.toList()[index].pinned = updatedAnnouncement.pinned;

                      if(updatedAnnouncement.pinned)
                        showAppToast(context, text: 'Przypięto post');
                      else
                        showAppToast(context, text: 'Odpięto post');
                      setState(() {});
                    },
                    onError: () async {

                    }
                );

              },
              onAttendanceChanged: (_) => setState((){}),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
            count: circle.announcements.length
        )),
      );

  }

  Widget getPinnedAnnouncements(){

    if(circle.pinnedAnnouncements.isEmpty)
      return SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
          right: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          bottom: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildListDelegate([
          const SizedBox(height: 2*Dimen.SIDE_MARG),
          EmptyMessageWidget(
            icon: MdiIcons.newspaperVariantOutline,
            text: 'Brak przypiętych postów',
            color: cardColor,
          ),
        ])),
      );
    else
      return SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
          right: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          bottom: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
            (context, index) => AnnouncementWidget(
              circle.pinnedAnnouncements.reversed.toList()[index],
              paletteGenerator: paletteGenerator,
              onUpdateTap: (){

                Announcement announcement  = circle.pinnedAnnouncements.reversed.toList()[index];

                pushPage(
                    context,
                    builder: (context) => AnnouncementEditorPage(
                      circle: circle,
                      initAnnouncement: announcement,
                      palette: paletteGenerator,
                      onSaved: (updatedAnnouncement){
                        circle.updateAnnouncement(updatedAnnouncement);
                        setState(() {});
                      },
                      onRemoved: (){
                        circle.removeAnnouncement(announcement);
                        setState(() {});
                      },
                    )
                );

              },
              onPinTap: () async {

                Announcement announcement = circle.pinnedAnnouncements.reversed.toList()[index];

                await ApiCircle.updateAnnouncement(
                    annKey: announcement.key,
                    pinned: !announcement.pinned,
                    onSuccess: (updatedAnnouncement) async {

                      circle.pinnedAnnouncements.reversed.toList()[index].pinned = updatedAnnouncement.pinned;

                      if(updatedAnnouncement.pinned)
                        showAppToast(context, text: 'Przypięto post');
                      else
                        showAppToast(context, text: 'Odpięto post');
                      setState(() {});
                    },
                    onError: () async {

                    }
                );

              },
              onAttendanceChanged: (_) => setState((){}),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
            count: circle.pinnedAnnouncements.length
        )),
      );

  }

  Widget getAwaitingAnnouncements(){

    if(circle.awaitingAnnouncements.isEmpty)
      return SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
          right: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          bottom: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildListDelegate([
          const SizedBox(height: 2*Dimen.SIDE_MARG),
          EmptyMessageWidget(
            icon: MdiIcons.newspaperVariantOutline,
            text: 'Brak oczekujących postów',
            color: cardColor,
          ),
        ])),
      );
    else
      return SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
          right: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          bottom: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
          (context, index) => AnnouncementWidget(
            circle.awaitingAnnouncements.reversed.toList()[index],
              paletteGenerator: paletteGenerator,
              onUpdateTap: (){

                Announcement announcement = circle.awaitingAnnouncements.reversed.toList()[index];

                pushPage(
                    context,
                    builder: (context) => AnnouncementEditorPage(
                      circle: circle,
                      initAnnouncement: announcement,
                      palette: paletteGenerator,
                      onSaved: (updatedAnnouncement){
                        circle.updateAnnouncement(updatedAnnouncement);
                        setState(() {});
                      },
                      onRemoved: (){
                        circle.removeAnnouncement(announcement);
                        setState(() {});
                      },
                    )
                );

              },
              onPinTap: () async {

                Announcement announcement = circle.awaitingAnnouncements.reversed.toList()[index];

                await ApiCircle.updateAnnouncement(
                    annKey: announcement.key,
                    pinned: !announcement.pinned,
                    onSuccess: (updatedAnnouncement) async {

                      circle.awaitingAnnouncements.reversed.toList()[index].pinned = updatedAnnouncement.pinned;

                      if(updatedAnnouncement.pinned)
                        showAppToast(context, text: 'Przypięto post');
                      else
                        showAppToast(context, text: 'Odpięto post');
                      setState(() {});
                    },
                    onError: () async {

                    }
                );

              },
              onAttendanceChanged: (_) => setState((){}),
          ),
            separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
            count: circle.awaitingAnnouncements.length
        )),
      );

  }

}

class AppBarElevationProvider extends ChangeNotifier{

  bool? _elevated;
  bool? get elevated => _elevated;
  set elevated(bool? value){
    _elevated = value;
    notifyListeners();
  }

  AppBarElevationProvider(){
    _elevated = true;
  }

}