import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_1.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_10.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_2.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_3.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_4.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_5.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_6.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_7.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_8.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/how_to_guide/page_9.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlowoKluczHowToGuide extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => SlowoKluczHowToGuideState();


}

class SlowoKluczHowToGuideState extends State<SlowoKluczHowToGuide>{

  List<HowToGuideItem> items = [
    HowToGuideItem(colorStart: Colors.red, colorEnd: Colors.pink, buildPage: (context) => Page1()),
    HowToGuideItem(colorStart: Colors.red, colorEnd: Colors.orange, buildPage: (context) => Page2()),
    HowToGuideItem(colorStart: Colors.yellow, colorEnd: Colors.orange, buildPage: (context) => Page3()),
    HowToGuideItem(colorStart: Colors.yellow, colorEnd: Colors.teal, buildPage: (context) => Page4()),
    HowToGuideItem(colorStart: Colors.lightBlueAccent, colorEnd: Colors.teal, buildPage: (context) => Page5()),
    HowToGuideItem(colorStart: Colors.lightBlueAccent, colorEnd: Colors.deepPurple, buildPage: (context) => Page6()),
    HowToGuideItem(colorStart: Colors.lightBlueAccent, colorEnd: Colors.deepPurple, buildPage: (context) => Page7()),
    HowToGuideItem(colorStart: Colors.lightBlueAccent, colorEnd: Colors.deepPurple, buildPage: (context) => Page8()),
    HowToGuideItem(colorStart: Colors.lightBlueAccent, colorEnd: Colors.brown, buildPage: (context) => Page9()),
    HowToGuideItem(colorStart: Colors.lightBlueAccent, colorEnd: Colors.brown, buildPage: (context) => Page10()),
  ];

  Color currColorStart;
  Color currColorEnd;

  PageController controller;

  @override
  void initState() {

    currColorStart = items[0].colorStart;
    currColorEnd = items[0].colorEnd;

    controller = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AppCard(
      radius: AppCard.BIG_RADIUS,
      margin: EdgeInsets.all(Dimen.SIDE_MARG),
      padding: EdgeInsets.zero,
      child: GradientWidget(
          colorStart: currColorStart.withOpacity(0.6),
          colorEnd: currColorEnd.withOpacity(0.6),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Jak grać?'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              children: [

                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: controller,
                    itemCount: items.length,
                    itemBuilder: (context, page) => items[page].buildPage(context),
                    onPageChanged: (page){
                      currColorStart = items[page].colorStart;
                      currColorEnd = items[page].colorEnd;
                      setState(() {});
                    },
                  )
                ),

                SmoothPageIndicator(
                    controller: controller,  // PageController
                    count: items.length,
                    effect: WormEffect(
                      dotColor: Colors.black54,
                      activeDotColor: Colors.white,
                      dotWidth: 8,
                      dotHeight: 8
                    ),
                    onDotClicked: (index){}
                ),

                SizedBox(height: Dimen.SIDE_MARG),

              ],
            ),
          )
      ),
    );

  }

}

class HowToGuideItem{

  final Color colorStart;
  final Color colorEnd;
  final Widget Function(BuildContext) buildPage;

  const HowToGuideItem({
      @required this.colorStart,
      @required this.colorEnd,
      @required this.buildPage
  });

}