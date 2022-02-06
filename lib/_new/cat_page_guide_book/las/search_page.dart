import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';
import 'data.dart';


class SearchPage extends StatefulWidget {

  final void Function(int) onItemTap;

  const SearchPage({@required this.onItemTap});

  @override
  State<SearchPage> createState() => SearchPageState();

}

class SearchPageState extends State<SearchPage> {

  List<ItemData> data;

  @override
  void initState() {
    data = items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: Stack(
        children: <Widget>[

          ListView.separated(
            padding: EdgeInsets.only(
                top: SearchField.height + Dimen.SIDE_MARG,
                bottom: Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG
            ),
            physics: BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) => Item(
              data[index],
              onTap: () => widget.onItemTap(index),
            ),
            separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: Dimen.SIDE_MARG),
          ),

          SearchField(
            hint: 'Szukaj...',
            background: background_(context),
            leading: IconButton(
              icon: Icon(MdiIcons.arrowLeft),
              onPressed: () => Navigator.pop(context),
            ),
            onChanged: (text){

              text = remPolChars(text);
              List<ItemData> _data = [];

              for(ItemData item in items){
                if(remPolChars(item.name).contains(text))
                  _data.add(item);
                else{
                  for(String tag in remPolCharsList(item.tags))
                    if(tag.contains(text)) {
                      _data.add(item);
                      break;
                    }
                }
              }

              setState(() => this.data = _data);
            },
          ),

        ],
      ),
    );
  }
}

class Item extends StatelessWidget{

  final ItemData data;
  final Function onTap;

  const Item(this.data, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
        radius: AppCard.BIG_RADIUS,
        padding: EdgeInsets.zero,
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
              SizedBox(height: 20),
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
              SizedBox(height: 10),

              Expanded(child: Container()),

              TagWidget(data),

            ],
          ),
        )
    );
  }

}