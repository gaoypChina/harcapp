import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp/_new/cat_page_harcthought/harc_forms/harc_form.dart';
import 'package:harcapp/_new/cat_page_harcthought/harc_forms/harc_form_thumbnail_widget.dart';
import 'package:harcapp_core/dimen.dart';

import '../../../_common_classes/app_navigator.dart';
import '../_main.dart';
import 'apel_ewan_thumbnail_widget.dart';

class ApelEwansPage extends StatefulWidget{

  final List<ApelEwan> allApelEwans;

  const ApelEwansPage(this.allApelEwans, {Key? key}): super(key: key);
  
  @override
  State<StatefulWidget> createState() => ApelEwansPageState();

}

class ApelEwansPageState extends State<ApelEwansPage>{

  List<ApelEwan> get allApelEwans => widget.allApelEwans;
  
  late List<ApelEwan> searchedApelEwans;

  @override
  void initState() {
    searchedApelEwans = [];
    searchedApelEwans.addAll(allApelEwans);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Apele ewangeliczne'),
          centerTitle: true,
          floating: true,
          elevation: 0,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: Dimen.ICON_MARG,
            children: allApelEwans.map((apelEwans) => ApelEwanThumbnailWidget(apelEwans)).toList(),
            childAspectRatio: 1,
          ),
        ),

      ],
    ),
  );

}