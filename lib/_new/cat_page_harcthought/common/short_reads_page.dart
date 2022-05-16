import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

import '../../../_common_classes/app_navigator.dart';
import 'short_read.dart';
import '../gawedy/data.dart';
import '../gawedy/gaweda.dart';

class ShortReadsPage<T extends ShortRead> extends StatefulWidget{

  final String moduleId;
  final String title;
  final List<T> allShortReads;

  const ShortReadsPage(this.moduleId, this.title, this.allShortReads, {super.key});
  
  @override
  State<StatefulWidget> createState() => ShortReadsPageState<T>();

}

class ShortReadsPageState<T extends ShortRead> extends State<ShortReadsPage>{

  List<T> get allShortReads => widget.allShortReads as List<T>;
  
  late List<T> searchedShortReads;

  @override
  void initState() {
    searchedShortReads = [];
    searchedShortReads.addAll(allShortReads);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text(widget.title),
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
                setState(() => searchedShortReads = allShortReads);

              List<Gaweda> searchedGawedy = [];

              text = remPolChars(text);
              for(Gaweda gaweda in allGawedy){
                if(remPolChars(gaweda.title).contains(text))
                  searchedGawedy.add(gaweda);
              }

              setState(() => searchedShortReads = allShortReads);

            },
          ),
          height: SearchField.height,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: Dimen.ICON_MARG,
            children: searchedShortReads.map((shortRead) => ShortReadThumbnailWidget(
              shortRead,
              onTap: () => pushPage(context, builder: (context) => ShortReadWidget(widget.moduleId, shortRead)),
            )
            ).toList(),
            childAspectRatio: .8,
          ),
        ),

      ],
    ),
  );

}