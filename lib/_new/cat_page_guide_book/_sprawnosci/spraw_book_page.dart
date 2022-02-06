import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/spraw_tile_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'models/spraw_task.dart';
import 'spraw_group_page.dart';

class SprawBookPage extends StatelessWidget {
  
  final SprawBook sprawBook;

  const SprawBookPage(this.sprawBook);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(SprawGroup group in sprawBook.groups)
      children.add(GroupItemWidet(group));

    children.add(
      SizedBox(
        height: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(Dimen.SIDE_MARG),
            child: Text(sprawBook.source, style: AppTextStyle(color: hintEnab_(context)), textAlign: TextAlign.center),
          ),
        ),
      )
    );

    return ListView(
      padding: EdgeInsets.only(top: 10.0),
      physics: BouncingScrollPhysics(),
      children: children,
    );

  }
}

class GroupItemWidet extends StatelessWidget{

  final SprawGroup group;

  const GroupItemWidet(this.group);

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      radius: AppCard.BIG_RADIUS,
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SprawGroupPage(group))),
      child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Kategoria:', style: AppTextStyle(color: hintEnab_(context))),

              Material(
                color: Colors.transparent,
                child: Hero(
                    tag: group,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                          group.title,
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_APPBAR,
                              fontWeight: weight.halfBold,
                              color: textEnab_(context)
                          )
                      ),
                    )
                ),
              ),
            ],
          ),
          trailing: Text('${group.allSpraws.length}', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context), fontWeight: weight.halfBold)),
      ),
    );
  }
}

class SearchCard extends StatefulWidget{

  final List<SprawGroup> sprawGroupList;

  const SearchCard(this.sprawGroupList);

  @override
  State<StatefulWidget> createState() => SearchCardState();
}

class SearchCardState extends State<SearchCard>{

  List<Spraw> allSpraws;
  List<Spraw> currSpraws;

  @override
  void initState() {

    allSpraws = [];
    for(SprawGroup groupItem in widget.sprawGroupList)
      allSpraws.addAll(groupItem.allSpraws);

    currSpraws = allSpraws;
    super.initState();
  }

  Future<void> updateChildren(String text) async {

    List<Spraw> items = [];

    for(Spraw spraw in allSpraws){
      if(remPolChars(spraw.title).contains(remPolChars(text))) {
        items.add(spraw);
        continue;
      }

      for(SprawTask task in spraw.tasks)
        if(remPolChars(task.text).contains(remPolChars(text)))
          items.add(spraw);
    }

    setState(() => currSpraws = items);
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[

          SearchField(
            onChanged: (text) => updateChildren(text),
            hint: 'Nazwa, wymaganie sprawności:',
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) => SprawTileWidget(spraw: currSpraws[index]),
              itemCount: currSpraws.length,
            ),
          )
        ],
      ),
    );
  }

}