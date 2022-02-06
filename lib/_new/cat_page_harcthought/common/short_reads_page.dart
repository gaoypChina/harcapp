import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

import 'short_read.dart';
import '../gawedy/data.dart';
import '../gawedy/gaweda.dart';

class ShortReadsPage extends StatefulWidget{

  final String title;
  final List<ShortRead> allShortReads;

  const ShortReadsPage(this.title, this.allShortReads);
  
  @override
  State<StatefulWidget> createState() => ShortReadsPageState();

}

class ShortReadsPageState extends State<ShortReadsPage>{

  List<ShortRead> get allShortReads => widget.allShortReads;
  
  List<ShortRead> searchedGawedy;

  @override
  void initState() {
    searchedGawedy = [];
    searchedGawedy.addAll(allShortReads);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
                  setState(() => this.searchedGawedy = allGawedy);

                List<Gaweda> searchedGawedy = [];

                text = remPolChars(text);
                for(Gaweda gaweda in allGawedy){
                  if(remPolChars(gaweda.title).contains(text))
                    searchedGawedy.add(gaweda);
                }

                setState(() => this.searchedGawedy = searchedGawedy);

              },
            ),
            height: SearchField.height,
          ),

          SliverPadding(
            padding: EdgeInsets.all(Dimen.ICON_MARG),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: Dimen.ICON_MARG,
              children: searchedGawedy.map((item) => ShortReadThumbnailWidget(item)).toList(),
              childAspectRatio: .8,
            ),
          ),

        ],
      ),
    );
  }

}