import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';


class AccountTestWidget extends StatefulWidget{

  static bool visible = true;

  const AccountTestWidget({super.key});

  @override
  State<StatefulWidget> createState() => AccountTestWidgetState();

}

class AccountTestWidgetState extends State<AccountTestWidget>{

  @override
  Widget build(BuildContext context) =>
      AccountTestWidget.visible?
      GestureDetector(
        onTap: () => showAppToast(context, text: 'Przytrzymaj, by ukryć'),
        onLongPress: () => setState(() => AccountTestWidget.visible = false),
        child: Material(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              child: AppText(
                'Konta HarcApp i wszystko z nimi związane są obecnie w <b>fazie testu</b>. '
                    'Do czasu wydania wersji stabilnej, konta w każdej chwili <b>mogą zostać skasowane</b>.'
                    '\n\nJeśli znajdziesz <b>błędy</b>, coś jest <b>nieintuicyjne</b>, albo coś <b>wymaga poprawy</b> - pisz na <b>harcapp@gmail.com</b>',
                textAlign: TextAlign.center,
                color: background_(context),
              ),
            )
        ),
      ):
      Container();

}