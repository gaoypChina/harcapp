import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:provider/provider.dart';
import 'package:harcapp_core/dimen.dart';

class GeneralPart extends StatefulWidget{

  const GeneralPart({super.key});

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
          hint: 'Nazwa środowiska:',
          hintTop: 'Nazwa środowiska',
          controller: prov.nameController,
          maxLength: Community.maxLenName,
        ),
      ),



    ],
  );

}
