import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

import 'apel_ewan_thumbnail_widget.dart';

class ApelEwansPage extends StatefulWidget{

  final List<ApelEwan> allApelEwans;

  const ApelEwansPage(this.allApelEwans, {super.key});
  
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

        FloatingContainer(
          builder: (context, __, _) => SearchField(
            background: background_(context),
            hint: 'Szukaj...',
            onChanged: (text){

              if(text.isEmpty)
                setState(() => this.searchedApelEwans = allApelEwans);

              List<ApelEwan> searchedApelEwans = [];

              text = remPolChars(text);
              for(ApelEwan apelEwan in allApelEwans){
                if(remPolChars(apelEwan.title).contains(text))
                  searchedApelEwans.add(apelEwan);
              }

              setState(() => this.searchedApelEwans = searchedApelEwans);

            },
          ),
          height: SearchField.height,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          sliver: SliverGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: Dimen.ICON_MARG,
            mainAxisSpacing: Dimen.ICON_MARG,
            childAspectRatio: 1,
            children: searchedApelEwans.map((apelEwans) => ApelEwanThumbnailWidget(apelEwans)).toList(),
          ),
        ),

      ],
    ),
  );

}