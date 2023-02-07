
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
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

class SearchPage extends StatefulWidget{

  final SprawBook sprawBook;
  final List<SprawGroup> sprawGroupList;
  final Function(Spraw spraw)? onPicked;

  const SearchPage(this.sprawBook, this.sprawGroupList, {this.onPicked, super.key});

  @override
  State createState() => SearchPageState();

}

class SearchPageState extends State<SearchPage>{

  late List<Spraw> allSpraws;
  late List<Spraw> currSpraws;

  late Map<Spraw, String?> groupNameMap;

  @override
  void initState() {

    allSpraws = [];
    groupNameMap = {};

    for(SprawGroup group in widget.sprawGroupList) {

      allSpraws.addAll(group.allSpraws);

      for(SprawFamily family in group.families!)
        for(Spraw spraw in family.spraws!)
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
      List<String> requirements = remPolCharsList(spraw.tasks!.map((task) => task.text).toList());
      for(String req in requirements)
        if(req.contains(text)) {
          spraws.add(spraw);
          break;
        }
    }
    setState(() => currSpraws = spraws);
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      key: const PageStorageKey(key_sprawnosci_search_list_view),
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
            title: Text(widget.sprawBook.title),
            centerTitle: true,
            elevation: 0,
            floating: true
        ),

        FloatingContainer.child(
          height: SearchField.height,
          child: SearchField(
            onChanged: (text) => updateChildren(text),
            hint: 'Nazwa, wymaganie sprawności:',
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) => SprawTileWidget(
                    spraw: currSpraws[index],
                    onPicked: widget.onPicked
                ),
                childCount: currSpraws.length
            ),

          ),
        )

      ],
    ),
  );

}



