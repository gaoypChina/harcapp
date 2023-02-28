import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';
import 'data.dart';


class SearchPage extends StatefulWidget {

  final void Function(int) onItemTap;

  const SearchPage({required this.onItemTap, super.key});

  @override
  State<SearchPage> createState() => SearchPageState();

}

class SearchPageState extends State<SearchPage> {

  late List<ItemData> data;

  @override
  void initState() {
    data = items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            title: Text('Szukaj w lesie'),
            floating: true,
            centerTitle: true,
          ),

          FloatingContainer.child(
              child: SearchField(
                hint: 'Szukaj:',
                background: background_(context),
                elevation: AppCard.defElevation,
                onChanged: (text){

                  text = remPolChars(text);
                  List<ItemData> _data = [];

                  for(ItemData item in items){
                    if(remPolChars(item.name).contains(text))
                      _data.add(item);
                    else
                      for(String tag in remPolCharsList(item.tags))
                        if(tag.contains(text)) {
                          _data.add(item);
                          break;
                        }
                  }

                  setState(() => this.data = _data);
                },
              ),
              height: SearchField.height
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => Item(
                data[index],
                onTap: () => widget.onItemTap(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: data.length,
            )),
          ),

        ],
      ),
    );
  }
}

class Item extends StatelessWidget{

  final ItemData data;
  final void Function()? onTap;

  const Item(this.data, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.bigRadius,
      onTap: onTap,
      child: Container(
        height: CARD_HEIGHT,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/leaf_bg/${data.background.path}.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
                data.name,
                style: AppTextStyle(
                    fontWeight: weight.halfBold,
                    fontSize: 24.0,
                    shadow: true,
                    color: Colors.white
                ),
                textAlign: TextAlign.center
            ),
            const SizedBox(height: 10),

            Expanded(child: Container()),

            TagWidget(data),

            const SizedBox(height: Dimen.SIDE_MARG),

          ],
        ),
      )
  );

}