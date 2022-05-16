import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/sliding_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../module_statistics_registrator.dart';
import 'all_signs_page.dart';
import 'data.dart';

class ZnakiPatroloweFragment extends StatefulWidget {

  const ZnakiPatroloweFragment({super.key});

  @override
  State createState() => ZnakiPatroloweFragmentState();
  
}

class ZnakiPatroloweFragmentState extends State<ZnakiPatroloweFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.znakiPatrolowe;

  static ValueNotifier<double>? notifier;
  PageController? pageController;

  @override
  void initState() {

    notifier = ValueNotifier(0);
    pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    notifier!.dispose();
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      appBar: AppBar(
        title: const Text('Znaki patrolowe'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(MdiIcons.dotsGrid),
            onPressed: () => pushPage(
              context,
              builder: (context) => AllSignsPage(
                onItemTap: (index){
                  pageController!.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuint);
                  Navigator.pop(context);
                },
              )
            )
          )
        ],
      ),
        body: Column(
          children: <Widget>[

            Expanded(
              child: SlidingPageView(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: items.length,
                notifier: notifier,
                itemBuilder: (BuildContext context, int index) => Item(items[index], notifier, index),
                scrollDirection: Axis.horizontal,
                grow: true,
              ),
            ),

          ],
        ),
    );

  }

}


class Item extends StatelessWidget{

  final ItemData data;
  final ValueNotifier? notifier;
  final int index;

  const Item(this.data, this.notifier, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(

      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Flexible(child: AspectRatio(
            child: Hero(
              tag: data.fileName,
              child: SvgPicture.asset(
                  'assets/images/znaki_patro/${data.fileName}.svg',
                  color: hintEnab_(context)
              ),
            ),
            aspectRatio: 96/50,
          )),

          const SizedBox(height: 42),

          AnimatedBuilder(
            animation: notifier!,
            builder: (context, _) => Transform.translate(
                offset: Offset(
                    -.4*MediaQuery.of(context).size.height* (notifier!.value - index),
                    0
                ),
                child: Container(
                    height: 64,
                    child: AutoSizeText(
                        data.description,
                        style: TextStyle(fontFamily: 'Hand5', fontSize: 34.0, color: hintEnab_(context)),
                        maxLines: 3,
                        textAlign: TextAlign.center
                    ),
                    alignment: Alignment.center)
            ),
          )

        ],
      ),
    ));
  }


}

