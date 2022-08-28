
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'common.dart';

class DescKomorkowy extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[

        DescOnlyWidget(),

        SizedBox(height: Dimen.SIDE_MARG),

        AppText(
          'Kluczem szyfru jest klawiatura starego <b>telefonu komórkowego</b>: każdemu trzy- lub czteroelementowemu zbiorowi liter przyporządkowana jest kolejna cyfra.'
              '\n\nAby zaszyfrować daną literę należy napisać przypisaną jej cyfrę <b>tylekroć</b>, ile wynosi <b>numer porządkowy</b> jej miejsca w jej zbiorze.'
              '\n\nZaszyfrowane słowo <b>H A R C E R Z</b> to:'
              '\n<b>44 2 777 222 33 777 9999</b>'
              '\n\n',
          size: Dimen.TEXT_SIZE_BIG,
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
            Expanded(child: Text('2 ABC', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
            Expanded(child: Text('3 DEF', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
          ],
        ),
        SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('4 GHI', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
            Expanded(child: Text('5 JKL', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
            Expanded(child: Text('6 MNO', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
          ],
        ),
        SizedBox(height: Dimen.defMarg),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Text('7 PQRS', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
            Expanded(child: Text('8 TUV', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
            Expanded(child: Text('9 WXYZ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))),
          ],
        ),

      ],
    );
  }

}