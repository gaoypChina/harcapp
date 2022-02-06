import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class ChildBezpieczenstwo extends StatelessWidget{

  const ChildBezpieczenstwo();

  @override
  Widget build(BuildContext context) {

    AutoSizeGroup sizeGroup = AutoSizeGroup();

    List<RichText> texts = [
      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Ogień potrafi '),
          TextSpan(text: 'okaleczyć ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'lub nawet '),
          TextSpan(text: 'zabić ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: '- zachowaj szczególną '),
          TextSpan(text: 'ostrożność', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: '!', ),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Ognisko należy rozpalać tylko w miejscach do tego '),
          TextSpan(text: 'wyznaczonych', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: '.')
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'W terenie ognisko można rozpalać przynajmniej '),
          TextSpan(text: '100m od lasu ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'i zabudowań.'),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Zadbaj, by w pobliżu nie było '),
          TextSpan(text: 'łatwopalnych przedmiotów', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: ', zwisających gałęzi ani drzew.'),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Pilnuj ogniska, by nikt '),
          TextSpan(text: 'niepowołany ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'się do niego nie zbliżał. Nie każdy wie jak obchodzić się z ogniem.'),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Zabezpiecz ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'miejsce ogniskowe – '),
          TextSpan(text: 'obłóż kamieniami', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: ', wytnij darń i odłóż na bok – przyda się do zakrycia ogniska jak skończysz.'),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Nigdy ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'nie używaj '),
          TextSpan(text: 'spirytusu ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'lub paliwa jako rozpałki – może wsiąkać w ziemię lub '),
          TextSpan(text: 'wybuchnąć', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: '!'),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Nigdy nie rób ogniska większego niż jest potrzebne – w razie wypadku łatwiej '),
          TextSpan(text: 'zapanować ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'nad małym ogniem.'),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'Przygotuj się na ewentualne "alarmowe" '),
          TextSpan(text: 'gaszenie ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'zawsze miej w pobliżu '),
          TextSpan(text: 'sprzęt gaśniczy', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: '.'),
        ],
      ),),

      RichText(text: TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        children: <TextSpan>[
          TextSpan(text: 'W pobliżu ogniska trzymaj naczynie z '),
          TextSpan(text: 'wodą', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: ', saperkę i '),
          TextSpan(text: 'piasek ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: 'oraz jeśli to możliwe małą '),
          TextSpan(text: 'gaśnicę ', style: AppTextStyle(fontWeight: weight.halfBold)),
          TextSpan(text: '– te rzeczy ułatwią gaszenie.'),

        ],
      ),),
    ];

    return Column(
      children: texts.map<Widget>((item) =>
          ListTile(
              leading: AutoSizeText((texts.indexOf(item) + 1).toString(), style: AppTextStyle(fontSize: 20.0), group: sizeGroup,),
              title: item
          )
        ).toList(),
    );
  }
}