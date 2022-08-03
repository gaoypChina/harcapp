import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_tile_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/shared_ranks_page.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/data/data_zhr_d.dart';
import 'package:harcapp/_new/cat_page_guide_book/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import '../../module_statistics_registrator.dart';
import 'data/data_zhp.dart';
import 'data/data_zhp_old.dart';
import 'data/data_zhr_c.dart';
import 'models_common/rank.dart';

class RankPage extends StatefulWidget {

  final Org org;

  const RankPage({required this.org, super.key});

  @override
  State<StatefulWidget> createState() => RankPageState();

}

class RankPageState extends State<RankPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.stopnie;

  @override
  Widget build(BuildContext context) {

    late int initIntex;
    if(widget.org == Org.zhp)
      initIntex = 0;
    if(widget.org == Org.zhr_d)
      initIntex = 2;
    if(widget.org == Org.zhr_c)
      initIntex = 3;
    else
      initIntex = 0;

    return BottomNavScaffold(
      body: DefaultTabController(
        length: 4,
        initialIndex: initIntex,
        child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

              SliverAppBar(
                forceElevated: innerBoxIsScrolled,
                floating: true,
                pinned: true,
                centerTitle: true,
                title: const Text('Stopnie'),
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(),
                  indicator: AppTabBarIncdicator(context: context),
                  tabs: [
                    Tab(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ZHP', style: AppTextStyle(fontWeight: weight.bold)),
                        Text('', style: AppTextStyle())
                      ],
                    )),
                    Tab(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ZHP', style: AppTextStyle(fontWeight: weight.bold)),
                        Text('stare', style: AppTextStyle())
                      ],
                    )),
                    Tab(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ZHR', style: AppTextStyle(fontWeight: weight.bold)),
                        Text('pł. piękna', style: AppTextStyle())
                      ],
                    )),
                    Tab(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ZHR', style: AppTextStyle(fontWeight: weight.bold)),
                        Text('pł. silna', style: AppTextStyle())
                      ],
                    )),

                  ],
                ),
              ),

              if(account)
                FloatingContainer(
                  builder: (context, __, _) => Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      elevation: AppCard.bigElevation,
                      borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                      child: TitleShortcutRowWidget(
                        title: 'Udostępnione stopnie',
                        onOpen: () => pushPage(context, builder: (context) => const SharedRanksPage()),
                      )
                    ),
                  ),
                  height: Dimen.ICON_FOOTPRINT + 2*Dimen.SIDE_MARG,
                )

            ],
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [

                ListView(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  physics: const BouncingScrollPhysics(),
                  children: [

                    const SizedBox(height: Dimen.SIDE_MARG),
                    Center(child: Text('Stopnie harcerskie ZHP', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context)))),
                    const SizedBox(height: Dimen.SIDE_MARG),

                    StopnieBookWidget(
                      org: Org.zhp,
                      male: true,
                      female: true,
                      newSim: true,
                      rankList: [
                        //STOP_ZHP_0,
                        rankZhp1,
                        rankZhp2,
                        rankZhp3,
                        rankZhp4,
                        rankZhp5,
                        rankZhp6
                      ],
                      onOpen: (context) => null,
                      tabTitle: (List<String> titles) => '${titles[0]} - ${titles[1]}',
                    ),
                  ],
                ),

                ListView(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  physics: const BouncingScrollPhysics(),
                  children: [

                    const SizedBox(height: Dimen.SIDE_MARG),
                    Center(child: Text('Stopnie zuchowe ZHP', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context)))),
                    const SizedBox(height: Dimen.SIDE_MARG),

                    StopnieBookWidget(
                      org: Org.zhp,
                      male: true,
                      female: true,
                      zuch: true,
                      newSim: false,
                      rankList: [
                        rankZhpOldZuch1,
                        rankZhpOldZuch2,
                        rankZhpOldZuch3
                      ],
                      onOpen: (context) => null,
                    ),

                    const SizedBox(height: 3*Dimen.SIDE_MARG),
                    Center(child: Text('Stopnie harcerskie ZHP', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context)))),
                    const SizedBox(height: Dimen.SIDE_MARG),

                    StopnieBookWidget(
                      org: Org.zhp,
                      male: true,
                      female: true,
                      newSim: false,
                      rankList: [
                        rankZhpOld0,
                        rankZhpOld1,
                        rankZhpOld2,
                        rankZhpOld3,
                        rankZhpOld4,
                        rankZhpOld5,
                        rankZhpOld6
                      ],
                      onOpen: (context) => null,
                      tabTitle: (List<String> titles) => '${titles[0]} - ${titles[1]}',
                    ),

                  ],
                ),

                ListView(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  physics: const BouncingScrollPhysics(),
                  children: [

                    const SizedBox(height: Dimen.SIDE_MARG),
                    Center(child: Text('Stopnie zuchenek ZHR', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context)))),
                    const SizedBox(height: Dimen.SIDE_MARG),

                    StopnieBookWidget(
                      org: Org.zhr_d,
                      female: true,
                      zuch: true,
                      rankList: [
                        rankZhrZuchD1,
                        rankZhrZuchD2,
                        rankZhrZuchD3
                      ],
                      onOpen: (context) => null,
                    ),

                    const SizedBox(height: 3*Dimen.SIDE_MARG),
                    Center(child: Text('Stopnie harcerek ZHR', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context)))),
                    const SizedBox(height: Dimen.SIDE_MARG),

                    StopnieBookWidget(
                      org: Org.zhr_d,
                      female: true,
                      rankList: [
                        rankZhrHarcD0,
                        rankZhrHarcD0W,
                        rankZhrHarcD0S,
                        rankZhrHarcD1,
                        rankZhrHarcD2,
                        rankZhrHarcD2S,
                        rankZhrHarcD3,
                        rankZhrHarcD3S,
                        rankZhrHarcD4,
                        rankZhrHarcD4S,
                        rankZhrHarcD5
                      ],
                      onOpen: (context) => null,
                    ),

                  ],
                ),

                ListView(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  physics: const BouncingScrollPhysics(),
                  children: [

                    const SizedBox(height: Dimen.SIDE_MARG),
                    Center(child: Text('Stopnie zuchów ZHR', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context)))),
                    const SizedBox(height: Dimen.SIDE_MARG),

                    StopnieBookWidget(
                      org: Org.zhr_c,
                      male: true,
                      zuch: true,
                      rankList: [
                        rankZhrZuchC1,
                        rankZhrZuchC2,
                        rankZhrZuchC3
                      ],
                      onOpen: (context) => null,
                    ),

                    const SizedBox(height: 3*Dimen.SIDE_MARG),
                    Center(child: Text('Stopnie harcerzy ZHR', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context)))),
                    const SizedBox(height: Dimen.SIDE_MARG),

                    StopnieBookWidget(
                      org: Org.zhr_c,
                      male: true,
                      rankList: [
                        rankZhrHarcC0,
                        rankZhrHarcC0S,
                        rankZhrHarcC1,
                        rankZhrHarcC2,
                        rankZhrHarcC3,
                        rankZhrHarcC4,
                        rankZhrHarcC5,
                      ],
                      onOpen: (context) => null,
                    ),

                  ],
                ),
              ],
            )
        ),
      ),
    );

  }

}

class StopnieBookWidget extends StatelessWidget{

  final Org org;
  final bool male;
  final bool female;
  final bool zuch;
  final bool newSim;
  final List<Rank> rankList;
  final void Function(BuildContext) onOpen;
  final String Function(List<String>)? tabTitle;

  const StopnieBookWidget({
    required this.org,
    this.male = false,
    this.female = false,
    this.zuch = false,
    this.newSim = false,
    required this.rankList,
    required this.onOpen,
    this.tabTitle,
    super.key});

  @override
  Widget build(BuildContext context) => Consumer<RankProv>(
      builder: (context, prov, child){

        List<Widget> stopNameWidgetList = [];

        for(Rank rank in rankList) {
          stopNameWidgetList.add(
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimen.SIDE_MARG/2),
                  child: RankTileWidget(rank: rank)
              )
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: stopNameWidgetList,
        );
      }
  );

}

class _PositionMark extends StatefulWidget{

  const _PositionMark(Key key): super(key: key);

  @override
  State<StatefulWidget> createState() => _PositionMarkState();

}

class _PositionMarkState extends State<_PositionMark>{
  @override
  Widget build(BuildContext context) => Container();
}