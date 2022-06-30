
import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

AppTextStyle settingsHintStyle(BuildContext context) => AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: hintEnab_(context));
AppTextStyle settingsTextStyle(BuildContext context) => AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context), fontWeight: weight.halfBold);

const String forceLoggedOutMessage = 'Wymagane ponowne zalogowanie';
const String serverWakingUpMessage = 'Twoje konto właśnie obudziło drzemiący serwer. Spróbuj za minutę, gdy wstanie na dobre.';
String get simpleErrorMessage{

  List<String> messages = [
    'Coś poszło nie tak',
    'Coś nie siadło',
    'Coś nie hula',
    'Coś nie styka',
    'Coś nie bangla',
    'Coś nie pykło',
    'Coś jest nie teges',
    'Coś tu nie gra',
  ];
  messages.shuffle();
  return messages[0];

}