import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/pola_button.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/kuchnia_harcerska/product.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';

import 'product_widget.dart';

class ProductsPage extends StatefulWidget{

  static const double BOTTOM_CARD_HEIGHT = 58;

  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage>{

  late List<Product> items;

  @override
  void initState() {
    items = getSearchedItems('');
    super.initState();
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

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(
              delegate: SliverChildSeparatedBuilderDelegate(
                (BuildContext context, int index) => ProductWidget(items[index]),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                count: items.length,
              ),
            ),
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