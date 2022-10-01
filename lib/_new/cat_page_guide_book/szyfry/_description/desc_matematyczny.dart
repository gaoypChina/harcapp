
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'common.dart';

class DescMatematyczny extends StatelessWidget{

  const DescMatematyczny();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[

        DescOnlyWidget(),

        SizedBox(height: Dimen.SIDE_MARG),

        AppText(
          'W szyfrze matematycznym każdej literze przypisana jest kolejna liczba naturalna począwszy od 1.'
              '\n\nSzyfrowanie polega na zamianie w szyfrowanym wyrazie liter cyframi, oraz na dodaniu między nimi różnych znaków działań arytmetycznych nie mających znaczenia.'
              '\n\nZaszyfrowane słowo <b>H A R C E R Z</b> to:'
              '\n\n<b>( 8 + 1 ) / 17 * 3 = ( - 5 ) / 17 = 23</b>',
          size: Dimen.TEXT_SIZE_BIG,
        ),

        Row(
          children: <Widget>[
            Text(
              '\nA'
                  '\nB'
                  '\nC'
                  '\nD'
                  '\nE'
                  '\nF'
                  '\nG'
                  '\nH'
                  '\nI'
                  '\nJ'
                  '\nK'
                  '\nL'
                  '\nM'
                  '\nN'
                  '\nO'
                  '\nP'
                  '\nR'
                  '\nS'
                  '\nT'
                  '\nU'
                  '\nW'
                  '\nY'
                  '\nZ',
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
            ),
            SizedBox(width: Dimen.defMarg),
            Text(
              '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-'
                  '\n-',
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
            ),
            SizedBox(width: Dimen.defMarg),
            Text(
              '\n1'
                  '\n2'
                  '\n3'
                  '\n4'
                  '\n5'
                  '\n6'
                  '\n7'
                  '\n8'
                  '\n9'
                  '\n10'
                  '\n11'
                  '\n12'
                  '\n13'
                  '\n14'
                  '\n15'
                  '\n16'
                  '\n17'
                  '\n18'
                  '\n19'
                  '\n20'
                  '\n21'
                  '\n22'
                  '\n23',
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
            ),
          ],
        )

      ],

    );
  }

}