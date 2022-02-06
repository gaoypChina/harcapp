import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/pola_button.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/product.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';

import '_main.dart';
import 'product_widget.dart';

class ProductsPage extends StatefulWidget{

  static const double BOTTOM_CARD_HEIGHT = 58;

  @override
  State<StatefulWidget> createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage>{

  List<Product> items;

  @override
  void initState() {
    items = getSearchedItems('');
    super.initState();
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
            floating: true,
            pinned: true,
            title: Text('Lista produktów', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR)),
            centerTitle: true,
            actions: [
              IconButton(
                icon: PolaIcon(color: appBarTextEnab_(context),),
                onPressed: () => polaTap(context),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: SearchField(
                  hint: 'Nazwa produktu:',
                  background: background_(context),
                  onChanged: (text) => setState(() => items = getSearchedItems(text))
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([SizedBox(height: Dimen.ICON_MARG)]),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index.isEven)
                    return ProductWidget(items[index]);

                  return SizedBox(height: 4*Dimen.ICON_MARG);
                },
                semanticIndexCallback: (Widget widget, int localIndex) {
                  if (localIndex.isEven)
                    return localIndex ~/ 2;

                  return null;
                },
                childCount: items.length
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([SizedBox(height: Dimen.ICON_MARG)]),
          ),

        ],
      ),
    );

  }
  
  List<Product> getSearchedItems(String text){
    
    if(text.isEmpty)
      return Product.all;
    
    List<Product> result = [];
    
    for(Product product in Product.all)
      if(remPolChars(remSpecChars(product.name)).contains(remPolChars(remSpecChars(text))))
          result.add(product);
    
    return result;
  }
  
}