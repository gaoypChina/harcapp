import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../_common_widgets/app_toast.dart';
import 'circle.dart';

class CirclePage extends StatefulWidget{

  final Circle circle;
  const CirclePage(this.circle, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CirclePageState();

}

class CirclePageState extends State<CirclePage>{

  Circle get circle => widget.circle;

  RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SmartRefresher(
      enablePullDown: true,
      physics: const BouncingScrollPhysics(),
      header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
      controller: refreshController,
      onRefresh: () async {

        if(!await isNetworkAvailable()){
          showAppToast(context, text: 'Brak dostępu do Internetu');
          refreshController.refreshCompleted();
          return;
        }

      },
      child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(circle.name),
              centerTitle: true,
              floating: true,
            ),
          ]
      ));

}