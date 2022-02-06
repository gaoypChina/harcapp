import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/patronite_support_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_progress_widget.dart';
import 'package:harcapp/_new/details/part_settings.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/_main.dart';
import 'package:harcapp/_new/cat_page_guide_book/slownik/_main.dart';
import 'package:harcapp/_new/cat_page_guide_book/strefa_instruktora/_main.dart';
import 'package:harcapp/_new/cat_page_guide_book/struktura_funkcje/_main.dart';
import 'package:harcapp/_new/cat_page_guide_book/symbolika/_main.dart';
import 'package:harcapp/_new/cat_page_guide_book/szyfry/_main.dart';
import 'package:harcapp/_new/cat_page_guide_book/znaki_patrolowe/_main.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../app_drawer.dart';
import '../cat_page.dart';
import '_sprawnosci/_main.dart';
import '_sprawnosci/models/spraw.dart';
import '_sprawnosci/spraw_folder_page/spraw_folder.dart';
import '_sprawnosci/spraw_folder_page/spraw_folders_page.dart';
import '_sprawnosci/spraw_grid_page.dart';
import '_sprawnosci/spraw_icon.dart';
import '_sprawnosci/spraw_widget_small.dart';
import '_sprawnosci/widgets/spraw_tile_widget.dart';
import '_stopnie/_main.dart';
import '_stopnie/models_common/rank.dart';
import '_stopnie/rank_tile_widget.dart';
import '_stopnie/rank_tile_widget_template.dart';
import 'biografie/_main.dart';
import 'chwyty/_main.dart';
import 'dokumenty/_main.dart';
import 'historia/_main.dart';
import 'kuchnia_harcerska/_main.dart';
import 'las/_main.dart';
import 'musztra/_main.dart';
import 'okrzyki/_main.dart';

class CatPageGuideBook extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => CatPageGuideBookState();

}

class CatPageGuideBookState extends CatPageState<CatPageGuideBook>{

  static const double CAT_SEPARATOR = 28;

  @override
  ColorPack get colorPack => ColorPackGuideBook();

  static const Color MUSIC_CAT_COLOR = Colors.orange;
  static const Color MUSIC_CAT_INSTR = Colors.lightBlueAccent;
  static const Color MUSIC_CAT_WIEDZA = Colors.pink;
  static const Color MUSIC_CAT_HISTORIA = Colors.amber;
  static const Color MUSIC_CAT_TECHNIKI = Colors.teal;

  SynchronizerListener syncListener;

  @override
  void initState() {

    syncListener = SynchronizerListener(
      onEnd: (oper){
        if(oper == SyncOper.GET){
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
    body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          automaticallyImplyLeading: false,
          leading: AccountHeaderIcon(),
          backgroundColor: background_(context),
          title: Text('Poradnik i rozwój'),
          centerTitle: true,
          floating: true,
          actions: [SizedBox(width: Dimen.ICON_FOOTPRINT)],
        ),

        SliverList(
            delegate: SliverChildListDelegate([
              LatestStopWidget(
                padding: EdgeInsets.only(
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.SIDE_MARG
                )
              ),
            ])
        ),

        SliverPadding(
          padding: EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(
            delegate: SliverChildListDelegate([

              GradientWidget(
                colorStart: cardEnab_(context),
                colorEnd: background_(context),
                radius: AppCard.BIG_RADIUS,
                child: _SprawnosciWidget()
              ),

              SizedBox(height: Dimen.SIDE_MARG),

              SizedBox(height: Dimen.SIDE_MARG),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.translate,
                      'Słownik harcerski',
                      color: Colors.deepPurpleAccent,
                      pageBuilder: (context) => SlownikFragment()
                  )
              ),

              SizedBox(height: CAT_SEPARATOR),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.guitarPickOutline,
                      'Chwyty',
                      color: MUSIC_CAT_COLOR,
                      pageBuilder: (context) => ChwytyFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.microphoneOutline,
                      'Okrzyki',
                      color: MUSIC_CAT_COLOR,
                      pageBuilder: (context) => OkrzykiFragment()
                  )
              ),

              SizedBox(height: CAT_SEPARATOR),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.flagOutline,
                      'Strefa instruktora',
                      color: MUSIC_CAT_INSTR,
                      pageBuilder: (context) => StrefaInstruktoraFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.textBoxCheckOutline,
                      'Dokumenty',
                      color: MUSIC_CAT_INSTR,
                      pageBuilder: (context) => DokumentyFragment()
                  )
              ),

              SizedBox(height: CAT_SEPARATOR),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.compassOutline,
                      'Prawo i Przyrzeczenie',
                      color: MUSIC_CAT_WIEDZA,
                      pageBuilder: (context) => PrawoPrzyrzeczenieFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.transitConnection,
                      'Struktura i funkcje',
                      color: MUSIC_CAT_WIEDZA,
                      pageBuilder: (context) => StrukturaFunkcjeFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.starOutline,
                      'Symbolika',
                      color: MUSIC_CAT_WIEDZA,
                      pageBuilder: (context) => SymbolikaFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.flagTriangle,
                      'Musztra',
                      color: MUSIC_CAT_WIEDZA,
                      pageBuilder: (context) => MusztraFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.lockOutline,
                      'Szyfry',
                      color: MUSIC_CAT_WIEDZA,
                      pageBuilder: (context) => SzyfryFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.mapMarkerPath,
                      'Znaki patrolowe',
                      color: MUSIC_CAT_WIEDZA,
                      pageBuilder: (context) => ZnakiPatroloweFragment()
                  )
              ),

              SizedBox(height: CAT_SEPARATOR),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.timerSand,
                      'Historia',
                      color: MUSIC_CAT_HISTORIA,
                      pageBuilder: (context) => HistoriaFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.accountBoxOutline,
                      'Biografie',
                      color: MUSIC_CAT_HISTORIA,
                      pageBuilder: (context) => BiografieFragment()
                  )
              ),

              SizedBox(height: CAT_SEPARATOR),

              _ItemWidget(
                  data: ItemData(
                      MdiIcons.treeOutline,
                      'Las',
                      color: MUSIC_CAT_TECHNIKI,
                      pageBuilder: (context) => LasFragment()
                  )
              ),

              _ItemWidget(
                  data: ItemData(
                      Icons.restaurant_menu,
                      'Kuchnia harcerska',
                      color: MUSIC_CAT_TECHNIKI,
                      pageBuilder: (context) => KuchniaHarcerskaFragment()
                  )
              ),

              PatroniteSupportWidget(
                stateTag: PatroniteSupportWidget.tagGuideBook,
                title: 'Potrzeba wsparcia!',
                description: 'HarcAppka powstaje <b>po godzinach</b>, jest <b>darmowa</b> dla wszystkich i <b>nie ma reklam</b>.\n'
                    '\n'
                    'Jej ciągły rozwój i darmowy dostęp możliwy jest dzięki <b>wsparciu</b> harcerzy, instruktorów i rodziców - <b>takich jak Ty</b>!\n'
                    '\n'
                    'Wiele od Ciebie zależy! <b>c:</b>',
                expandable: false,
              )
            ]),
          ),
        )

      ],
    ),
    bottomNavigationBar: AppBottomNavigator(),
  );

}

class ItemData{

  final IconData icon;
  final String title;
  final Color color;
  final Widget Function(BuildContext context) pageBuilder;

  const ItemData(this.icon, this.title, {@required this.color, @required this.pageBuilder});

}

class _ItemWidget extends StatelessWidget{

  final ItemData data;

  const _ItemWidget({@required this.data});

  @override
  Widget build(BuildContext context) => ListTile(
    shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppCard.BIG_RADIUS))),
    leading: Icon(data.icon, color: accent_(context)),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: data.pageBuilder)),
    title: Text(
      data.title,
      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: textEnab_(context)),
    ),
  );

}


class _SprawnosciWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TitleShortcutRowWidget(
        title: 'Sprawności',
        onOpen: (context) => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SprawnosciPage())
        ),
      ),

      Consumer2<SprawInProgressListProv, SprawCompletedListProv>(
        builder: (context, inProgProv, complProv, child){

          String keyVal = '';
          for(String uid in Spraw.inProgressList) keyVal += uid;
          for(String uid in Spraw.completedList) keyVal += uid;

          return SprawProgressWidget(
            key: ValueKey(keyVal),
            backgroundIcon: true,
            showIcons: true,
            onOpen: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SprawFoldersPage())),
          );
        },
      ),

      Row(
        children: [
          Expanded(
            child: SimpleButton.from(
              context: context,
              direction: Axis.vertical,
              margin: EdgeInsets.zero,
              icon: SprawFolder.omegaFolderIcon,
              text: 'Foldery',
              onTap: () => pushPage(context, builder: (context) => SprawFoldersPage()),
            ),
          ),
          Expanded(
            child: SimpleButton.from(
                context: context,
                direction: Axis.vertical,
                margin: EdgeInsets.zero,
                icon: SprawTileWidget.ICON_IN_PROGRESS,
                text: 'W trakcie',
                onTap: () =>
                Spraw.inProgressList.isEmpty?
                showAppToast(context, text: 'Wieje pustką...'):
                pushPage(context, builder: (context) => Consumer<SprawInProgressListProv>(
                  builder: (context, prov, child) => SprawGridPage(
                    key: ValueKey(Spraw.inProgressList),
                    title: 'Realizowane sprawności',
                    UIDs: Spraw.inProgressList,
                    icon: SprawTileWidget.ICON_IN_PROGRESS,
                    mode: SprawWidgetSmall.MODE_IN_PROGRESS,
                  ),
                ))
            ),
          ),
          Expanded(
            child: SimpleButton.from(
                context: context,
                direction: Axis.vertical,
                margin: EdgeInsets.zero,
                icon: SprawTileWidget.ICON_COMPLETED,
                text: 'Zdobyte',
                onTap: () => Spraw.completedList.isEmpty?
                showAppToast(context, text: 'Wciąż żadnych osiągnięć...'):
                pushPage(context, builder: (context) => Consumer<SprawCompletedListProv>(
                  builder: (context, prov, child) => SprawGridPage(
                    key: ValueKey(Spraw.completedList),
                    title: 'Zdobyte sprawności',
                    UIDs: Spraw.completedList,
                    icon: SprawTileWidget.ICON_COMPLETED,
                    mode: SprawWidgetSmall.MODE_COMPLETE,
                  ),
                ))
            ),
          )
        ],
      )
    ],
  );

}

class LatestStopWidget extends StatefulWidget{

  final EdgeInsets padding;

  const LatestStopWidget({this.padding = EdgeInsets.zero});

  @override
  State<StatefulWidget> createState() => LatestStopWidgetState();

}

class LatestStopWidgetState extends State<LatestStopWidget>{

  SynchronizerListener _listener;

  @override
  void initState() {
    _listener = SynchronizerListener(
      onEnd: (oper){
        if(oper != SyncOper.GET) return;
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
  Widget build(BuildContext context) => Consumer<RankProv>(
      builder: (context, prov, child){

        Rank lastStopZHP;
        Rank lastStopZHRC;
        Rank lastStopZHRD;

        Org org = OrgManager.current;
        int index;

        if(org == Org.zhp)
          index = 0;
        else if (org == Org.zhr_c)
          index = 1;
        else if (org == Org.zhr_d)
          index = 2;

        lastStopZHP = Rank.last(Org.zhp, zuch: false, newSim: true);
        if(lastStopZHP == null)
          lastStopZHP = Rank.last(Org.zhp, zuch: true, newSim: true);
        if(lastStopZHP == null)
          lastStopZHP = Rank.last(Org.zhp, zuch: false, newSim: false);
        if(lastStopZHP == null)
          lastStopZHP = Rank.last(Org.zhp, zuch: true, newSim: false);

        lastStopZHRC = Rank.last(Org.zhr_c, zuch: false);
        if(lastStopZHRC == null)
          lastStopZHRC = Rank.last(Org.zhr_c, zuch: true);

        lastStopZHRD = Rank.last(Org.zhr_d, zuch: false);
        if(lastStopZHRD == null)
          lastStopZHRD = Rank.last(Org.zhr_d, zuch: true);

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
                leading: OrgSwitcher(
                  allowedOrgs: [Org.zhp, Org.zhr_c, Org.zhr_d],
                  longPressable: false,
                  onTap: (Org org) => setState(() => OrgManager.current = org),
                ),
                trailing: SizedBox(width: OrgSwitcher.width - Dimen.ICON_FOOTPRINT),
                onOpen: (context) => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StopniePage(org: OrgManager.current))
                ),
              ),
            ),

            SizedBox(height: Dimen.DEF_MARG),

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

  static const double height = 76.0;

  final Org org;
  final Rank rank;

  const StopPrevItem(this.org, this.rank);

  @override
  Widget build(BuildContext context) {

    if(rank != null){
      return SizedBox(
        height: height,
        child: RankTileWidget(rank: rank),
      );
    }

    RankColors colors;
    if(org == Org.zhp) colors = RankData.colorsZhp;
    else if(org == Org.zhr_c) colors = RankData.colorsZhrC;
    else if(org == Org.zhr_d) colors = RankData.colorsZhrD;
    else colors = RankData.colorsZhpOld;

    return SimpleButton(
        radius: AppCard.BIG_RADIUS,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        child: Row(
          children: [

            SizedBox(
              width: RankTileWidgetTemplate.leadingWidth,
              child: AspectRatio(
                aspectRatio: RankTileWidgetTemplate.leadingAspectRatio,
                child: GradientWidget(
                  radius: AppCard.BIG_RADIUS,
                  elevation: AppCard.bigElevation,
                  colorStart: colors.start(Settings.isDark),
                  colorEnd: colors.end(Settings.isDark),
                  child: Icon(
                      MdiIcons.bookOpenOutline,
                      size: RankTileWidgetTemplate.DEF_TILE_ICON_SIZE
                  ),
                ),
              ),
            ),

            SizedBox(width: Dimen.SIDE_MARG),

            Expanded(
              child: Text(
                'Przeglądaj stopnie',
                style: AppTextStyle(
                    fontWeight: weight.bold,
                    color: hintEnab_(context),
                    fontSize: Dimen.TEXT_SIZE_APPBAR
                ),
              ),
            ),

          ],
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StopniePage(org: org))
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
  final int detailsIndex;
  final bool clickable;
  final void Function() onTap;

  const SprawModeButton({
    @required this.title,
    @required this.emptyMessage,
    @required this.mode,
    @required this.getUIDs,
    this.showIcons = true,
    @required this.icon,
    this.detailsIndex,
    this.clickable=true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    assert(!clickable || detailsIndex != null);

    return Hero(
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
                      padding: EdgeInsets.all(16.0),
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
                      padding: EdgeInsets.all(Dimen.ICON_MARG),
                      crossAxisSpacing: Dimen.ICON_MARG,
                      mainAxisSpacing: Dimen.ICON_MARG,
                      crossAxisCount: children.length>6?3:2,
                      physics: NeverScrollableScrollPhysics(),
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

}
