import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'data.dart';


class AllSignsPage extends StatefulWidget {

  final void Function(int) onItemTap;

  const AllSignsPage({required this.onItemTap});

  @override
  State<AllSignsPage> createState() => AllSignsPageState();

}

class AllSignsPageState extends State<AllSignsPage> {

  late List<ItemData> _items;
  TextEditingController? textController;

  @override
  void initState() {

    textController = TextEditingController();
    _items = items;

    super.initState();
  }

  @override
  void dispose() {
    textController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: background_(context),
            elevation: 0,
            title: Text('Wszystkie znaki patrolowe', style: AppTextStyle(color: appBarTextEnab_(context))),
            centerTitle: true,
            floating: true,
          ),

          FloatingContainer(
            height: SearchField.height,
            rebuild: false,
            builder: (context, _, __) => SearchField(
              hint: 'Szukaj znaków patrolowych:',
              controller: textController,
              onChanged: (text){

                if(text.isEmpty) {
                  setState(() => this._items = items);
                  return;
                }

                List<ItemData> _items = [];
                for(ItemData item in items)
                  if(item.matches(text)) _items.add(item);

                setState(() => this._items = _items);
              },
            ),
          ),

          SliverList(delegate: SliverChildListDelegate([
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: _items.map(
                      (item) =>
                      Padding(
                        padding: EdgeInsets.all(Dimen.DEF_MARG),
                        child: SimpleButton(
                          radius: 100,
                          onTap: () => widget.onItemTap(items.indexOf(item)),
                          child: SizedBox(
                            child: Hero(
                              tag: item.fileName,
                              child: SvgPicture.asset(
                                'assets/images/znaki_patro/${item.fileName}.svg',
                                fit: BoxFit.contain,
                                color: textEnab_(context),
                              ),
                            ),
                            height: 64,
                            width: 64,
                          ),
                        ),
                      )
              ).toList(),
            )
          ]))


        ],
      ),
    );
  }
}