import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'data.dart';


class AllSignsPage extends StatefulWidget {

  final void Function(int) onItemTap;

  const AllSignsPage({required this.onItemTap, super.key});

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
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: background_(context),
            elevation: 0,
            title: Text('Wszystkie znaki patrolowe', style: AppTextStyle(color: appBarTextEnab_(context))),
            centerTitle: true,
            floating: true,
          ),

          FloatingContainer.child(
            height: SearchField.height,
            child: SearchField(
              hint: 'Szukaj znaków patrolowych:',
              controller: textController,
              elevation: AppCard.defElevation,
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

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  onTap: () => widget.onItemTap.call(index),
                  trailing: SizedBox(
                    height: 64,
                    width: 64,
                    child: Hero(
                      tag: _items[index].fileName,
                      child: SvgPicture.asset(
                        'assets/images/znaki_patro/${_items[index].fileName}.svg',
                        fit: BoxFit.contain,
                        color: textEnab_(context),
                      ),
                    ),
                  ),
                  title: Text(
                    _items[index].description,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR
                    ),
                  ),
                ),
                childCount: _items.length
            )),
          ),

          // SliverList(delegate: SliverChildListDelegate([
          //   Wrap(
          //     alignment: WrapAlignment.spaceAround,
          //     children: _items.map(
          //             (item) =>
          //             Padding(
          //               padding: const EdgeInsets.all(Dimen.defMarg),
          //               child: SimpleButton(
          //                 radius: 100,
          //                 onTap: () => widget.onItemTap(items.indexOf(item)),
          //                 child: SizedBox(
          //                   height: 64,
          //                   width: 64,
          //                   child: Hero(
          //                     tag: item.fileName,
          //                     child: SvgPicture.asset(
          //                       'assets/images/znaki_patro/${item.fileName}.svg',
          //                       fit: BoxFit.contain,
          //                       color: textEnab_(context),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             )
          //     ).toList(),
          //   )
          // ]))


        ],
      ),
    );
  }
}