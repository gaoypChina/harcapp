import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/account/account_common/org_input_field.dart';
import 'package:harcapp/account/account_common/rank_harc_input_field.dart';
import 'package:harcapp/account/account_common/rank_instr_input_field.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp/values/rank_instr.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import '../values/rank_harc.dart';

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
  RankInstr? rankInstr;
  RankHarc? rankHarc;
  Org? org;

  Person get currentPerson => Person(
    name: nameController.text.trim(),
    druzyna: druzynaController.text.trim(),
    hufiec: hufiecController.text.trim(),
    rankInstr: rankInstr,
    rankHarc: rankHarc,
    org: org
  );
  
  @override
  void initState() {
    nameController = TextEditingController(text: initialPerson?.name);
    druzynaController = TextEditingController(text: initialPerson?.druzyna);
    hufiecController = TextEditingController(text: initialPerson?.hufiec);
    rankInstr = initialPerson?.rankInstr;
    rankHarc = initialPerson?.rankHarc;
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

              RankHarcInputField(
                rankHarc,
                onChanged: (value){
                  setState(() => rankHarc = value);
                  widget.onChanged(currentPerson);
                },
              ),

              RankInstrInputField(
                rankInstr,
                onChanged: (value){
                  setState(() => rankInstr = value);
                  widget.onChanged(currentPerson);
                },
              ),
              
              OrgInputField(
                org,
                onChanged: (value){
                  setState(() => org = value);
                  widget.onChanged(currentPerson);
                },
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
    rankInstr: paramToRankInstr[ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_INSTR)],
    rankHarc: paramToRankHarc[ShaPref.getStringOrNull(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC)],
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

  String? rankInstrStr = person!.rankInstr==null?null:rankInstrToStr(person!.rankInstr!);
  if(rankInstrStr == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_INSTR);
  else ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_INSTR, rankInstrStr);

  String? rankHarcStr = person!.rankHarc==null?null:rankHarcToStr(person!.rankHarc!);
  if(rankHarcStr == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC);
  else ShaPref.setString(ShaPref.SHA_PREF_MY_PERSON_DATA_STOP_HARC, rankHarcStr);

  if(person!.org == null) ShaPref.remove(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG);
  else ShaPref.setInt(ShaPref.SHA_PREF_MY_PERSON_DATA_ORG, orgToInt[person!.org]!);

  return person;

}