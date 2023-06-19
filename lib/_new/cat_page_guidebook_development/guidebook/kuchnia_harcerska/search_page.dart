import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_tags/tag_layout.dart';

import 'meal.dart';

class SearchPage extends StatefulWidget{

  final void Function(Meal) onSelected;

  const SearchPage(this.onSelected, {super.key});

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
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: const Text('Szukaj przepisów'),
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

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(
            delegate: SliverChildSeparatedBuilderDelegate(
                    (context, index) => SearchItem(
                    currMeals[index],
                    onTap: () => widget.onSelected(currMeals[index])
                ),
                count: currMeals.length,
                separatorBuilder: (context, index) => const SizedBox(height: Dimen.ICON_MARG)
            ),
          ),
        )

      ],
    ),
  );

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
  final void Function() onTap;

  const SearchItem(this.meal, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      color: cardEnab_(context),
      radius: AppCard.bigRadius,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: TitleShortcutRowWidget(title: meal.name, textAlign: TextAlign.left),
          ),

          if(meal.tags.isNotEmpty)
            const SizedBox(height: Dimen.defMarg),

          if(meal.tags.isNotEmpty)
            SizedBox(
              height: Tag.height(),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Tag(meal.tags[index], elevation: 0, color: background_(context)),
                separatorBuilder: (context, index) => const SizedBox(width: Dimen.SIDE_MARG),
                itemCount: meal.tags.length
              ),
            ),

          const SizedBox(height: Dimen.SIDE_MARG),

          SizedBox(
            height: Dimen.ICON_SIZE,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SvgPicture.asset(
                meal.ingredients[index].product.fileName,
                width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE
              ),
              separatorBuilder: (context, index) => const SizedBox(width: Dimen.SIDE_MARG),
              itemCount: meal.ingredients.length
            ),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

        ],
      )
  );
}