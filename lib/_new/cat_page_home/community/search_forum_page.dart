import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'community_preview_data_widget.dart';
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

    runNewSearch(runProcessing: false).then((_) => mounted?setState(() => initProcessing = false):null);

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
      footer: AppCustomFooter(
          moreToLoad: moreToLoad && searchedCommunities != null && searchedCommunities!.isNotEmpty,
          showDotWhenAllLoaded: true
      ),
      physics: const BouncingScrollPhysics(),
      controller: refreshController,
      onLoading: () async {

        if(!moreToLoad) {
          if(mounted) refreshController.loadComplete(); // This is called in `post()` inside.
          post(() => mounted?setState(() {}):null);
          return;
        }

        if(!await isNetworkAvailable()){
          showAppToast(context, text: 'Brak dostępu do Internetu');
          if(mounted) refreshController.loadComplete(); // This is called in `post()` inside.
          post(() => mounted?setState(() {}):null);
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

        if(mounted) refreshController.loadComplete(); // This is called in `post()` inside.
        post(() => mounted?setState(() {}):null);

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
                  icon: Icon(MdiIcons.sortBoolAscending),
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
                  icon: Icon(MdiIcons.magnify),
                  color: initProcessing?iconDisab_(context):iconEnab_(context),
                  onPressed: initProcessing?null:(){
                    runNewSearch();
                    searchedText = controller.text;
                  },
                ),
              )

            ])),

            initProcessing?
            SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyMessageWidget(
                icon: MdiIcons.magnify,
                text: 'Ładowanie forów',
              ),
            ):
            searchedCommunities == null?
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyMessageWidget(
                  icon: MdiIcons.magnify,
                  text: 'Wyszukaj fora\npo ich nazwie',
                ),
              ):
            searchedCommunities!.isEmpty?
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyMessageWidget(
                  icon: Forum.iconOff,
                  text: 'Brak forów\no zadanej nazwie',
                ),
              ):
              SliverPadding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                    (context, index) => CommunityPreviewDataWidget(
                      searchedCommunities![index],
                      onForumTap: (forum) => tryOpenPreviewForum(
                        context,
                        searchedCommunities![index].forum!,
                        onDeleted: () => setState(() => searchedCommunities!.removeAt(index)),
                        onFollowChanged: (followed) => setState(() {}),
                        onLikeChanged: (liked) => setState(() {}),
                      ),
                      showHeaderInContact: true,
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
          leading: Icon(MdiIcons.thumbUpOutline),
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
          leading: Icon(MdiIcons.eyeOutline),
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
