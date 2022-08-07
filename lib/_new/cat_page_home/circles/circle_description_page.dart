import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/providers.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../_common_widgets/app_toast.dart';
import '../community/common/community_cover_colors.dart';
import '../competitions/indiv_comp/indiv_comp_basic_data_tile.dart';
import '../competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'circle_binded_indiv_comp_page.dart';
import 'circle_page.dart';
import '../cover_image.dart';
import 'model/circle.dart';
import 'model/member.dart';

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

      if (appBarPos < 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;
      else if(appBarPos >= 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;

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
    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
    appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
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
                    CommunityCoverColors.coverIconColor(context, palette):
                    iconEnab_(context)
                ),
                centerTitle: true,
                pinned: true,
                excludeHeaderSemantics: true,
                elevation: prov.elevated?AppCard.bigElevation:0,
                backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
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
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.none,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: CoverImage(circle.coverImage),
                            ),

                            Positioned(
                              left: Dimen.SIDE_MARG,
                              bottom: 0,
                              child: Material(
                                borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                                clipBehavior: Clip.hardEdge,
                                color: CommunityCoverColors.cardColor(context, palette),
                                child: Padding(
                                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                                  child: Icon(
                                    CommonIconData.ALL[circle.community.iconKey],
                                    size: 48.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),

                ),
              ),
            ),

            SliverList(delegate: SliverChildListDelegate([

              Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
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
                      maxLines: 8,
                      animation: true,
                      linkColor: CommunityCoverColors.strongColor(context, palette),
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

              Consumer<BindedIndivCompsProvider>(
                    builder: (context, prov, child) =>
                    circle.bindedIndivComps.isEmpty?
                    Padding(
                      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                      child: Text(
                        'Brak powiązanych współzawodnictw',
                        style: AppTextStyle(
                          color: hintEnab_(context),
                          fontSize: Dimen.TEXT_SIZE_BIG,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ):
                    Container()
                ),

              Consumer<BindedIndivCompsProvider>(
                builder: (context, prov, child) => ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => BindedIndivCompTile(
                    circle,
                    circle.bindedIndivComps[index],
                    palette: palette
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                  itemCount: circle.bindedIndivComps.length,
                  shrinkWrap: true,
                ),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

            ]))

          ]
      )
    ),
  );


}

class BindedIndivCompTile extends StatelessWidget{

  final Circle circle;
  final IndivCompBasicData indivCompBasicData;
  final PaletteGenerator? palette;

  const BindedIndivCompTile(this.circle, this.indivCompBasicData, {this.palette, super.key});

  @override
  Widget build(BuildContext context) {

    IndivComp? indivComp = IndivComp.allMap![indivCompBasicData.key];

    List<UserData> inCircleNotInComp = [];
    List<UserData> inCompNotInCircle = [];

    if(indivComp != null) {
      for (IndivCompParticip particip in indivComp.particips) {
        Member? member = circle.membersMap[particip.key];
        if (member == null)
          inCompNotInCircle.add(particip.toUserData());
      }

      for (Member member in circle.members) {
        IndivCompParticip? particip = indivComp.participMap[member.key];
        if (particip == null)
          inCircleNotInComp.add(member.toUserData());
      }

    }

    if(IndivComp.allMap![indivCompBasicData.key] == null)
      return IndivCompBasicDataTile(
        indivCompBasicData,
        bottomText: 'Nie jesteś uczestnikiem',
        bottomTextColor: CommunityCoverColors.strongColor(context, palette),
        onTap: (_) => showAppToast(context, text: 'Aby dołączyć, odezwij się do administratora współzawodnictwa'),
      );

    Widget tileWidget = Consumer<IndivCompProvider>(
      builder: (context, prov, child) => IndivCompTile(
        IndivComp.allMap![indivCompBasicData.key]!,
        participBorderColor: CommunityCoverColors.cardColor(context, palette),
        participBackgroundColor: CommunityCoverColors.backgroundColor(context, palette),
        onTap: (comp) => CatPageHomeState.openCompPage(context, comp),
      ),
    );

    if(inCompNotInCircle.isEmpty && inCircleNotInComp.isEmpty)
      return tileWidget;

    String noOfPeople(int peopleCount){
      if(peopleCount == 1)
        return '$peopleCount osoba';
      else
        return '$peopleCount osób';
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundIcon_(context),
        borderRadius: BorderRadius.circular(IndivCompThumbnailWidget.defSize * IndivCompThumbnailWidget.outerRadiusSizeFactor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          tileWidget,

          SimpleButton(
            margin: const EdgeInsets.all(Dimen.ICON_MARG/2),
            padding: const EdgeInsets.all(Dimen.ICON_MARG/2),
            radius: AppCard.BIG_RADIUS,
            onTap: () => openMissingBottomSheet(context, inCompNotInCircle, inCircleNotInComp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                AppText(
                  '<b>${noOfPeople(inCompNotInCircle.length)}</b> ze współzawod. brakuje w kręgu!',
                ),
                const SizedBox(height: Dimen.DEF_MARG),
                AppText(
                  '<b>${noOfPeople(inCircleNotInComp.length)}</b> z kręgu brakuje w współzawod.!',
                ),

              ],
            ),
          ),

        ],
      ),
    );

  }

  void openMissingBottomSheet(
      BuildContext context,
      List<UserData> inCompNotInCircle,
      List<UserData> inCircleNotInComp
  ) => showScrollBottomSheet(
    context: context, builder: (context) => BottomSheetDef(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          if(inCompNotInCircle.isNotEmpty)
            const SizedBox(height: Dimen.ICON_MARG),

          if(inCompNotInCircle.isNotEmpty)
            Text(
              'Lista brakujących w kręgu',
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold
              ),
              textAlign: TextAlign.center,
            ),

          if(inCompNotInCircle.isNotEmpty)
            const SizedBox(height: Dimen.ICON_MARG),

          if(inCompNotInCircle.isNotEmpty)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: inCompNotInCircle.length,
              itemBuilder: (context, index) => AccountTile(inCompNotInCircle[index].name)
            ),

          if(inCircleNotInComp.isNotEmpty)
            const SizedBox(height: 2*Dimen.BOTTOM_SHEET_MARG),

          if(inCircleNotInComp.isNotEmpty)
            Text(
              'Lista brakujących we współzawod.',
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                  fontWeight: weight.halfBold
              ),
              textAlign: TextAlign.center,
            ),

          if(inCircleNotInComp.isNotEmpty)
            const SizedBox(height: Dimen.ICON_MARG),

          if(inCircleNotInComp.isNotEmpty)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: inCircleNotInComp.length,
              itemBuilder: (context, index) => AccountTile(inCircleNotInComp[index].name)
            ),

        ],
      )
  ));

}

