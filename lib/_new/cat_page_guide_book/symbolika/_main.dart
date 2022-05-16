import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/symbolika/symb_image_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../module_statistics_registrator.dart';
import 'all_symbols_page.dart';
import 'data.dart';


class SymbolikaFragment extends StatefulWidget {

  const SymbolikaFragment({super.key});

  @override
  State createState() => SymbolikaFragmentState();
}

class SymbolikaFragmentState extends State<SymbolikaFragment> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.symbolika;

  ValueNotifier<double>? _notifier;
  TabController? controller;
  int? initPage;

  @override
  void initState() {

    _notifier = ValueNotifier(0);
    controller = TabController(length: items.length, vsync: this);
    controller!.animation!.addListener(() => _notifier!.value = controller!.animation!.value);
    initPage = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: NestedScrollView(
      floatHeaderSlivers: true,
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, value) => [
        SliverAppBar(
          backgroundColor: background_(context),
          floating: true,
          pinned: true,
          title: const Text('Symbolika'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(MdiIcons.dotsGrid, color: iconEnab_(context)),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllSymbolsPage(
                          onItemTap: (index){
                            controller!.animateTo(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInQuart);
                            Navigator.pop(context);
                          },
                        )
                    )
                );
              },
            ),
          ],
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            isScrollable: true,
            tabs: items.map((item) => Tab(text: item.title)).toList(),
            //controller: _tabController,
          ),
        ),
      ],
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        children: items.map((item) => Item(_notifier, items.indexOf(item), item)).toList(),
      ),
    ),
  );
}

class Item extends StatelessWidget{
  final ValueNotifier<double>? _notifier;
  final int index;
  final ItemData data;

  const Item(this._notifier, this.index, this.data, {super.key});

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    children: <Widget>[

      AnimatedBuilder(
        animation: _notifier!,
        child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: Hero(
              tag: data,
              child: SymbImageWidget(data),
            )
        ),
        builder: (context, child) => Transform.translate(
          offset: Offset(-0.7*(_notifier!.value-index)* MediaQuery.of(context).size.width, 0),
          child: child,
        ),
      ),

      _DescriptionWidget(data),

    ],
  );

}

class _DescriptionWidget extends StatelessWidget{

  final ItemData data;

  const _DescriptionWidget(this.data);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i = 0; i<data.content1.length; i++){
      children.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            TitleShortcutRowWidget(title: data.content1[i].item1, textAlign: TextAlign.start, titleColor: hintEnab_(context)),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
              child: Text(data.content1[i].item2, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2)),
            ),
          ],
        ),
      );
      if(i!=data.content1.length-1) children.add(const SizedBox(height: Dimen.SIDE_MARG));
    }

    return Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Column(
        children: <Widget>[

          const TitleShortcutRowWidget(title: 'Elementy', textAlign: TextAlign.start, icon: MdiIcons.flare),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),

          const SizedBox(height: 2*Dimen.SIDE_MARG),

          const TitleShortcutRowWidget(title: 'Opis', icon: MdiIcons.textBoxOutline, textAlign: TextAlign.start),

          Padding(
            padding: const EdgeInsets.only(
              left: Dimen.ICON_MARG,
            ),
            child: Text(
                data.content2,
                style: AppTextStyle(
                    fontWeight: weight.normal,
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    height: 1.2
                )
            ),
          ),

        ],
      ),
    );
  }

}
