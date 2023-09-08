import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import '../values/rank_harc.dart';
import 'hint_dropdown_widget.dart';

class PersonDataDialog extends StatefulWidget{

  final Person? initialPerson;
  final void Function(Person) onChanged;

  const PersonDataDialog({
    this.initialPerson,
    required this.onChanged,
    super.key
  });

  @override
  State<StatefulWidget> createState() => PersonDataDialogState();

}

class PersonDataDialogState extends State<PersonDataDialog>{

  Person? get initialPerson => widget.initialPerson;

  late TextEditingController nameController;
  late TextEditingController druzynaController;
  late TextEditingController hufiecController;
  String? stopInstr;
  RankHarc? stopHarc;
  Org? org;

  Person get currentPerson => Person(
    name: nameController.text.trim(),
    druzyna: druzynaController.text.trim(),
    hufiec: hufiecController.text.trim(),
    stopI: stopInstr?.trim(),
    stopH: stopHarc,
    org: org
  );
  
  @override
  void initState() {
    nameController = TextEditingController(text: initialPerson?.name);
    druzynaController = TextEditingController(text: initialPerson?.druzyna);
    hufiecController = TextEditingController(text: initialPerson?.hufiec);
    stopInstr = initialPerson?.stopI;
    stopHarc = initialPerson?.stopH;
    org = initialPerson?.org;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(Dimen.SIDE_MARG)),
      child: Material(
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [

              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: Dimen.TEXT_FIELD_PADD,
                  right: Dimen.TEXT_FIELD_PADD,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    const TitleShortcutRowWidget(
                      title: 'Twoje dane',
                      textAlign: TextAlign.left,
                    ),

                    Text(
                      'By każdy wiedział, kto dodał tę piosenkę!',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    AppTextFieldHint(
                      hint: 'Imię i nazwisko:',
                      hintTop: 'Imię i nazwisko',
                      controller: nameController,
                      onChanged: (_, __) => widget.onChanged(currentPerson),
                    ),

                    AppTextFieldHint(
                      hint: 'Drużyna:',
                      hintTop: 'Drużyna',
                      controller: druzynaController,
                      onChanged: (_, __) => widget.onChanged(currentPerson),
                    ),

                    AppTextFieldHint(
                      hint: 'Hufiec:',
                      hintTop: 'Hufiec',
                      controller: hufiecController,
                      onChanged: (_, __) => widget.onChanged(currentPerson),
                    ),
                  ],
                ),
              ),

              HintDropdownWidget<RankHarc?>(
                hint: 'Stopień harcerski:',
                hintTop: 'Stopień harcerski',
                value: stopHarc,
                onChanged: (value){
                  setState(() => stopHarc = value);
                  widget.onChanged(currentPerson);
                },
                onCleared: (){
                  setState(() => stopHarc = null);
                  widget.onChanged(currentPerson);
                },
                items: [
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.dhc,
                    child: Text('Druh', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.dhd,
                    child: Text('Druhna', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpMlodzik,
                    child: Text('Młodzik', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpOchotniczka,
                    child: Text('Ochotniczka', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpWywiadowca,
                    child: Text('Wywiadowca', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpTropicielka,
                    child: Text('Tropicielka', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpOdkrywca,
                    child: Text('Odkrywca', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpPionierka,
                    child: Text('Pionierka', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpCwik,
                    child: Text('Ćwik', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpSamarytanka,
                    child: Text('Samarytanka', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpHOc,
                    child: Text('Harcerz Orli', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpHOd,
                    child: Text('Harcerka Orla', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpHRc,
                    child: Text('Harcerz Rzeczypospolitej', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<RankHarc>(
                    value: RankHarc.zhpHRd,
                    child: Text('Harcerka Rzeczypospolitej', style: AppTextStyle()),
                  ),
                ],
              ),

              HintDropdownWidget<String?>(
                hint: 'Stopień instruktorski:',
                hintTop: 'Stopień instruktorski',
                value: stopInstr,
                onChanged: (value){
                  setState(() => stopInstr = value);
                  widget.onChanged(currentPerson);
                },
                onCleared: (){
                  setState(() => stopInstr = null);
                  widget.onChanged(currentPerson);
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'pwd.',
                    child: Text('Przewodnik', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<String>(
                    value: 'phm.',
                    child: Text('Podharcmistrz', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<String>(
                    value: 'hm.',
                    child: Text('Harcmistrz', style: AppTextStyle()),
                  ),
                ],
              ),

              HintDropdownWidget<Org?>(
                hint: 'Organizacja harcerska:',
                hintTop: 'Organizacja',
                value: org,
                onChanged: (value){
                  setState(() => org = value);
                  widget.onChanged(currentPerson);
                },
                onCleared: (){
                  setState(() => org = null);
                  widget.onChanged(currentPerson);
                },
                items: [
                  DropdownMenuItem<Org>(
                    value: Org.zhp,
                    child: Text('ZHP', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<Org>(
                    value: Org.zhr_o,
                    child: Text('ZHR', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<Org>(
                    value: Org.fse,
                    child: Text('FSE', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<Org>(
                    value: Org.sh,
                    child: Text('SH', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<Org>(
                    value: Org.zhp_n_l,
                    child: Text('ZHPnL', style: AppTextStyle()),
                  ),
                  DropdownMenuItem<Org>(
                    value: Org.hrp,
                    child: Text('HRP', style: AppTextStyle()),
                  ),
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              Row(
                children: [

                  Expanded(child: SimpleButton.from(
                      context: context,
                      margin: EdgeInsets.zero,
                      text: 'Dalej',
                      onTap: () => popPage(context)
                  ))

                ],
              )

            ],
          )
      ),
    ),
  );

}

Future<Person?> getMyPersonData(BuildContext context) async {

  Person initPerson = Person(
    name: ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_NAME)??'',
    druzyna: ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_DRUZYNA),
    hufiec: ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_HUFIEC),
    stopI: ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_INSTR),
    stopH: paramToRankHarc[ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC)],
    org: orgFromInt[ShaPref.getInt(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG, -1)],
  );

  Person? person = initPerson;

  await openDialog(context: context, dismissible: false, builder: (context) => PersonDataDialog(
    initialPerson: initPerson,
    onChanged: (p) => person = p,
  ));

  if(person == null) return null;

  ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_NAME, person!.name);

  if(person!.druzyna == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_DRUZYNA);
  else ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_DRUZYNA, person!.druzyna!);

  if(person!.hufiec == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_HUFIEC);
  else ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_HUFIEC, person!.hufiec!);

  if(person!.stopI == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_INSTR);
  else ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_INSTR, person!.stopI!);

  String? stopHStr = person!.stopH==null?null:rankHarcToStr(person!.stopH!);
  if(stopHStr == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC);
  else ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC, stopHStr);

  if(person!.org == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG);
  else ShaPref.setInt(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG, orgToInt[person!.org]!);

  return person;

}