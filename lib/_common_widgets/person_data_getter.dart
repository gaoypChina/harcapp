import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/values/hufce.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

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
  StopZHP? stopHarc;
  Org? org;

  Person get currentPerson => Person(
    name: nameController.text,
    druzyna: druzynaController.text,
    hufiec: hufiecController.text,
    stopI: stopInstr,
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
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.SIDE_MARG,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    const TitleShortcutRowWidget(
                      title: 'Twoje dane',
                      textAlign: TextAlign.left,
                    ),

                    Text(
                      'By każdy wiedział, kto dodał piosenkę!',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    AppTextFieldHint(
                      hint: 'Imię i naziwsko:',
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

                    HintDropdownWidget<StopZHP?>(
                      hint: 'Stopień harcerski:',
                      hintTop: 'Stopień harcerski',
                      value: stopHarc,
                      onChanged: (value){
                        setState(() => stopHarc = value);
                        widget.onChanged(currentPerson);
                      },
                      onCleared: (){
                        setState(() => stopInstr = null);
                        widget.onChanged(currentPerson);
                      },
                      items: [
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.dhc,
                          child: Text('Druh', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.dhd,
                          child: Text('Druhna', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.ml,
                          child: Text('Młodzik', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.och,
                          child: Text('Ochotniczka', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.wyw,
                          child: Text('Wywiadowca', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.trop,
                          child: Text('Tropicielka', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.odk,
                          child: Text('Odkrywca', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.pion,
                          child: Text('Pionierka', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.cw,
                          child: Text('Ćwik', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.sam,
                          child: Text('Samarytanka', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.HOc,
                          child: Text('Harcerz Orli', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.HOd,
                          child: Text('Harcerka Orla', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.HRc,
                          child: Text('Harcerz Rzeczypospolitej', style: AppTextStyle()),
                        ),
                        DropdownMenuItem<StopZHP>(
                          value: StopZHP.HRd,
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
                      ],
                    ),

                  ],
                ),
              ),

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
    stopH: stringToStopZHP[ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC)],
    org: orgFromInt[ShaPref.getInt(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG, -1)],
  );

  Person? person;

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

  String? stopHStr = stopZHPToString[person!.stopH];
  if(stopHStr == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC);
  else ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC, stopHStr);

  if(person!.org == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG);
  else ShaPref.setInt(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG, orgToInt[person!.org]!);

  return person;

}