import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/community_widget_template.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'forum/forum_loader_page.dart';
import 'forum/forum_widget.dart';
import 'model/community.dart';

class SearchForumPage extends StatefulWidget{

  const SearchForumPage({super.key});

  @override
  State<StatefulWidget> createState() => SearchForumPageState();

}

class SearchForumPageState extends State<SearchForumPage>{

  StreamSubscription<ConnectivityResult>? networkListener;
  late bool networkAvailable;

  List<CommunityPreviewData>? searchedCommunities;

  late RefreshController refreshController;
  late TextEditingController controller;
  late String searchedText;

  late bool processing;
  late bool initProcessing;
  late ForumSearchSort sort;

  late int loadedPage;

  late bool _moreToLoad;
  bool get moreToLoad => _moreToLoad;
  set moreToLoad(bool value){
    _moreToLoad = value;
    logger.d('Loaded ${searchedCommunities!.length} forums. Any remaining: $value');
  }

  @override
  void initState() {

    refreshController = RefreshController();

    networkAvailable = true;
    () async {
      networkAvailable = await isNetworkAvailable();
      if(mounted) setState((){});
    }();

    networkListener = addConnectionListener((hasConnection) async{
      networkAvailable = hasConnection;
      if(!mounted) return;
      setState((){});
      if(!hasConnection)
        showAppToast(context, text: 'Brak internetu');
    });

    controller = TextEditingController();
    searchedText = controller.text;

    processing = false;
    initProcessing = true;
    sort = ForumSearchSort.likes;

    loadedPage = 0;
    _moreToLoad = true;

    runNewSearch(runProcessing: false).then((_) => setState(() => initProcessing = false));

    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: SmartRefresher(
      enablePullDown: false,
      enablePullUp: searchedCommunities != null && !refreshController.isRefresh,
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode){
          Widget body;
          if(!moreToLoad)
            body = searchedCommunities!.isEmpty?
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
      controller: refreshController,
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

        await ApiCommunity.search(
            phrase: searchedText,
            sort: sort,
            page: loadedPage + 1,
            pageSize: CommunityPreviewData.searchPageSize,
            onSuccess: (nextComms){

              int i;
              List<String> searchedCommKeys = searchedCommunities!.map((c) => c.key).toList();
              for(i=0; i<nextComms.length; i++)
                if(!searchedCommKeys.contains(nextComms[i].key)) break;

              searchedCommunities!.addAll(nextComms);
              loadedPage += 1;

              if(nextComms.length != Forum.postPageSize)
                moreToLoad = false;

              setState((){});
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
          physics:
          const BouncingScrollPhysics(),

          slivers: [
            SliverAppBar(
              title: const Text('Szukaj forów'),
              centerTitle: true,
              floating: true,
              actions: [
                IconButton(
                  icon: const Icon(MdiIcons.sortBoolAscending),
                  onPressed: () => showScrollBottomSheet(
                    context: context,
                    builder: (context) => SortBottomSheet(
                      sort: sort,
                      onChanged: (value){
                        setState(() => sort = value);
                        runNewSearch();
                      },
                    )
                  ),
                )
              ],
            ),

            SliverList(delegate: SliverChildListDelegate([

              SearchField(
                hint: 'Nazwa forum:',
                controller: controller,
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.ICON_MARG),
                  child: Icon(Forum.icon, color: hintEnab_(context)),
                ),
                trailing:
                processing?
                Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: SpinKitChasingDots(
                    size: Dimen.ICON_SIZE,
                    color: iconEnab_(context),
                  ),
                ):
                IconButton(
                  icon: const Icon(MdiIcons.magnify),
                  color: initProcessing?iconDisab_(context):iconEnab_(context),
                  onPressed: initProcessing?null:(){
                    runNewSearch();
                    searchedText = controller.text;
                  },
                ),
              )

            ])),

            initProcessing?
            const SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyMessageWidget(
                icon: MdiIcons.magnify,
                text: 'Ładowanie forów',
              ),
            ):
            searchedCommunities == null?
              const SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyMessageWidget(
                  icon: MdiIcons.magnify,
                  text: 'Wyszukaj fora\npo ich nazwie',
                ),
              ):
            searchedCommunities!.isEmpty?
              const SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyMessageWidget(
                  icon: Forum.iconOff,
                  text: 'Brak forów\no zadanej nazwie',
                ),
              ):
              SliverPadding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                    (context, index) => CommunityBasicDataWidget(
                      searchedCommunities![index],
                      onForumTap: (forum){

                        if(Community.allForumMap!.containsKey(forum.key))
                          CatPageHomeState.openForumPage(
                            context,
                            Community.allForumMap![forum.key]!,
                            onDeleted: () => setState(() => searchedCommunities!.removeAt(index)),
                            onFollowChanged: (followed){
                              ForumBasicData forum = searchedCommunities![index].forum!;
                              if(followed && !forum.followed)
                                forum.followersCnt += 1;
                              else if(!followed && forum.followed)
                                forum.followersCnt -= 1;

                              forum.followed = followed;
                              setState(() {});
                            },
                            onLikeChanged: (liked){
                              ForumBasicData forum = searchedCommunities![index].forum!;
                              if(liked && !forum.liked)
                                forum.likeCnt += 1;
                              else if(!liked && forum.liked)
                                forum.likeCnt -= 1;

                              forum.liked = liked;
                              setState(() {});
                            }
                          );
                        else
                          pushPage(
                            context,
                            builder: (context) => ForumLoaderPage(
                              forum: forum
                            )
                          );
                      }
                    ),

                    separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),

                    count: searchedCommunities!.length,

                )),
              )

          ]
      ),
    ),
  );

  Future<void> runNewSearch({bool runProcessing = true}) async {
    if(runProcessing) setState(() => processing = true);
    await ApiCommunity.search(
      phrase: searchedText,
      sort: sort,
      onSuccess: (result){
        setState(() => searchedCommunities = result);
        if(searchedCommunities!.length != CommunityPreviewData.searchPageSize)
          moreToLoad = false;
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        Navigator.pop(context);
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        setState(() {});
        return true;
      },
      onError: () => mounted?showAppToast(context, text: simpleErrorMessage):null,
    );
    if(runProcessing && mounted) setState(() => processing = false);
  }

}

class SortBottomSheet extends StatelessWidget{

  final ForumSearchSort sort;
  final void Function(ForumSearchSort)? onChanged;
  const SortBottomSheet({required this.sort, this.onChanged, super.key});

  @override
  Widget build(BuildContext context) => BottomSheetDef(
    title: 'Sortuj',
    builder: (context) => Column(
      children: [

        ListTile(
          leading: const Icon(MdiIcons.thumbUpOutline),
          title: Text('Od najczęściej lubianych', style: AppTextStyle()),
          selected: sort == ForumSearchSort.likes,
          selectedColor: iconEnab_(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
          selectedTileColor: backgroundIcon_(context),
          onTap: (){
            onChanged?.call(ForumSearchSort.likes);
            Navigator.pop(context);
          }
        ),

        const SizedBox(height: Dimen.defMarg),

        ListTile(
          leading: const Icon(MdiIcons.eyeOutline),
          title: Text('Od najczęściej obserwowanych', style: AppTextStyle()),
          selected: sort == ForumSearchSort.follows,
          selectedColor: iconEnab_(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
          selectedTileColor: backgroundIcon_(context),
          onTap: (){
            onChanged?.call(ForumSearchSort.follows);
            Navigator.pop(context);
          }
        ),

      ],
    )
  );

}

class CommunityBasicDataWidget extends StatelessWidget{

  final CommunityPreviewData community;
  final void Function(ForumBasicData)? onForumTap;
  const CommunityBasicDataWidget(this.community, {this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => CommunityWidgetTemplate(
      community.key,
      community.iconKey,
      community.name,

      subtitle: community.forum!.followed?
      Padding(
        padding: const EdgeInsets.only(top: Dimen.defMarg),
        child: Row(
          children: [

            Padding(
              padding: const EdgeInsets.only(right: Dimen.ICON_MARG),
              child: Icon(MdiIcons.eyeCheckOutline, color: iconDisab_(context)),
            ),

            Text(
              'Obserwujesz',
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                  fontWeight: weight.halfBold,
                  color: iconDisab_(context)
              ),
            )

          ],
        ),
      ):null,

      child: Consumer<ForumProvider>(
        builder: (context, prov, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: const EdgeInsets.all(Dimen.defMarg),
              child: ForumWidget(
                community.forum!,
                onTap:
                onForumTap == null?
                null:
                    () => onForumTap?.call(community.forum!),
              ),
            ),

            if(community.forum!.description != null)
              Padding(
                padding: const EdgeInsets.only(top: Dimen.ICON_MARG, left: Dimen.ICON_MARG),
                child: Text(
                  'Opis:',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold
                  ),
                  maxLines: 4,
                ),
              ),

            if(community.forum!.description != null)
              Padding(
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                child: Text(
                  community.forum!.description!,
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                  maxLines: 4,
                ),
              )

          ],
        )
      )
  );

}
