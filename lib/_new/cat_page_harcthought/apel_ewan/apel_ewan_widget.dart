import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import '../../module_statistics_registrator.dart';
import 'apel_ewan.dart';

class ApelEwanWidget extends StatefulWidget{

  final ApelEwan apelEwan;

  const ApelEwanWidget(this.apelEwan, {Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => ApelEwanWidgetState();

}

class ApelEwanWidgetState extends State<ApelEwanWidget> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.myslHarcFormy;

  ApelEwan get apelEwan => widget.apelEwan;

  String? author;
  String? text;
  List<String>? questions;

  void run() async {
    text = await readStringFromAssets(apelEwan.textFileName);
    questions = (await readStringFromAssets(apelEwan.questionsFileName))!.split('\n');

    setState((){});
  }

  @override
  void initState() {
    switch(apelEwan.siglum!.split(' ')[0]){
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
      BottomNavScaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              title: Text(apelEwan.siglum!),
              centerTitle: true,
              floating: true,
            ),

            if(text != null)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                sliver: SliverList(delegate: SliverChildListDelegate([

                  const SizedBox(height: Dimen.SIDE_MARG),

                  Text(
                    'Słowa Ewangelii według Świętego $author',
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  Text(
                    text!,
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  Text(
                    'Oto Słowo Boże.',
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 2*Dimen.SIDE_MARG),

                  Text(
                    'Pytania',
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                ])),
              ),

            if(questions != null)
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.SIDE_MARG,
                ),
                sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index) => Padding(
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
                          child: Text(
                              questions![index],
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
                          ),
                        )
                      ]),
                ),
                childCount: questions!.length
                )),
              )

          ],
        ),
      );

}
