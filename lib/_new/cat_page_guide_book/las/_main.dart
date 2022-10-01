import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guide_book/las/search_page.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../details/app_settings.dart';
import 'common.dart';
import 'data.dart';

class LasFragment extends StatefulWidget{

  const LasFragment({super.key});

  @override
  State createState() => LasFragmentState();

}

class LasFragmentState extends State<LasFragment> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.las;

  static int? currentPage;
  static ValueNotifier<double>? _notifier;

  TabController? controller;

  @override
  void initState() {
    _notifier = ValueNotifier(0);

    controller = TabController(vsync: this, length: items.length);
    controller!.animation!.addListener(() => _notifier!.value = controller!.index + controller!.offset);

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
        body: DefaultTabController(
          length: items.length,
          child: ExtendedNestedScrollView(
            floatHeaderSlivers: true,
            pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: background_(context),
                title: const Text('Las'),
                centerTitle: true,
                floating: true,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(MdiIcons.magnify),
                    onPressed: () => pushPage(
                      context,
                      builder: (context) => SearchPage(
                        onItemTap: (index){
                          controller!.animateTo(index);
                          Navigator.pop(context);
                        },
                      )
                    ),
                  ),
                ],
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(),
                  controller: controller,
                  tabs: items.map((item) => Tab(text: item.name)).toList(),
                  isScrollable: true,
                ),
              ),
            ],

            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              children: items.map((item) => Item(
                items.indexOf(item),
                item,
                _notifier,
              )).toList(),

            ),

          ),
        )
    );

  }

}

class Item extends StatelessWidget{

  final int index;
  final ItemData data;
  final ValueNotifier<double>? notifier;

  const Item(this.index, this.data, this.notifier, {super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[

        const SizedBox(height: Dimen.SIDE_MARG),

        Text(
          data.name,
          style: AppTextStyle(
              fontWeight: weight.bold,
              fontSize: 24.0,
          ), textAlign: TextAlign.center
        ),

        AppCard(
          onTap: data.background.author==null?null:() => showAppToast(context, text: data.background.author??''),
          radius: AppCard.bigRadius,
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.all(Dimen.SIDE_MARG),
          elevation: AppCard.bigElevation,
          child: SizedBox(
            height: CARD_HEIGHT,
            child: AnimatedBuilder(
              animation: notifier!,
              builder: (context, child) =>
                  OverflowBox(
                      alignment: Alignment.center,
                      child: Transform.translate(
                          offset: Offset(MediaQuery.of(context).size.width*(notifier!.value - index)/6, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/leaf_bg/${data.background.path}.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                      )
                  ),
            ),
          ),
        ),

        if(data.background_kora!=null)
          AppCard(
            onTap: data.background_kora!.author==null?null:() => showAppToast(context, text: data.background_kora!.author??''),
            radius: AppCard.bigRadius,
            padding: EdgeInsets.zero,
              margin: const EdgeInsets.only(
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG,
                bottom: Dimen.SIDE_MARG
              ),
              elevation: AppCard.bigElevation,
            child: SizedBox(
              height: CARD_HEIGHT,
              child: AnimatedBuilder(
                animation: notifier!,
                builder: (context, child) =>
                    OverflowBox(
                        maxWidth: MediaQuery.of(context).size.width*1.2,
                        alignment: Alignment.center,
                        child: Transform.translate(
                            offset: Offset(MediaQuery.of(context).size.width*(notifier!.value - index)/6, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/leaf_kora/${data.background_kora!.path}.webp'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                        )
                    ),
              ),
            )
          ),

        TagWidget(data),

        Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              if(data.hasParams)
                TitleShortcutRowWidget(title: 'Właściwości drewna', textAlign: TextAlign.start, titleColor: hintEnab_(context)),

              if(data.hasParams)
                FirePropertyWidget(data),

              if(data.hasParams)
                const SizedBox(height: Dimen.SIDE_MARG),

              TitleShortcutRowWidget(title: 'Opis', textAlign: TextAlign.start, titleColor: hintEnab_(context)),

              const SizedBox(height: 10.0),
              Text(data.description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.1), textAlign: TextAlign.justify,),
              const SizedBox(height: Dimen.defMarg),
              Text(data.desc_source!=null?'Źródło: ${data.desc_source}':'', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: AppColors.text_hint_enab), textAlign: TextAlign.end,),

              SizedBox(
                height: 84 + 2*Dimen.defMarg,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, idx) => SimpleButton(
                    onTap: () => openDialog(
                            context: context,
                            builder: (context) => AppCard(
                                padding: EdgeInsets.zero,
                                margin: AppCard.normMargin,
                                color: AppSettings.isDark?const Color.fromARGB(255, 30, 30, 30):Colors.amber[50],
                                child: Column(
                                  children: [
                                    AppBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.0,
                                      title: Text(data.name),
                                      centerTitle: true,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: AppCard.defPadding,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Hero(
                                                tag: data.graphics[idx].path,
                                                child: Image.asset('assets/images/leaf/${data.graphics[idx].path}.webp', fit: BoxFit.contain),
                                              ),
                                            ),

                                            Positioned(
                                              bottom: Dimen.defMarg,
                                              right: Dimen.defMarg,
                                              child: AppText(
                                                data.graphics[idx].author??'',
                                                size: Dimen.TEXT_SIZE_SMALL,
                                                color: hintEnab_(context),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),

                    child: Hero(
                      tag: data.graphics[idx].path,
                      child: Image.asset(
                          'assets/images/leaf/${data.graphics[idx].path}.webp',
                          fit: BoxFit.contain,
                          width: 84, height: 84,
                          filterQuality: FilterQuality.none
                      ),
                    )
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.graphics.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, idx) => const SizedBox(width: 3*Dimen.defMarg),
                ),
              ),

            ],
          ),
        )
      ],
    );

  }

}
