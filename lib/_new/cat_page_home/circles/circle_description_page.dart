import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../_common_widgets/app_toast.dart';
import '../competitions/indiv_comp/indiv_comp_basic_data_tile.dart';
import 'circle_binded_indiv_comp_page.dart';
import 'circle_page.dart';
import 'cover_image.dart';
import 'model/circle.dart';

class CircleDescriptionPage extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  final void Function()? onLeft;
  final void Function()? onDeleted;

  const CircleDescriptionPage(this.circle, this.palette, {this.onLeft, this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => CircleDescriptionPageState();

}

class CircleDescriptionPageState extends State<CircleDescriptionPage>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;

  void Function()? get onLeft => widget.onLeft;
  void Function()? get onDeleted => widget.onDeleted;

  late ScrollController scrollController;

  late GlobalKey appBarKey;

  late AppBarProvider appBarProv;

  @override
  void initState() {

    appBarKey = GlobalKey();

    scrollController = ScrollController();
    scrollController.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;
      final appBarBox = appBarKey.currentContext?.findRenderObject() as RenderBox?;
      double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (appBarPos < kToolbarHeight && !appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = true;
      else if(appBarPos >= kToolbarHeight && appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = false;

      if (appBarPos < 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;
      else if(appBarPos >= 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;

    });

    super.initState();
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }

  void notifyScrollController() => post(() => scrollController.jumpTo(scrollController.offset + 1e-10));

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CirclePage.backgroundColor(context, palette),
    appBottomNavColor: CirclePage.backgroundColor(context, palette),
    body: ChangeNotifierProvider(
      create: (context){
        appBarProv = AppBarProvider();
        return appBarProv;
      },
      builder: (context, child) => CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [

            Consumer<AppBarProvider>(
              builder: (context, prov, child) => SliverAppBar(
                iconTheme: IconThemeData(
                    color:
                    prov.coverVisible?
                    CirclePage.coverIconColor(context, palette):
                    iconEnab_(context)
                ),
                centerTitle: true,
                pinned: true,
                excludeHeaderSemantics: true,
                elevation: prov.elevated?AppCard.bigElevation:0,
                backgroundColor: CirclePage.backgroundColor(context, palette),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      opacity: prov.showTitleOnAppBar?1:0,
                      duration: Duration(milliseconds: prov.showTitleOnAppBar?200:0),
                      child: Text(
                        circle.name,
                        style: AppTextStyle(
                            color: iconEnab_(context)
                        ),
                        maxLines: 1,
                      ),
                    ),
                    centerTitle: true,
                    background: Hero(
                      tag: CirclePageState.circleCoverTag,
                      child: CoverImage(circle.coverImage),
                    )
                ),
              ),
            ),

            SliverList(delegate: SliverChildListDelegate([

              Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG,
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    bottom: Dimen.SIDE_MARG,
                  ),
                  child: Hero(
                      tag: CirclePageState.circleNameTag,
                      child: Material(
                        color: Colors.transparent,
                        child: Row(
                          children: [

                            Expanded(
                              child:  Text(
                                circle.name,
                                style: AppTextStyle(
                                    fontSize: 28.0,
                                    fontWeight: weight.bold
                                ),
                                key: appBarKey,
                              ),
                            ),

                            IconButton(
                              icon: const Icon(MdiIcons.chevronUp),
                              onPressed: () => popPage(context),
                            )

                          ],
                        ),
                      )
                  )
              ),

              if(circle.hasDescription)
                Padding(
                  padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG - TitleShortcutRowWidget.textStartPadding,
                  ),
                  child: TitleShortcutRowWidget(
                    title: 'Opis',
                    titleColor: hintEnab_(context),
                    textAlign: TextAlign.start,
                  ),
                ),

              if(circle.hasDescription)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                    child: ExpandableText(
                      circle.description!,
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
                      maxLines: 3,
                      animation: true,
                      linkColor: CirclePage.strongColor(context, palette),
                      linkStyle: AppTextStyle(fontWeight: weight.halfBold),
                      expandText: 'więcej',
                      collapseText: 'mniej',
                    )
                ),

              Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG,
                    left: Dimen.SIDE_MARG - TitleShortcutRowWidget.textStartPadding,
                    right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                  ),
                  child: TitleShortcutRowWidget(
                    title: 'Powiązane współzawod.',
                    textAlign: TextAlign.start,
                    titleColor: hintEnab_(context),
                    trailing:
                    circle.myRole == CircleRole.ADMIN?
                    IconButton(
                      icon: const Icon(MdiIcons.dotsHorizontal),
                      onPressed: () => pushPage(
                          context,
                          builder: (context) => CircleBindedIndivCompPage(
                            circle, palette
                          )
                      ),
                    ):
                    null,
                  ),
              ),

              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  String indivCompKey = circle.bindedIndivComps[index].key;
                  if(IndivComp.allMap![indivCompKey] == null)
                    return IndivCompBasicDataTile(
                      circle.bindedIndivComps[index],
                      bottomText: 'Nie jesteś uczestnikiem',
                      bottomTextColor: CirclePage.strongColor(context, palette),
                      onTap: (_) => showAppToast(context, text: 'Aby dołączyć, odezwij się do administratora współzawodnictwa'),
                    );

                  return Consumer<IndivCompProvider>(
                    builder: (context, prov, child) => IndivCompTile(
                      IndivComp.allMap![indivCompKey]!,
                      participBorderColor: CirclePage.cardColor(context, palette),
                      participBackgroundColor: CirclePage.backgroundColor(context, palette),
                      onTap: (comp){
                        CatPageHomeState.openCompPage(context, comp);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                itemCount: circle.bindedIndivComps.length,
                shrinkWrap: true,
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

            ]))

          ]
      )
    ),
  );


}