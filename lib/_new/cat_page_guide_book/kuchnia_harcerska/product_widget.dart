
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/product.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';

import 'common.dart';

class ProductWidget extends StatelessWidget{

  final Product product;
  const ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Text(
          product.name,
          style: AppTextStyle(
            fontWeight: weight.halfBold,
            fontSize: Dimen.TEXT_SIZE_APPBAR,
            color: accent_(context)
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: Dimen.ICON_SIZE),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: NutritionWidget(product.kcal100, product.proteins100, product.carbohyd100, product.fat100, product.vitamins, product.other)),
            Padding(
              child: SizedBox(width: 56, height: 56, child: SvgPicture.asset(product.fileName)),
              padding: EdgeInsets.only(left: Dimen.LIST_SEP_MARG, right: Dimen.LIST_SIDE_MARG),
            ),
          ]
        ),
      ],
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