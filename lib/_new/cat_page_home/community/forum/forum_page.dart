import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/common/like_button.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/post_editor/_main.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/posts_sliver.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../common/community_cover_image_data.dart';
import '../community_publishable_widget_template.dart';
import '../community_sliver_app_bar.dart';
import 'common/follow_button.dart';
import 'forum_description_page.dart';
import 'forum_editor/_main.dart';
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

  static const forumCoverTag = 'forumCoverTag';
  static const forumNameTag = 'forumNameTag';

  Forum get forum => widget.forum;
  void Function()? get onLeft => widget.onFollowChanged;
  void Function()? get onDeleted => widget.onDeleted;

  late RefreshController refreshController;

  PaletteGenerator? paletteGeneratorFirst;
  PaletteGenerator? paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    if(CommunityCoverImageData.palettes.containsKey(forum.coverImage.code)) {
      paletteGeneratorFirst = CommunityCoverImageData.palettes[forum.coverImage.code]!.item1;
      paletteGeneratorSecond = CommunityCoverImageData.palettes[forum.coverImage.code]!.item2;
      return;
    }

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

    CommunityCoverImageData.palettes[forum.coverImage.code] = Tuple2(paletteGeneratorFirst, paletteGeneratorSecond);

    if(!refresh) return;

    setState(() {});
    notifyScrollController();
  }

  late ScrollController scrollController;

  late GlobalKey nameWidgetKey;

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

    nameWidgetKey = GlobalKey();

    scrollController = ScrollController();

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
      const _ForumLoadingWidget():

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
                  if(mounted) showServerWakingUpToast(context);
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
                  forum.community,
                  palette: palette,
                  coverImage: forum.coverImage,
                  mainScrollController: scrollController,
                  communityNameWidgetKey: nameWidgetKey,
                  heroTag: forumCoverTag,
                  actions: (appBarProv) => [

                    IconButton(
                      icon: Icon(
                          MdiIcons.cogOutline,
                          color: appBarProv.coverVisible?coverIconColor:iconEnab_(context)
                      ),
                      onPressed:
                      forum.myRole == ForumRole.ADMIN?() =>
                          pushPage(
                              context,
                              builder: (context) => ForumEditorPage(
                                community: forum.community,
                                palette: palette,
                                onSaved: (updatedForum) async {

                                  forum.description = updatedForum.description;
                                  forum.coverImage = updatedForum.coverImage;
                                  forum.colorsKey = updatedForum.colorsKey;

                                  if(mounted) Provider.of<ForumProvider>(context, listen: false).notify();
                                  if(mounted) Provider.of<ForumListProvider>(context, listen: false).notify();

                                  await initPaletteGenerator(refresh: false);

                                  setState(() {});
                                },
                                onDeleted: onDeleted,
                              )
                          ):

                          () => null,
                    ),
                  ],
                  bottomWidgets: [
                    ForumFollowButton(forum, palette: palette),

                    const SizedBox(width: Dimen.DEF_MARG),

                    ForumLikeButton(forum, palette: palette),
                  ],
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
                          tag: forumNameTag,
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
                                    key: nameWidgetKey,
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
                        radius: CommunityPublishableWidgetTemplate.radius,
                        elevation: CommunityPublishableWidgetTemplate.elevation,
                        child: Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: Row(
                            children: [
                              Icon(MdiIcons.draw, color: hintEnab_(context)),
                              const SizedBox(width: Dimen.SIDE_MARG),
                              Text(
                                'Dodaj post...',
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

class _ForumLoadingWidget extends StatelessWidget{

  const _ForumLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: SpinKitRipple(color: iconEnab_(context), size: 48.0),
  );

}
