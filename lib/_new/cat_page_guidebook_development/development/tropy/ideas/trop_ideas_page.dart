import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab_indicator.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/ideas/trop_ideas_search_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../trop_tile.dart';
import 'trop_idea.dart';

class TropIdeasPage extends StatefulWidget{

  final String metoShort;
  final List<TropIdea> ideas;

  const TropIdeasPage({required this.metoShort, required this.ideas, super.key});

  @override
  State<StatefulWidget> createState() => TropIdeasPageState();

}

class TropIdeasPageState extends State<TropIdeasPage> with TickerProviderStateMixin{

  String get metoShort => widget.metoShort;
  List<TropIdea> get ideas => widget.ideas;

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: ideas.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){

        List<FolderBaseTab> tabs = [];
        for(int i=0; i<ideas.length; i++)
          tabs.add(FolderBaseTab(
              leading: TropIcon(
                ideas[i].category,
                size: 32.0,
              ),
              name: ideas[i].name
          ));

        return [
          SliverAppBar(
            title: Text('Pomysły na tropy $metoShort'),
            centerTitle: true,
            floating: true,
            pinned: true,
            bottom: TabBar(
              tabs: tabs,
              controller: controller,
              isScrollable: true,
              indicator: FolderTabIndicator(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.magnify),
                onPressed: () => pushPage(
                    context,
                    builder: (context) => TropIdeasSearchPage(
                      ideas: ideas,
                      onSelected: (index) => controller.animateTo(index)
                    )
                ),
              )
            ],
          )
        ];

      },
      body: Container(
        color: backgroundIcon_(context),
        child: Builder(
          builder: (context){

            List<Widget> children = [];
            for(int i=0; i<ideas.length; i++)
              children.add(TropIdeaWidget(ideas[i]));

            return TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                children: children
            );

          },
        ),
      )
    ),
  );

}

class TropIdeaWidget extends StatelessWidget{

  final TropIdea data;

  const TropIdeaWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      TropTile(
        name: data.name,
        category: data.category,
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      BorderMaterial(
        borderColor: textEnab_(context),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                'Wprowadzenie',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold
                ),
              ),
              const SizedBox(height: Dimen.ICON_MARG),
              SelectableText(
                data.intro,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
              ),

            ],
          ),
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      BorderMaterial(
        borderColor: textEnab_(context),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                'Zaplanujcie',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold
                ),
              ),
              const SizedBox(height: Dimen.ICON_MARG),
              SelectableText(
                data.plan,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
              ),

            ],
          ),
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      BorderMaterial(
        borderColor: textEnab_(context),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                'Zróbcie',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold
                ),
              ),
              const SizedBox(height: Dimen.ICON_MARG),
              SelectableText(
                data.todo,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
              ),

            ],
          ),
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      BorderMaterial(
        borderColor: textEnab_(context),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                'Podsumujcie',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold
                ),
              ),
              const SizedBox(height: Dimen.ICON_MARG),
              SelectableText(
                data.summary,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
              ),

            ],
          ),
        ),
      )

    ],
  );

}