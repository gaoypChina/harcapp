
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guide_book/biografie/bio_item_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../module_statistics_registrator.dart';
import 'all_bio_page.dart';
import 'data.dart';

class BiografieFragment extends StatefulWidget{
  
  const BiografieFragment({super.key});

  @override
  State<StatefulWidget> createState() => BiografieFragmentState();

}

class BiografieFragmentState extends State<BiografieFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.biografie;

  PageController? controller;
  ValueNotifier<double?>? notifier;

  GlobalKey<NestedScrollViewState>? nestedScrollViewKey;

  @override
  void initState() {
    controller = PageController();
    notifier = ValueNotifier(.0);
    controller!.addListener(() => notifier!.value = controller!.page);

    nestedScrollViewKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<DATA.length; i++){
      ItemData data = DATA[i];
      children.add(BioItemWidget(
        data: data,
        index: i,
        notifier: notifier,
       controller: () => nestedScrollViewKey!.currentState!.innerController
      ));
    }

    return BottomNavScaffold(
      body: NestedScrollView(
        key: nestedScrollViewKey,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Biografie'),
            centerTitle: true,
            floating: true,
            backgroundColor: background_(context),
            forceElevated: innerBoxIsScrolled,
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.dotsGrid),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AllBioPage(
                  onPicked: (int index) => controller!.jumpToPage(index),
                ))))
            ],
          ),
        ],
        body: PageView(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          children: children,
        ),
      ),
    );

  }

}
