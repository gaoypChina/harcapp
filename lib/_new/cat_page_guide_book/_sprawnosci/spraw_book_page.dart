import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'spraw_group_page.dart';

class SprawBookPage extends StatelessWidget {
  
  final SprawBook sprawBook;

  const SprawBookPage(this.sprawBook, {super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(SprawGroup group in sprawBook.groups!)
      children.add(GroupItemWidet(group));

    children.add(
      SizedBox(
        height: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: Text(sprawBook.source, style: AppTextStyle(color: hintEnab_(context)), textAlign: TextAlign.center),
          ),
        ),
      )
    );

    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      physics: const BouncingScrollPhysics(),
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
      radius: AppCard.bigRadius,
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
                          group.title!,
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_BIG,
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