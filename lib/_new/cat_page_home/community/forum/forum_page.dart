import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget_template.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcements_sliver.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/posts_sliver.dart';
import 'package:harcapp/_new/cat_page_home/cover_image.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'forum_role.dart';
import 'model/forum.dart';
import 'model/post.dart';

class ForumPage extends StatefulWidget{

  final Forum forum;
  final void Function()? onFollowChanged;
  final void Function()? onDeleted;
  const ForumPage(this.forum, {this.onFollowChanged, this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => ForumPageState();

}

class ForumPageState extends State<ForumPage>{

  static const circleCoverTag = 'forumCoverTag';
  static const circleNameTag = 'forumNameTag';

  Forum get forum => widget.forum;
  void Function()? get onLeft => widget.onFollowChanged;
  void Function()? get onDeleted => widget.onDeleted;

  late RefreshController refreshController;

  PaletteGenerator? paletteGeneratorFirst;
  PaletteGenerator? paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    try {
      paletteGeneratorFirst = await getPaletteGenerator(forum.coverImage.local, forum.coverImage.firstFileName);
      paletteGeneratorSecond = await getPaletteGenerator(forum.coverImage.local, forum.coverImage.secondFileName);
    } catch (e){
      paletteGeneratorFirst = PaletteGenerator.fromColors([PaletteColor(Colors.white, 1)]);
      paletteGeneratorSecond = PaletteGenerator.fromColors([PaletteColor(Colors.white, 1)]);

      post(() => forum.myRole == ForumRole.OBSERVER?
      showAppToast(context, text: 'Nie można załadować tła'):
      showAppToast(context, text: 'Nie można załadować tła. Zmień grafikę tła, by przyspieszyć ładowanie', duration: const Duration(seconds: 6)));
    }

    if(!refresh) return;

    setState(() {});
    notifyScrollController();
  }

  late ScrollController scrollController;

  late GlobalKey appBarKey;

  late AppBarProvider appBarProv;

  late int loadedPage;

  late bool changeShareCodeProcessing;

  late LoginListener loginListener;

  late bool _moreToLoad;
  bool get moreToLoad => _moreToLoad;
  set moreToLoad(bool value){
    _moreToLoad = value;
    logger.d('Loaded ${forum.allPosts.length} "all" posts. Any remaining: $value');
  }

  @override
  void initState() {

    changeShareCodeProcessing = false;

    appBarKey = GlobalKey();

    scrollController = ScrollController();
    scrollController.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;
      final appBarBox = appBarKey.currentContext?.findRenderObject() as RenderBox?;
      double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (appBarPos < kToolbarHeight && !appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = true;
      else if(appBarPos >= kToolbarHeight && appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = false;

      if (appBarPos < 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;
      else if(appBarPos >= 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;

    });

    refreshController = RefreshController();

    initPaletteGenerator();

    loadedPage = 0;

    _moreToLoad = forum.allPosts.length == Forum.postPageSize;

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
    if(forum.colorsKey == 'none') return null;
    return paletteAlways;
  }

  Color? get appBarColor => CommunityCoverColors.appBarColor(context, palette);
  Color? get backgroundColor => CommunityCoverColors.backgroundColor(context, palette);
  Color? get cardColor => CommunityCoverColors.cardColor(context, palette);
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

      Consumer<PostListProvider>(
        builder: (context, prov, child) => SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode){
              Widget body;
              if(!moreToLoad)
                body = forum.allPosts.isEmpty?
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
                  color: CommunityCoverColors.strongColor(context, palette),
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

            ForumListProvider forumListProv = Provider.of<ForumListProvider>(context, listen: false);

            await ApiForum.get(
                forumKey: forum.key,
                community: forum.community,
                onSuccess: (updatedForum) async {
                  forum.description = updatedForum.description;
                  forum.coverImage = updatedForum.coverImage;
                  forum.colorsKey = updatedForum.colorsKey;
                  forum.setAllManagers(context, updatedForum.managers);
                  forum.resetPosts(
                    updatedForum.allPosts,
                  );

                  loadedPage = 0;

                  _moreToLoad = forum.allPosts.length == Forum.postPageSize;

                  await initPaletteGenerator(refresh: false);

                  setState(() {});
                },
                onServerMaybeWakingUp: () {
                  if(mounted) showAppToast(context, text: serverWakingUpMessage);
                  return true;
                },
                onError: (responseStatusCode){
                  if(responseStatusCode == HttpStatus.notFound){
                    showAppToast(
                        context,
                        text: AccountData.sex == Sex.male ?
                        'Zostałeś wyproszony':
                        'Zostałaś wyproszona'
                    );
                    Forum.removeFromAll(forum);
                    forumListProv.notify();
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

            await ApiForum.getForumPosts(
                forumKey: forum.key,
                page: loadedPage + 1,
                onSuccess: (nextPosts){

                  int i;
                  for(i=0; i<nextPosts.length; i++)
                    if(!forum.postsMap.containsKey(nextPosts[i].key)) break;

                  forum.addAllPosts(nextPosts.sublist(i));
                  loadedPage += 1;

                  Provider.of<PostListProvider>(context, listen: false).notify();

                  if(nextPosts.length != Forum.postPageSize)
                    setState(() => moreToLoad = false);

                },
                onServerMaybeWakingUp: () {
                  if(mounted) showAppToast(context, text: serverWakingUpMessage);
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

                      IconButton(
                        icon: Icon(
                            MdiIcons.cogOutline,
                            color: prov.coverVisible?coverIconColor:iconEnab_(context)
                        ),
                        onPressed:
                        forum.myRole == ForumRole.ADMIN?() =>
                            pushPage(
                            context,
                            builder: (context) => ForumEditorPage(
                              community: forum.community,
                              palette: palette,
                              onSaved: (updatedCircle) async {

                                forum.description = updatedCircle.description;
                                forum.coverImage = updatedCircle.coverImage;
                                forum.colorsKey = updatedCircle.colorsKey;

                                if(mounted) Provider.of<ForumProvider>(context, listen: false).notify();
                                if(mounted) Provider.of<ForumListProvider>(context, listen: false).notify();

                                await initPaletteGenerator(refresh: false);

                                setState(() {});
                              },
                              onDeleted: onDeleted,
                              onFollowChanged: onLeft,
                            )
                        ):

                        () => null,
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: prov.showTitleOnAppBar?1:0,
                        duration: Duration(milliseconds: prov.showTitleOnAppBar?200:0),
                        child: Text(
                          forum.name,
                          style: AppTextStyle(
                              color: iconEnab_(context)
                          ),
                          maxLines: 1,
                        ),
                      ),
                      centerTitle: true,
                      background:
                      Hero(
                          tag: circleCoverTag,
                          child: Stack(
                            fit: StackFit.expand,
                            clipBehavior: Clip.none,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: CoverImage(forum.coverImage),
                              ),

                              Positioned(
                                left: Dimen.SIDE_MARG,
                                bottom: 0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                                  clipBehavior: Clip.hardEdge,
                                  color: cardColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                                    child: Icon(
                                      CommonIconData.ALL[forum.community.iconKey],
                                      size: 48.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                      ),

                    ),
                  ),
                ),

                SliverList(delegate: SliverChildListDelegate([

                  Padding(
                      padding: const EdgeInsets.only(
                        top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
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
                                    forum.name,
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
                                      builder: (context) => ForumDescriptionPage(
                                        forum,
                                        palette,
                                      )
                                  ),
                                )

                              ],
                            ),
                          )
                      )
                  ),


                  if(forum.myRole == ForumRole.MODERATOR || forum.myRole == ForumRole.ADMIN)
                    Padding(
                      padding: const EdgeInsets.only(top: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
                      child: SimpleButton(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        onTap: () => pushPage(
                            context,
                            builder: (context) => PostEditorPage(
                              forum: forum,
                              palette: palette,
                              onSaved: (post){
                                forum.addAllPost(post);
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

                getPostsSliver(
                    context,
                    forum.allPosts,
                    padding: const EdgeInsets.only(
                      top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                      right: Dimen.SIDE_MARG,
                      left: Dimen.SIDE_MARG,
                      bottom: Dimen.SIDE_MARG,
                    ),
                    palette: palette,
                    onAnnouncementUpdated: () => setState((){})
                )

              ]
          )

        ),
      )

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