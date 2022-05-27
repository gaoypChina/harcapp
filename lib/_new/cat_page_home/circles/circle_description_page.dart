import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/circle.dart';
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
import 'announcement_widget.dart';
import 'circle_editor/_main.dart';
import 'circle_page.dart';
import 'circle_palette_generator.dart';
import 'circle_role.dart';
import 'cover_image.dart';
import 'members_page/members_admin_page.dart';
import 'members_page/members_page.dart';
import 'model/circle.dart';

class CircleDescriptionPage extends StatefulWidget{

  final Circle circle;
  final void Function()? onLeft;
  final void Function()? onDeleted;
  const CircleDescriptionPage(this.circle, {this.onLeft, this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => CircleDescriptionPageState();

}

class CircleDescriptionPageState extends State<CircleDescriptionPage>{

  static const String allAnnsTab = 'all_announcements';
  static const String pinnedAnnsTab = 'pinned_announcements';
  static const String awaitingAnnsTab = 'awaiting_announcements';

  late String currTab;

  Circle get circle => widget.circle;
  void Function()? get onLeft => widget.onLeft;
  void Function()? get onDeleted => widget.onDeleted;

  late RefreshController refreshController;

  PaletteGenerator? paletteGeneratorFirst;
  PaletteGenerator? paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    paletteGeneratorFirst = await getPaletteGenerator(circle.coverImage!.local, circle.coverImage!.firstFileName);
    paletteGeneratorSecond = await getPaletteGenerator(circle.coverImage!.local, circle.coverImage!.secondFileName);

    if(!refresh) return;

    setState(() {});
    notifyScrollController();
  }

  late ScrollController scrollController;

  late GlobalKey appBarKey;
  late GlobalKey tabBarKey;

  late AppBarProvider appBarProv;

  @override
  void initState() {

    currTab = allAnnsTab;

    appBarKey = GlobalKey();
    tabBarKey = GlobalKey();

    scrollController = ScrollController();
    scrollController.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;
      final appBarBox = appBarKey.currentContext?.findRenderObject() as RenderBox?;
      double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (appBarPos < kToolbarHeight && !appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = true;
      else if(appBarPos >= kToolbarHeight && appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = false;

      if (appBarPos < 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;
      else if(appBarPos >= 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;

      final tabBarBox = tabBarKey.currentContext?.findRenderObject() as RenderBox?;
      double tabBarPos = tabBarBox==null? -double.infinity: tabBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (tabBarPos <= 96 && appBarProv.elevated) appBarProv.elevated = false;
      else if(tabBarPos > 96 && !appBarProv.elevated) appBarProv.elevated = true;
    });

    refreshController = RefreshController();
    initPaletteGenerator();

    super.initState();
  }

  @override
  void dispose(){
    scrollController.dispose();
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
  Color get iconColor => CirclePage.coverIconColor(context, paletteAlways);

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
      const CircleLoadingWidget():
      SmartRefresher(
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
                onError: () => showAppToast(context, text: 'Coś poszło nie tak...')
            );
            refreshController.refreshCompleted();

          },
          child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [

                Consumer<AppBarProvider>(
                  builder: (context, prov, child) => SliverAppBar(
                    iconTheme: IconThemeData(
                        color: prov.coverVisible?iconEnab_(context):iconColor
                    ),
                    centerTitle: true,
                    pinned: true,
                    excludeHeaderSemantics: true,
                    elevation: prov.elevated?AppCard.bigElevation:0,
                    backgroundColor: backgroundColor,
                    expandedHeight: 200,
                    actions: [
                      IconButton(
                        icon: Icon(
                            MdiIcons.cogOutline,
                            color: prov.coverVisible?iconEnab_(context):iconColor
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
                        opacity: prov.showTitleOnAppBar?1:0,
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

                  if(circle.hasDescription)
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                        child: ExpandableText(
                          circle.description!,
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                          maxLines: 3,
                          animation: true,
                          linkColor: strongColor,
                          linkStyle: AppTextStyle(fontWeight: weight.halfBold),
                          expandText: 'więcej',
                          collapseText: 'mniej',
                        )
                    ),

                  if(circle.hasDescription)
                    const SizedBox(height: Dimen.ICON_SIZE),

                  AccountThumbnailRowWidget(
                    circle.members.map((m) => m.name).toList(),
                    elevated: true,
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
                              palette: palette,
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
                                    'Przypięte (${circle.pinnedAnnouncements.length})',
                                    style: AppTextStyle(
                                        fontSize: Dimen.TEXT_SIZE_BIG,
                                        fontWeight: currTab == pinnedAnnsTab?weight.halfBold:weight.normal,
                                        color: currTab == pinnedAnnsTab?iconEnab_(context):iconDisab_(context)
                                    )
                                ),
                                onTap: (){
                                  notifyScrollController();
                                  setState(() => currTab = pinnedAnnsTab);
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
                                        fontWeight: currTab == allAnnsTab?weight.halfBold:weight.normal,
                                        color: currTab == allAnnsTab?iconEnab_(context):iconDisab_(context)
                                    )
                                ),
                                onTap: (){
                                  notifyScrollController();
                                  setState(() => currTab = allAnnsTab);
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
                                      'Oczekujące (${circle.awaitingAnnouncements.length})',
                                      style: AppTextStyle(
                                          fontSize: Dimen.TEXT_SIZE_BIG,
                                          fontWeight: currTab == awaitingAnnsTab?weight.halfBold:weight.normal,
                                          color: currTab == awaitingAnnsTab?iconEnab_(context):iconDisab_(context)
                                      )
                                  ),
                                  onTap: (){
                                    notifyScrollController();
                                    setState(() => currTab = awaitingAnnsTab);
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
              palette,
              onAnnouncementUpdated: () => setState((){}),
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
              palette,
              onAnnouncementUpdated: () => setState((){}),
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
            palette,
            onAnnouncementUpdated: () => setState((){}),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
          count: circle.awaitingAnnouncements.length
        )),
      );

  }

}

class CircleLoadingWidget extends StatelessWidget{

  const CircleLoadingWidget({super.key});

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

  AppBarProvider(){
    _elevated = true;
    _showTitleOnAppBar = false;
    _coverVisible = true;
  }

}