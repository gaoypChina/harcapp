
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'common.dart';

class DescKarolinka extends StatelessWidget{
  const DescKarolinka({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[

        const DescOnlyWidget(),

        const SizedBox(height: Dimen.SIDE_MARG),

        const AppText(
          'W szyfrze karolinka każdej literze przyporządkowywana jest para liczb określająca współrzędna litery w poniższej tabelce.'
              '\n\nTabela tworzona jest poprzez wpisanie do pierwszej kolumny <b>kolejnych liter słowa kluczowego</b> (np. karolinka), następnie uzupełnienie wierszów <b>kolejnymi literami</b> alfabetu.'
              '\n\nZaszyfrowane słowo <b>H A R C E R Z</b> to:'
              '\n<b>8x2 1x2 1x3 3x2 5x2 7x8 9x4</b>.\n',
          size: Dimen.TEXT_SIZE_BIG,
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text(' ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('1', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('2', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('3', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('4', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('5', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('6', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('7', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('8', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('9', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('1', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('K', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('L', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('M', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('N', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('T', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('2', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('A', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('B', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('C', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('D', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('E', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('F', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('G', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('H', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('I', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('3', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('T', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('U', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('W', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('Y', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('Z', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('A', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('B', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),

          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('4', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('T', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('U', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('W', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('Y', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('Z', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('5', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('L', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('M', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('N', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('T', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('U', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('6', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('I', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('J', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('K', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('L', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('M', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('N', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('7', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('N', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('T', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('U', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('W', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('Y', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('8', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('K', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('L', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('M', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('N', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('R', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('T', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        ),
        const SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('9', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: AppColors.textHintEnab))),
            Expanded(child: Text('A', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('B', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('C', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('D', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('E', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('F', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('G', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('H', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
            Expanded(child: Text('I', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, ))),
          ],
        )

      ],
    );
  }

}