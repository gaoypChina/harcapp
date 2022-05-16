import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';

import '../indiv_comp_thumbnail_widget.dart';

class CommonHeader extends StatelessWidget{

  final String? iconKey;
  final String? colorsKey;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final dynamic heroTag;

  const CommonHeader({
    this.iconKey,
    this.colorsKey,
    this.controller,
    this.focusNode,
    this.heroTag,
    super.key
  });

  @override
  Widget build(BuildContext context) {
     return Row(
       children: [

         const SizedBox(width: Dimen.SIDE_MARG),

         IndivCompThumbnailWidget(
           iconKey: iconKey,
           colorsKey: colorsKey,
           heroTag: heroTag,
         ),

         const SizedBox(width: Dimen.SIDE_MARG),

         Expanded(child: AppTextFieldHint(
           controller: controller,
           focusNode: focusNode,
           hint: 'Nazwa współzawodnictwa...',
           hintTop: 'Nazwa współzawodnictwa',
           style: AppTextStyle(),
           hintStyle: AppTextStyle(color: hintEnab_(context)),
           textCapitalization: TextCapitalization.sentences,
           inputFormatters: [
             LengthLimitingTextInputFormatter(IndivComp.maxLenTitle),
           ],
         )),

         const SizedBox(width: Dimen.SIDE_MARG),

       ],
     );
  }

}