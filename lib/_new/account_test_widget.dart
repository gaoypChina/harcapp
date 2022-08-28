import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import '../_common_widgets/app_text.dart';

class AccountTestWidget extends StatelessWidget{

  const AccountTestWidget({super.key});

  @override
  Widget build(BuildContext context) => AppCard(
    radius: AppCard.bigRadius,
    margin: EdgeInsets.zero,
    color: Colors.red,
    elevation: AppCard.bigElevation,
    padding: const EdgeInsets.all(Dimen.ICON_MARG),
    child: AppText(
      'Konta HarcApp i wszystko z nimi związane są obecnie w <b>fazie testu</b>. '
          'Do czasu wydania wersji stabilnej, konta w każdej chwili <b>mogą zostać skasowane</b>.'
          '\n\nJeśli znajdziesz <b>błędy</b>, coś jest <b>nieintuicyjne</b>, albo coś <b>wymaga poprawy</b> - pisz na <b>harcapp@gmail.com</b>',
      textAlign: TextAlign.center,
      color: background_(context),
    ),
  );



}