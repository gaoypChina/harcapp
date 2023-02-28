import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab_indicator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/sliding_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'all_signs_page.dart';
import 'data.dart';

class ZnakiPatroloweFragment extends StatefulWidget {

  const ZnakiPatroloweFragment({super.key});

  @override
  State createState() => ZnakiPatroloweFragmentState();
  
}

class ZnakiPatroloweFragmentState extends State<ZnakiPatroloweFragment> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.znakiPatrolowe;

  late ValueNotifier<double> notifier;
  late TabController controller;

  @override
  void initState() {
    notifier = ValueNotifier(0);
    controller = TabController(length: items.length, vsync: this);
    controller.animation!.addListener(() => notifier.value = controller.index + controller.offset);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    List<Widget> children = [];
    for(int i=0; i<items.length; i++)
      children.add(Item(items[i], notifier, i));

    List<Tab> tabs = [];
    for(int i=0; i<items.length; i++)
      tabs.add(Tab(text: items[i].description));

    return BottomNavScaffold(
      appBar: AppBar(
        title: const Text('Znaki patrolowe'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(MdiIcons.magnify),
              onPressed: () => pushPage(
                  context,
                  builder: (context) => AllSignsPage(
                    onItemTap: (index){
                      controller.animateTo(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuint);
                      Navigator.pop(context);
                    },
                  )
              )
          )
        ],
        bottom: TabBar(
          tabs: tabs,
          controller: controller,
          physics: const BouncingScrollPhysics(),
          indicator: AppTabBarIncdicator(color: Colors.teal),
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        children: children,
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
  Widget build(BuildContext context) => Center(child: Padding(

    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Flexible(child: AspectRatio(
          aspectRatio: 96/50,
          child: Hero(
            tag: data.fileName,
            child: SvgPicture.asset(
                'assets/images/znaki_patro/${data.fileName}.svg',
                color: hintEnab_(context)
            ),
          ),
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
                  alignment: Alignment.center,
                  child: AutoSizeText(
                      data.description,
                      style: TextStyle(fontFamily: 'Hand5', fontSize: 34.0, color: hintEnab_(context)),
                      maxLines: 3,
                      textAlign: TextAlign.center
                  ))
          ),
        )

      ],
    ),
  ));


}

