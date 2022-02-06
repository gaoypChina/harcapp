import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';

import '../indiv_comp_thumbnail_widget.dart';

class CommonHeader extends StatelessWidget{

  final String iconKey;
  final String colorsKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final heroTag;

  CommonHeader({
    this.iconKey,
    this.colorsKey,
    this.controller,
    this.focusNode,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
     return Row(
       children: [

         SizedBox(width: Dimen.SIDE_MARG),

         IndivCompThumbnailWidget(
           IndivComp(
             key: '',
             name: '',
             iconKey: iconKey,
             colorsKey: colorsKey,
             startTime: DateTime.now(),
             endTime: DateTime.now(),
             profile: IndivCompProfile(
               active: false,
               role: CompRole.OBSERVER,
             ),
             tasks: [],
             particips: [],
             overviewMode: null,
             awards: [],
             shareCode: null,
             shareCodeSearchable: null
           ),
           heroTag: heroTag,
         ),

         SizedBox(width: Dimen.SIDE_MARG),

         Expanded(child: AppTextFieldHint(
           controller: controller,
           focusNode: focusNode,
           hint: 'Nazwa współzawodnictwa...',
           hintTop: 'Nazwa współzawodnictwa',
           style: AppTextStyle(),
           hintStyle: AppTextStyle(color: hintEnab_(context)),
           textCapitalization: TextCapitalization.sentences,
           inputFormatters: [
             LengthLimitingTextInputFormatter(IndivComp.MAX_LEN_TITLE),
           ],
         )),

         SizedBox(width: Dimen.SIDE_MARG),

       ],
     );
  }

}