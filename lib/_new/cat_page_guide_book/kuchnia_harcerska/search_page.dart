import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/ingredient.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'meal.dart';

class SearchPage extends StatefulWidget{

  final void Function(Meal) onSelected;

  const SearchPage(this.onSelected);

  @override
  State<StatefulWidget> createState() => SearchPageState();

}

class SearchPageState extends State<SearchPage>{

  late List<Meal> currMeals;

  @override
  void initState() {
    currMeals = Meal.all;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Szukaj przepisów'),
            centerTitle: true,
            floating: true,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, SearchField.height),
              child: SearchField(
                  hint: 'Nazwa posiłku:',
                  background: Colors.transparent,
                  onChanged: (text) => setState((){
                    currMeals = getSearchedItems(text);
                  })
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => SearchItem(
                  currMeals[index],
                    onTap: () => widget.onSelected(currMeals[index])
              ),
              count: currMeals.length,
              separatorBuilder: (context, index) => SizedBox(height: Dimen.ICON_MARG)
            ),
          )

        ],
      ),
    );

  }

  List<Meal> getSearchedItems(String text){
    if(text.isEmpty)
      return Meal.all;

    List<Meal> result = [];

    text = remPolChars(remSpecChars(text));

    for(Meal meal in Meal.all)
      if(remPolChars(remSpecChars(meal.name)).contains(text))
        result.add(meal);
      else
        for(String tag in meal.tags)
          if(remPolChars(remSpecChars(tag)).contains(text))
            result.add(meal);

    return result;
  }

}

class SearchItem extends StatelessWidget{

  final Meal meal;
  final Function onTap;

  const SearchItem(this.meal, {required this.onTap});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.BIG_RADIUS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          TitleShortcutRowWidget(title: meal.name, textAlign: TextAlign.start),

          if(meal.tags.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: Dimen.DEF_MARG, right: Dimen.DEF_MARG),
              child: Row(
                children: meal.tags.map((tag) => Padding(
                  padding: EdgeInsets.all(Dimen.DEF_MARG),
                  child: Text(tag, style: AppTextStyle(fontWeight: weight.halfBold)),
                )).toList(),
              ),
            ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: meal.ingredients.map((ingr) => Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: SvgPicture.asset(ingr.product.fileName, width: 24, height: 24,),
              )).toList(),
            ),
          )

        ],
      ),
      onTap: onTap as void Function()?
  );
}