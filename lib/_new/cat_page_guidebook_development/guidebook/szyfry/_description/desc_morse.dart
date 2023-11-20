import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import '../child_morse.dart';

class DescMorse extends StatelessWidget{

  static const String letters = 'A'
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
      '\nZ'
      '\n'
      '\n1'
      '\n2'
      '\n3'
      '\n4'
      '\n5'
      '\n6'
      '\n7'
      '\n8'
      '\n9'
      '\n0';

  static String morse =
      /*A*/'${lettersMap['A']!.replaceAll('/', '')}'
      /*B*/'\n${lettersMap['B']!.replaceAll('/', '')}'
      /*C*/'\n${lettersMap['C']!.replaceAll('/', '')}'
      /*D*/'\n${lettersMap['D']!.replaceAll('/', '')}'
      /*E*/'\n${lettersMap['E']!.replaceAll('/', '')}'
      /*F*/'\n${lettersMap['F']!.replaceAll('/', '')}'
      /*G*/'\n${lettersMap['G']!.replaceAll('/', '')}'
      /*H*/'\n${lettersMap['H']!.replaceAll('/', '')}'
      /*I*/'\n${lettersMap['I']!.replaceAll('/', '')}'
      /*J*/'\n${lettersMap['J']!.replaceAll('/', '')}'
      /*K*/'\n${lettersMap['K']!.replaceAll('/', '')}'
      /*L*/'\n${lettersMap['L']!.replaceAll('/', '')}'
      /*M*/'\n${lettersMap['M']!.replaceAll('/', '')}'
      /*N*/'\n${lettersMap['N']!.replaceAll('/', '')}'
      /*O*/'\n${lettersMap['O']!.replaceAll('/', '')}'
      /*P*/'\n${lettersMap['P']!.replaceAll('/', '')}'
      /*R*/'\n${lettersMap['R']!.replaceAll('/', '')}'
      /*S*/'\n${lettersMap['S']!.replaceAll('/', '')}'
      /*T*/'\n${lettersMap['T']!.replaceAll('/', '')}'
      /*U*/'\n${lettersMap['U']!.replaceAll('/', '')}'
      /*W*/'\n${lettersMap['W']!.replaceAll('/', '')}'
      /*Y*/'\n${lettersMap['Y']!.replaceAll('/', '')}'
      /*Z*/'\n${lettersMap['Z']!.replaceAll('/', '')}'
      '\n'
      /*1*/'\n${lettersMap['1']!.replaceAll('/', '')}'
      /*2*/'\n${lettersMap['2']!.replaceAll('/', '')}'
      /*3*/'\n${lettersMap['3']!.replaceAll('/', '')}'
      /*4*/'\n${lettersMap['4']!.replaceAll('/', '')}'
      /*5*/'\n${lettersMap['5']!.replaceAll('/', '')}'
      /*6*/'\n${lettersMap['6']!.replaceAll('/', '')}'
      /*7*/'\n${lettersMap['7']!.replaceAll('/', '')}'
      /*8*/'\n${lettersMap['8']!.replaceAll('/', '')}'
      /*9*/'\n${lettersMap['9']!.replaceAll('/', '')}'
      /*0*/'\n${lettersMap['0']!.replaceAll('/', '')}';

  String words =
      /*A*/'A: A - zot'
      /*B*/'\nBo - ta - ni - ka'
      /*C*/'\nCo - raz - moc - niej'
      /*D*/'\nDo - li - na'
      /*E*/'\nEłk'
      /*F*/'\nFi - lan - tro - pia'
      /*G*/'\nGo - spo - da'
      /*H*/'\nHa - la - bar - da'
      /*I*/'\nI - gła'
      /*J*/'\nJed - no - kon - no'
      /*K*/'\nKo - la - no'
      /*L*/'\nLe - o - ni - das'
      /*M*/'\nMo - tor'
      /*N*/'\nNo - ga'
      /*O*/'\nO - po - czno'
      /*P*/'\nPe - lo - po - nez'
      /*R*/'\nRe - tor - ta'
      /*S*/'\nSa - ha - ra'
      /*T*/'\nTor'
      /*U*/'\nUr - sy - nów'
      /*W*/'\nWi - no - rośl'
      /*Y*/'\nYo - gur - to - wo'
      /*Z*/'\nZło - to - li - te';

  DescMorse({super.key});

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const AppText(
            'Alfabet Morse\'a jest kodem, w którym każdej literze <b>przypisany jest ciąg kopek i kresek</b>.'
                '\n\nSzyfr łatwo zapamiętać przypisując każdej z liter określony, zaczynający się nań <b>wyraz</b> (A - Azot, B - Botanika itd.). Wyraz następnie wystarczy na <b>sylaby</b> i każdą z sylab zastąpić:'
                '\n\n<b>— kreską</b>, gdy w sylabie występuje <b>O lub Ó</b>,'
                '\n<b>• kropką</b> w przeciwnym razie.',
            size: Dimen.TEXT_SIZE_BIG
        ),
        const SizedBox(height: 2*Dimen.defMarg),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              letters,
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, height: 1.2),
            ),
            const SizedBox(width: 2*Dimen.defMarg),
            Text(
              morse,
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, height: 1.2),
            ),
            const SizedBox(width: 2*Dimen.defMarg),
            Text(
              words,
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, height: 1.2),
            ),

          ],
        )
      ]
  );

}