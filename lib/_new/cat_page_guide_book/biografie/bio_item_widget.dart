import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core_tags/tag_layout.dart';

import 'data.dart';
import 'image_viewer.dart';

class FastTapCounter{

  static const int maxTapTimes = 10;

  static List<DateTime> tapTimes = [];

  static void tap(BuildContext context){
    tapTimes.add(DateTime.now());
    if(tapTimes.length>=maxTapTimes){
      if(tapTimes[0].difference(tapTimes[maxTapTimes-1]).compareTo(const Duration(seconds: 3))<1) {
        showAppToast(context, text: 'Na wąsy Baden-Powella, <b>SPOKOJNIEJ</b>!', duration: const Duration(seconds: 5));
        tapTimes.clear();
      }else{
        tapTimes.remove(tapTimes.last);
      }
    }

  }

}

class BioItemWidget extends StatelessWidget{

  final ItemData data;
  final int index;
  final ValueNotifier? notifier;
  final ScrollController Function() controller;

  const BioItemWidget({required this.data, required this.index, required this.notifier, required this.controller});

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical;
    double appBarHeight = AppBar().preferredSize.height;

    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = 28.0;
    double nameWidgetHeight = textSize + 3*Dimen.SIDE_MARG;
    double statusBarHeight = App.statusBarHeight;
    double tagsHeight = data.tag.isEmpty?0:Tag.height;

    double aspectRatio = (screenWidth) / (screenHeight - 2*appBarHeight - nameWidgetHeight - statusBarHeight - tagsHeight);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [

        if(data.tag.isNotEmpty)
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data.tag.map((String tag) => Tag(tag)).toList(),
            ),
          ),

        AspectRatio(
          aspectRatio: aspectRatio,
          child: Hero(
            tag: DATA[index],
            child: AppCard(
              onTap: (){

                if(data.name == BP_NAME)
                  FastTapCounter.tap(context);

                controller().animateTo(
                    screenWidth*(1/aspectRatio) + tagsHeight,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutQuart
                );

              },
              margin: const EdgeInsets.all(Dimen.SIDE_MARG),
              padding: EdgeInsets.zero,
              elevation: AppCard.bigElevation,
              radius: AppCard.bigRadius,
              child: AnimatedBuilder(
                animation: notifier!,
                builder: (context, _){

                  // NIE DZIAŁA SPLASH: ( Flutter bug)
                  // https://github.com/flutter/flutter/issues/30193
                  return Transform.scale(
                    scale: 1 + sin(notifier!.value - index).abs()*0.25,//Offset(0, MediaQuery.of(context).size.height*(index - notifier.value)*0.2),
                    child: Image.asset('assets/images/bio/${data.imgSrc[0].item1}.webp', fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
                  );
                },
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Text(data.name, style: AppTextStyle(fontWeight: weight.bold, fontSize: textSize), textAlign: TextAlign.center,),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              const TitleShortcutRowWidget(title: 'Krótki opis', textAlign: TextAlign.start),

              const SizedBox(height: Dimen.SIDE_MARG),
              AppText('ur.: ${data.dateBirth}', size: Dimen.TEXT_SIZE_BIG),
              const SizedBox(height: 3.0),
              AppText('zm.: ${data.dateDeath}', size: Dimen.TEXT_SIZE_BIG),
              const SizedBox(height: Dimen.SIDE_MARG),
              AppText(
                data.shortDesc,
                size: Dimen.TEXT_SIZE_BIG,
              ),
            ],
          ),
        ),

        Container(
          height: 200,
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.imgSrc.length,
              itemBuilder: (context, index) => Hero(
                tag: data.imgSrc[index],
                child: AppCard(
                  color: Colors.transparent,
                  margin: AppCard.normMargin,
                  onTap: () => openDialog(context: context, builder: (context) => ImageViewer(data.imgSrc, index)),
                  padding: EdgeInsets.zero,
                  elevation: AppCard.bigElevation,
                  child: Image.asset('assets/images/bio/${data.imgSrc[index].item1}.webp', fit: BoxFit.fitWidth),
                ),
              )
          ),
        ),

        if(data.longDesc!=null)
          Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                const TitleShortcutRowWidget(title: 'Pełny opis', textAlign: TextAlign.start),

                const SizedBox(height: Dimen.SIDE_MARG),
                AppText(
                  data.longDesc,
                  size: Dimen.TEXT_SIZE_BIG,
                ),
              ],
            ),
          ),

        Padding(
          padding: const EdgeInsets.all(Dimen.defMarg),
          child: Text(
              data.source,
              style: AppTextStyle(
                  color: hintEnab_(context),
                  fontSize: Dimen.TEXT_SIZE_TINY),
              textAlign: TextAlign.end
          ),
        )
      ],
    );
  }
}