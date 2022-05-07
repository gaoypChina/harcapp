import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:provider/provider.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_edit_page/providers.dart';
import 'package:harcapp_core/dimen.dart';

class GeneralPart extends StatefulWidget{

  const GeneralPart({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GeneralPartState();

}

class GeneralPartState extends State<GeneralPart>{

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      Consumer<NameProvider>(
        builder: (context, prov, child) => AppTextFieldHint(
          hint: 'Nazwa kręgu:',
          hintTop: 'Nazwa kręgu',
          controller: prov.nameController,
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Consumer<DescriptionProvider>(
        builder: (context, prov, child) => AppTextFieldHint(
          hint: 'Opis kręgu:',
          hintTop: 'Opis kręgu',
          controller: prov.descriptionController,
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Consumer<ColorsKeyProvider>(
        builder: (context, prov, child) => SwitchListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 3.0),
          title: Text('Tło kolorystyczne', style: AppTextStyle()),
          value: prov.colorsKey == 'auto',
          onChanged: (bool checked) => prov.colorsKey = (checked?'auto':'none')
        ),
      ),
    ],
  );

}
