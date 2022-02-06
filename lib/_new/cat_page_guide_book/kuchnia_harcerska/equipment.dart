import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class Equipment{


  static const Equipment CHOCHLA = const Equipment("Chochla", 'kuch_eq_ladle');
  static const Equipment DESKA_DO_KROJENIA = const Equipment("Deska do krojenia", 'kuch_eq_chopping_board');
  static const Equipment DREWNIANA_SZPATULKA = const Equipment("Drewniana szpatułka", 'kuch_eq_wood_fork');
  static const Equipment GARNEK = const Equipment("Garnek", 'kuch_eq_pot');
  static const Equipment LYZKA_DO_MIESZANIA = const Equipment("Łyżka do mieszania", 'kuch_eq_spoon');
  static const Equipment MENAZKA = const Equipment("Menażka", 'kuch_eq_small_pot');
  static const Equipment NOZ = const Equipment("Nóż", 'kuch_eq_knife');
  //static final Equipment OBIERACZKA = new Equipment("Obieraczka",);
  static const Equipment PATELNIA = const Equipment("Patelnia", 'kuch_eq_frying_pan');
  static const Equipment RECZNIK_PAPIEROWY = const Equipment("Ręcznik papierowy", 'kuch_eq_toilet_paper');
  static const Equipment TARKA = const Equipment("Tarka", 'kuch_eq_grater');
  static const Equipment TLUCZEK = const Equipment("Tłuczek do ziemniaków", 'kuch_eq_masher');

  final String name;
  final String _fileName;

  fileName() => 'assets/images/kuch/$_fileName.svg';

  const Equipment(this.name, this._fileName);
}

class EquipmentWidget extends StatelessWidget{

  final Equipment equipment;
  final int amount;
  const EquipmentWidget(this.equipment, this.amount);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(Dimen.ICON_MARG),
          child: SvgPicture.asset(equipment.fileName(), width: 24, height: 24,),
        ),
        Text('${equipment.name}', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
        Expanded(child: Container()),
        Text(' x $amount', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
        SizedBox(width: Dimen.ICON_MARG)

      ],
    );
  }

}