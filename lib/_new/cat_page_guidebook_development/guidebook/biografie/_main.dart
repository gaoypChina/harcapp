
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab_indicator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/biografie/bio_item_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'all_bio_page.dart';
import 'data.dart';

class BiografieFragment extends StatefulWidget{
  
  const BiografieFragment({super.key});

  @override
  State<StatefulWidget> createState() => BiografieFragmentState();

}

class BiografieFragmentState extends State<BiografieFragment> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.biografie;

  late TabController controller;
  late ValueNotifier<double> notifier;

  GlobalKey<NestedScrollViewState>? nestedScrollViewKey;

  @override
  void initState() {
    controller = TabController(length: DATA.length, vsync: this);
    notifier = ValueNotifier(.0);
    controller.animation?.addListener(() => notifier.value = controller.index + controller.offset);

    nestedScrollViewKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(int i=0; i<DATA.length; i++)
      children.add(BioItemWidget(
        data: DATA[i],
        index: i,
        notifier: notifier,
       controller: () => nestedScrollViewKey!.currentState!.innerController
      ));

    List<FolderBaseTab> tabs = [];
    for(ItemData data in DATA)
      tabs.add(FolderBaseTab(
        text: data.name
      ));

    return BottomNavScaffold(
      body: NestedScrollView(
        key: nestedScrollViewKey,
        floatHeaderSlivers: true,
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
                icon: Icon(MdiIcons.dotsGrid),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AllBioPage(
                  onPicked: (int index) => controller.animateTo(index),
                ))))
            ],
            bottom: TabBar(
              tabs: tabs,
              controller: controller,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              indicator: FolderTabIndicator(context),
            ),
          ),
        ],
        body: Container(
          color: backgroundIcon_(context),
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            children: children,
          ),
        )
      ),
    );

  }

}
