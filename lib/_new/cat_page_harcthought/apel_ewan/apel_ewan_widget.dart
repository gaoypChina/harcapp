import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'apel_ewan.dart';
import 'apel_ewan_category_selector.dart';

class ApelEwanWidget extends StatefulWidget{

  final ApelEwan apelEwan;
  final String? initSubgroup;

  const ApelEwanWidget(this.apelEwan, {this.initSubgroup, super.key});

  @override
  State<StatefulWidget> createState() => ApelEwanWidgetState();

}

class ApelEwanWidgetState extends State<ApelEwanWidget>{

  ApelEwan get apelEwan => widget.apelEwan;

  late String selSubgroupSuff;
  late List<String> allSubgroupSuffs;

  String? author;
  String? text;
  late Map<String, String> comments;
  late Map<String, List<String>> questions;

  void run() async {
    text = await apelEwan.text;
    questions.clear();
    for(String subgroupSuff in allSubgroupSuffs) {
      String? questionData = await apelEwan.question(subgroupSuff);
      if(questionData == null) continue;
      questions[subgroupSuff] = questionData.split('\n');
      questions[subgroupSuff]!.removeWhere((data) => data.isEmpty);
    }

    comments.clear();
    for(String subgroupSuff in allSubgroupSuffs) {
      String? comment = await apelEwan.comment(subgroupSuff);
      if(comment == null) continue;
      comments[subgroupSuff] = comment;
    }
    
    setState((){});
  }

  @override
  void initState() {

    comments = {};
    questions = {};

    selSubgroupSuff = widget.initSubgroup??apelEwan.subgroupTitle.keys.first;
    allSubgroupSuffs = apelEwan.subgroupTitle.keys.toList();

    switch(apelEwan.siglum.split(' ')[0]){
      case 'Mt':
        author = 'Mateusza';
        break;
      case 'Mk':
        author = 'Marka';
        break;
      case 'Łk':
        author = 'Łukasza';
        break;
      case 'J':
        author = 'Jana';
        break;
    }
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      text == null?
      Container():
      Column(
        children: [

          Material(
              clipBehavior: Clip.hardEdge,
              color: cardEnab_(context),
              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
              child: Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Text(
                      apelEwan.subgroupTitle[selSubgroupSuff]!,
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),

                    if(author != null)
                      const SizedBox(height: Dimen.SIDE_MARG),

                    if(author != null)
                      Text(
                        'Słowa Ewangelii według św. $author',
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.halfBold,
                            color: hintEnab_(context)
                        ),
                        textAlign: TextAlign.justify,
                      ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    AppText(
                      text!.replaceAll('\n\n', '\n').replaceAll('\n', '\n\n'),
                      size: Dimen.TEXT_SIZE_BIG,
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    Text(
                      'Oto Słowo Boże.',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                      textAlign: TextAlign.justify,
                    ),

                  ],
                ),
              )
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          if(comments[selSubgroupSuff] != null || questions[selSubgroupSuff] != null)
            Material(
              clipBehavior: Clip.hardEdge,
              color: cardEnab_(context),
              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  if(allSubgroupSuffs.length > 1)
                    Material(
                      color: backgroundIcon_(context),
                      child: Row(
                        children: [

                          const SizedBox(width: Dimen.SIDE_MARG),

                          Icon(MdiIcons.checkboxMultipleBlankOutline, color: textEnab_(context)),

                          const SizedBox(width: Dimen.SIDE_MARG),

                          Text(
                            'Wybierz kategorię:',
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                            textAlign: TextAlign.justify,
                          ),

                          Expanded(
                            child: ApelEwanCategorySelector(
                              allSubgroupSuffs: allSubgroupSuffs,
                              selSubgroupSuff: selSubgroupSuff,
                              onChanged: (value) => setState(() => selSubgroupSuff = value as String),
                            ),
                          ),
                        ],
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        if(comments[selSubgroupSuff] != null)
                          Text(
                            'Garść komentarzy',
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                            textAlign: TextAlign.justify,
                          ),

                        if(comments[selSubgroupSuff] != null)
                          const SizedBox(height: Dimen.SIDE_MARG),

                        if(comments[selSubgroupSuff] != null)
                          Text(
                            comments[selSubgroupSuff]!,
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                            textAlign: TextAlign.justify,
                          ),

                        if(comments[selSubgroupSuff] != null)
                          const SizedBox(height: 2*Dimen.SIDE_MARG),

                        if(questions[selSubgroupSuff] != null)
                          Text(
                            'Pytania',
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                            textAlign: TextAlign.justify,
                          ),

                        if(questions[selSubgroupSuff] != null)
                          const SizedBox(height: Dimen.SIDE_MARG),

                        if(questions[selSubgroupSuff] != null)
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 32,
                                      child: Text(
                                          '${index + 1}',
                                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)
                                      ),
                                    ),
                                    Expanded(
                                      child: AppText(
                                          questions[selSubgroupSuff]![index],
                                          size: Dimen.TEXT_SIZE_BIG
                                      ),
                                    )
                                  ]),
                            ),
                            itemCount: questions[selSubgroupSuff]!.length,
                            shrinkWrap: true,
                          )

                      ],
                    ),
                  ),

                ],
              ),
            ),

          if(comments[selSubgroupSuff] != null || questions[selSubgroupSuff] != null)
            const SizedBox(height: Dimen.SIDE_MARG),

        ],
      );

}
