import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/dimen.dart';

import 'common.dart';

class DescTabliczkaMnozenia extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[

        DescOnlyWidget(),

        SizedBox(height: Dimen.SIDE_MARG),

        AppText(
          'Szyfrowanie wiadomości polega na przyporządkowaniu każdej literze pary liczb, których współrzędne wskazują na literę w poniższej tabeli.'
              '\n\nZaszyfrowane słowo: <b>H A R C E R Z</b> to:'
              '\n<b>2x3 1x1 4x2 1x3 1x5 4x2 5x3</b>.',
          size: Dimen.TEXT_SIZE_BIG,
        ),

        SizedBox(height: 4*Dimen.defMarg),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Text(' ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('1', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('2', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('3', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('4', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('5', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
              ],
            ),
            SizedBox(height: Dimen.defMarg),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Text('1', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('A', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('B', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('C', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('D', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('E', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
              ],
            ),
            SizedBox(height: Dimen.defMarg),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Text('2', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('F', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('G', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('H', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('I', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('J', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
              ],
            ),
            SizedBox(height: Dimen.defMarg),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Text('3', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('K', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('L', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('M', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('N', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
              ],
            ),
            SizedBox(height: Dimen.defMarg),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Text('4', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('T', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('U', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
              ],
            ),
            SizedBox(height: Dimen.defMarg),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: Text('5', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('W', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('Y', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('Z', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('-', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
                Expanded(child: Text('-', style: AppTextStyle(color: AppColors.text_hint_enab, fontSize: Dimen.TEXT_SIZE_BIG))),
              ],
            )
          ],
        )
      ],
    );
  }

}