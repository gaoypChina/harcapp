
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp/_common_classes/key_names.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/spraw_tile_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

import 'widgets/common.dart';

class SearchPage extends StatefulWidget{

  final SprawBook sprawBook;
  final List<SprawGroup> sprawGroupList;
  final Function(Spraw spraw) onPicked;

  const SearchPage(this.sprawBook, this.sprawGroupList, {this.onPicked});

  @override
  State createState() => SearchPageState();

}

class SearchPageState extends State<SearchPage>{

  List<Spraw> allSpraws;
  List<Spraw> currSpraws;

  Map<Spraw, String> groupNameMap;

  @override
  void initState() {

    allSpraws = [];
    groupNameMap = {};

    for(SprawGroup group in widget.sprawGroupList) {

      allSpraws.addAll(group.allSpraws);

      for(SprawFamily family in group.families)
        for(Spraw spraw in family.spraws)
          groupNameMap[spraw] = group.title;

    }

    currSpraws = allSpraws;
    super.initState();
  }

  Future<void> updateChildren(String text) async {

    text = remPolChars(text);
    List<Spraw> spraws = [];

    for(Spraw spraw in allSpraws) {
      if (remPolChars(spraw.title).contains(text)) {
        spraws.add(spraw);
        continue;
      }

      // TODO: Make sure that you can put a .map without .toList() into a function expecting a list.
      List<String> requirements = remPolCharsList(spraw.tasks.map((task) => task.text));
      for(String req in requirements)
        if(req.contains(text))
          spraws.add(spraw);
    }
    setState(() => currSpraws = spraws);
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return BottomNavScaffold(
      body: Stack(
        children: [

          Positioned(
            bottom: -0.1*screenWidth,
            right: -0.15*screenWidth,
            child: Icon(
              SprawBookData.mapIdIconMap[widget.sprawBook.id],
              color: backgroundIcon_(context),
              size: screenWidth,
            ),
          ),

          CustomScrollView(
            key: PageStorageKey(key_sprawnosci_search_list_view),
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Container(
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(widget.sprawBook.title),
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 0,
                floating: true,
                actions: [
                  SizedBox(width: Dimen.ICON_FOOTPRINT,)
                ],
              ),

              FloatingContainer.child(
                height: SearchField.height,
                child: SearchField(
                  onChanged: (text) => updateChildren(text),
                  hint: 'Nazwa, wymaganie sprawności:',
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => SprawTileWidget(
                        groupName: groupNameMap[currSpraws[index]],
                        spraw: currSpraws[index],
                        onPicked: widget.onPicked
                    ),
                    childCount: currSpraws.length
                ),

              )

            ],
          )

        ],
      ),
    );
  }

}



