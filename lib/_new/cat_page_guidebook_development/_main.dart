import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../_common_classes/org/org_switcher.dart';
import '../app_drawer.dart';
import 'development/_main.dart';
import 'development/_sprawnosci/models/spraw.dart';
import 'development/_sprawnosci/spraw_icon.dart';
import 'development/stopnie/_main.dart';
import 'development/stopnie/models_common/rank.dart';
import 'development/stopnie/rank_tile_widget.dart';
import 'development/stopnie/rank_tile_widget_template.dart';
import 'guidebook/_main.dart';

class CatPageGuidebookDevelopment extends StatefulWidget{

  const CatPageGuidebookDevelopment({super.key});

  @override
  State createState() => CatPageGuidebookDevelopmentState();

}

class CatPageGuidebookDevelopmentState extends State<CatPageGuidebookDevelopment> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) =>
      post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackGuideBook());

  static const double catSeparator = 28;

  static const Color musicCatColor = Colors.orange;
  static const Color musicCatIntr = Colors.lightBlueAccent;
  static const Color musicCatWiedza = Colors.pink;
  static const Color musicCatHistoria = Colors.amber;
  static const Color musicCatTechniki = Colors.teal;

  SynchronizerListener? syncListener;

  @override
  void initState() {

    syncListener = SynchronizerListener(
      onEnd: (oper){
        if(oper == SyncOper.get){
          Provider.of<SprawInProgressListProv>(context, listen: false).notify();
          Provider.of<SprawCompletedListProv>(context, listen: false).notify();
          Provider.of<SprawSavedListProv>(context, listen: false).notify();
        }
      }
    );
    synchronizer.addListener(syncListener);

    super.initState();
  }

  @override
  void dispose() {
    synchronizer.removeListener(syncListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: const AccountHeaderIcon(),
            backgroundColor: background_(context),
            title: const Text('Poradnik i rozwój'),
            centerTitle: true,
            floating: true,
            pinned: true,
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              indicator: AppTabBarIncdicator(context: context, color: iconEnab_(context)),
              tabs: const [
                Tab(text: 'Poradnik'),
                Tab(text: 'Rozwój'),
              ],
            ),
          ),

        ],
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [

            GuidebookSubpage(),
            DevelopmentSubpage(),

          ],
        ),

      ),
    ),
    bottomNavigationBar: const AppBottomNavigator(),
  );

}

class ItemData{

  final IconData icon;
  final String title;
  final Color color;
  final Widget Function(BuildContext context) pageBuilder;

  const ItemData(this.icon, this.title, {required this.color, required this.pageBuilder});

}

class LatestStopWidget extends StatefulWidget{

  final EdgeInsets padding;

  const LatestStopWidget({this.padding = EdgeInsets.zero, super.key});

  @override
  State<StatefulWidget> createState() => LatestStopWidgetState();

}

class LatestStopWidgetState extends State<LatestStopWidget>{

  SynchronizerListener? _listener;

  @override
  void initState() {
    _listener = SynchronizerListener(
      onEnd: (oper){
        if(oper != SyncOper.get) return;
        Provider.of<RankProv>(context, listen: false).notify();
      }
    );
    synchronizer.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    synchronizer.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer2<RankProv, OrgProvider>(
      builder: (context, rankProv, orgProv, child){

        Rank? lastStopZHP;
        Rank? lastStopZHRC;
        Rank? lastStopZHRD;

        Org org = orgProv.current;
        int index;

        if(org == Org.zhp)
          index = 0;
        else if (org == Org.zhr_c)
          index = 1;
        else if (org == Org.zhr_d)
          index = 2;
        else
          index = 0;

        lastStopZHP =
            Rank.last(Org.zhp, zuch: false, newSim: true)??
            Rank.last(Org.zhp, zuch: true, newSim: true)??
            Rank.last(Org.zhp, zuch: false, newSim: false)??
            Rank.last(Org.zhp, zuch: true, newSim: false);

        lastStopZHRC = Rank.last(Org.zhr_c, zuch: false)??
            Rank.last(Org.zhr_c, zuch: true);

        lastStopZHRD = Rank.last(Org.zhr_d, zuch: false)??
            Rank.last(Org.zhr_d, zuch: true);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: EdgeInsets.only(
                top: widget.padding.top,
                left: widget.padding.left,
                right: widget.padding.right
              ),
              child: TitleShortcutRowWidget(
                title: 'Stopnie',
                trailing: const OrgSwitcher(
                  allowedOrgs: [Org.zhp, Org.zhr_c, Org.zhr_d],
                  longPressable: false,
                ),
                textAlign: TextAlign.start,
                onOpen: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RankPage(org: orgProv.current))
                ),
              ),
            ),

            const SizedBox(height: Dimen.defMarg),

            AnimatedChildSlider(
              index: index,
              direction: Axis.horizontal,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.padding.left,
                    right: widget.padding.right,
                    bottom: widget.padding.bottom,
                  ),
                  child: StopPrevItem(Org.zhp, lastStopZHP),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.padding.left,
                    right: widget.padding.right,
                    bottom: widget.padding.bottom,
                  ),
                  child: StopPrevItem(Org.zhr_c, lastStopZHRC),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.padding.left,
                    right: widget.padding.right,
                    bottom: widget.padding.bottom,
                  ),
                  child: StopPrevItem(Org.zhr_d, lastStopZHRD),
                ),
              ],
            )

          ],
        );

      }
  );

}

class StopPrevItem extends StatelessWidget{

  final Org org;
  final Rank? rank;

  const StopPrevItem(this.org, this.rank, {super.key});

  @override
  Widget build(BuildContext context) {

    if(rank != null)
      return RankTileWidget<Rank>(rank: rank!);

    RankColors colors;
    if(org == Org.zhp) colors = RankData.colorsZhp;
    else if(org == Org.zhr_c) colors = RankData.colorsZhrC;
    else if(org == Org.zhr_d) colors = RankData.colorsZhrD;
    else colors = RankData.colorsZhpOld;

    return SimpleButton(
        radius: AppCard.bigRadius,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        color: backgroundIcon_(context),
        clipBehavior: Clip.none,
        child: Row(
          children: [

            const SizedBox(width: Dimen.ICON_MARG),

            SizedBox(
              height: 64,
              width: RankTileWidgetTemplate.leadingWidth,
              child: AspectRatio(
                aspectRatio: RankTileWidgetTemplate.leadingAspectRatio,
                child: Icon(
                    MdiIcons.bookOpenPageVariantOutline,
                    color: iconEnab_(context),
                    size: RankTileWidgetTemplate.defTileIconSize
                ),
              ),
            ),

            const SizedBox(width: Dimen.ICON_MARG),

            Expanded(
              child: Text(
                'Przeglądaj stopnie',
                style: AppTextStyle(
                    color: iconEnab_(context),
                    fontSize: Dimen.TEXT_SIZE_APPBAR
                ),
              ),
            ),

          ],
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RankPage(org: org))
        )
    );

  }

}

class SprawModeButton<T extends ChangeNotifier> extends StatelessWidget{

  final String title;
  final String emptyMessage;
  final String mode;
  final List<String> Function() getUIDs;
  final bool showIcons;
  final IconData icon;
  final int? detailsIndex;
  final bool clickable;
  final void Function()? onTap;

  const SprawModeButton({
    required this.title,
    required this.emptyMessage,
    required this.mode,
    required this.getUIDs,
    this.showIcons = true,
    required this.icon,
    this.detailsIndex,
    this.clickable=true,
    this.onTap,
    super.key
  }): assert(!clickable || detailsIndex != null);

  @override
  Widget build(BuildContext context) => Hero(
    tag: icon,
    child: Consumer<T>(
        builder: (context, prov, child){

          List<String> UIDs = getUIDs();

          List<Widget> children = [];
          for(int i=0; i<UIDs.length; i++)
            children.add(Center(
              child: SprawIcon(Spraw.fromUID(UIDs[i])),
            ));

          return Stack(
            clipBehavior: Clip.none,
            children: [

              Center(
                child: Icon(icon, color: backgroundIcon_(context), size: MediaQuery.of(context).size.shortestSide/3),
              ),

              if(showIcons)
                SizedBox(
                  height: 2*Dimen.ICON_MARG + 3*SprawIcon.sizeSmall,
                  child:
                  children.isEmpty?
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: AutoSizeText(
                        'Pusto',
                        style: AppTextStyle(
                            fontSize: 32.0,
                            fontWeight: weight.halfBold,
                            color: hintEnab_(context)
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ):
                  GridView.count(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    crossAxisSpacing: Dimen.ICON_MARG,
                    mainAxisSpacing: Dimen.ICON_MARG,
                    crossAxisCount: children.length>6?3:2,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: children,
                    //clipBehavior: Clip.none,
                  ),
                ),

            ],
          );
        }
    ),
  );

}
