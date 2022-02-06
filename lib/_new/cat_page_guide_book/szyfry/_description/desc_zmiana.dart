
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'common.dart';

class DescZamiana extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[

        DescOnlyWidget(),

        SizedBox(height: Dimen.SIDE_MARG),

        AppText(
          'W szyfrze zamiana każdej literze przyporządkowana druga litera tworząca z nią parę.'
              '\n\nAby zaszyfrować daną literę należy wymienić ją z literą z którą znajduje się w parze.'
              '\n\nZaszyfrowane słowo <b>H A R C E R Z</b> to:'
              '\n<b>U M E O R E K</b>\n',
          size: Dimen.TEXT_SIZE_BIG,
        ),

        Row(
          children: <Widget>[
            Text(
              'A'
                  '\nĄ'
                  '\nB'
                  '\nC'
                  '\nĆ'
                  '\nD'
                  '\nE'
                  '\nĘ'
                  '\nF'
                  '\nG'
                  '\nH'
                  '\nI'
                  '\nJ'
                  '\nK'
                  '\nL'
                  '\nŁ',
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
            ),
            SizedBox(width: Dimen.DEF_MARG),
            Text(
              '-'
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
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
            ),
            SizedBox(width: Dimen.DEF_MARG),
            Text(
              'M'
                  '\nN'
                  '\nŃ'
                  '\nO'
                  '\nÓ'
                  '\nP'
                  '\nR'
                  '\nS'
                  '\nŚ'
                  '\nT'
                  '\nU'
                  '\nW'
                  '\nY'
                  '\nZ'
                  '\nŹ'
                  '\nŻ',
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
            ),
          ],
        )

      ],

    );
  }

}