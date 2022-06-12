import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../_common_widgets/harc_app.dart';
import '../api/circle.dart';
import 'circles/model/circle.dart';
import 'competitions/announcement_sliver.dart';
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

  @override
  void initState() {

    scrollController = ScrollController();
    refreshController = RefreshController(initialRefresh: Announcement.all == null);

    loadedPage = -1;
    moreToLoad = true;

    super.initState();
  }

  @override
  void dispose(){
    scrollController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
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
        physics: const BouncingScrollPhysics(),
        header: MaterialClassicHeader(
            backgroundColor: cardEnab_(context),
        ),
        controller: refreshController,
        onRefresh: () async {

          if(!await isNetworkAvailable()){
            showAppToast(context, text: 'Brak dostępu do Internetu');
            refreshController.refreshCompleted();
            return;
          }

          await ApiCircle.getFeedAnnouncements(
              page: 0,
              onSuccess: (List<Announcement> newFeedAnnouncements) async {

                if(mounted) Announcement.init(context, newFeedAnnouncements);
                else Announcement.silentInit(newFeedAnnouncements);
                loadedPage = 0;
                moreToLoad = newFeedAnnouncements.length == Announcement.feedPageSize;

                if(mounted) setState((){});
              },
              onError: () => showAppToast(context, text: 'Coś poszło nie tak...')
          );

          if(mounted) refreshController.refreshCompleted();

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

          await ApiCircle.getFeedAnnouncements(
              page: loadedPage + 1,
              onSuccess: (nextAnnouncements){

                int i;
                for(i=0; i<nextAnnouncements.length; i++)
                  if(!Announcement.allMap!.containsKey(nextAnnouncements[i].key)) break;

                Announcement.addListToAll(context, nextAnnouncements.sublist(i));
                loadedPage += 1;

                Provider.of<AnnouncementListProvider>(context, listen: false).notify();

                if(nextAnnouncements.length != Announcement.feedPageSize)
                  moreToLoad = false;

                setState((){});

              },
              onError: () => showAppToast(context, text: 'Coś nie pykło...')
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
            ),

            SliverList(delegate: SliverChildListDelegate([

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                child: TitleShortcutRowWidget(
                    title: 'Współzawodnictwa',
                    textAlign: TextAlign.start,
                    onOpen: onCompHeaderOpen,
                ),
              ),

              const IndivCompRowPreviewWidget(),

              const SizedBox(height: Dimen.SIDE_MARG),
            ])),

            SliverList(delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                child: TitleShortcutRowWidget(
                  title: 'Kręgi i ogłoszenia',
                  textAlign: TextAlign.start,
                  onOpen: onAllAnnouncementsHeaderOpen,
                ),
              ),
            ])),

            getAnnouncementsSliver(
                context,
                Announcement.all??[],
                showCircleButton: true,
                onCircleButtonTap: (circle) => onCircleTap?.call(circle),
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                onAnnouncementUpdated: () => setState((){}),
            )

          ],
        )

    );

  }

}

class IndivCompRowPreviewWidget extends StatelessWidget{

  const IndivCompRowPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: IndivCompPreviewWidget.height,
      child: Consumer2<IndivCompProvider, IndivCompListProvider>(
        builder: (context, _, __, child) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: IndivComp.all?.length??0,
          itemBuilder: (context, index) => IndivCompPreviewWidget(IndivComp.all![index]),
          separatorBuilder: (context, index) => const SizedBox(width: Dimen.SIDE_MARG),
        ),
      )
  );

}