import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/org/org_handler.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_shared_previews_loader.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_widget_small.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/providers.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '_sprawnosci/_main.dart';
import '_sprawnosci/models/spraw.dart';
import '_sprawnosci/spraw_folder_page/spraw_folder.dart';
import '_sprawnosci/spraw_folder_page/spraw_folders_page.dart';
import '_sprawnosci/spraw_widget_small.dart';
import 'stopnie/_main.dart';
import 'stopnie/models_common/rank.dart';
import 'stopnie/rank_tile_widget.dart';
import 'stopnie/rank_tile_widget_template.dart';

class DevelopmentSubpage extends StatefulWidget{

  const DevelopmentSubpage({super.key});

  @override
  State createState() => DevelopmentSubpageState();

}

class DevelopmentSubpageState extends State<DevelopmentSubpage>{

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
  Widget build(BuildContext context) => CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [

      SliverList(
          delegate: SliverChildListDelegate([

            Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: BorderMaterial(
                  child: Consumer<RankProv>(
                    builder: (context, prov, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        TitleShortcutRowWidget(
                          title: 'Stopnie',
                          textAlign: TextAlign.start,
                          onOpen: () => pushPage(
                              context,
                              builder: (context) => RankPage(org: OrgHandler.current)
                          ),
                        ),

                        if(Rank.lastEdited != null)
                          RankTileWidget<Rank>(rank: Rank.lastEdited!)
                        else
                          SimpleButton(
                              radius: 0,
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              color: cardEnab_(context),
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
                                  MaterialPageRoute(builder: (context) => RankPage(org: OrgHandler.current))
                              )
                          )

                      ],
                    )
                  ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG,
                bottom: Dimen.SIDE_MARG,
              ),
              child: BorderMaterial(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TitleShortcutRowWidget(
                      title: 'Sprawności',
                      textAlign: TextAlign.start,
                      onOpen: () => pushPage(
                          context,
                          builder: (context) => const SprawnosciPage()
                      ),
                    ),

                    SprawPreviewList(),

                    SimpleButton.from(
                      context: context,
                      color: cardEnab_(context),
                      radius: 0,
                      margin: EdgeInsets.zero,
                      icon: MdiIcons.folderZipOutline,
                      text: 'Foldery',
                      onTap: () => pushPage(context, builder: (context) => const SprawFoldersPage()),
                    ),

                  ],
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: BorderMaterial(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    TitleShortcutRowWidget(
                      title: 'Tropy',
                      textAlign: TextAlign.start,
                      onOpen: () => pushPage(
                          context,
                          builder: (context) => const TropyPage()
                      ),
                    ),

                    GestureDetector(
                      onTap: () => pushPage(
                          context,
                          builder: (context) => const TropyPage()
                      ),
                      child: const TropyPreviewList(),
                    )

                  ],
                ),
              )
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            //   child: TitleShortcutRowWidget(
            //     title: 'Wyzwania',
            //     textAlign: TextAlign.start,
            //     onOpen: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const SprawnosciPage())
            //     ),
            //   ),
            // ),

          ])
      ),

    ],
  );

}

class SprawPreviewList extends StatelessWidget{

  @override
  Widget build(BuildContext context) => Consumer3<SprawSavedListProv, SprawInProgressListProv, SprawCompletedListProv>(
    builder: (context, savedProv, inProgProv, complProv, child){

      String keyVal = '';
      for(String uid in SavedSprawFolder().sprawUIDs) keyVal += uid;
      for(String uid in Spraw.inProgressList) keyVal += uid;
      for(String uid in Spraw.completedList) keyVal += uid;

      List<Spraw> spraws = [];
      for(String sprawUID in Spraw.inProgressList + Spraw.completedList){
        Spraw? spraw = Spraw.fromUID(sprawUID);
        if(spraw != null && !spraws.contains(spraw)) spraws.add(spraw);
      }

      if(spraws.isEmpty)
        return SizedBox(
          height: SprawWidgetSmall.height + 2*Dimen.defMarg,
          child: GestureDetector(
            child: Container( // This is needed for gesture detector to work.
              color: Colors.transparent,
              child: const SprawPreviewEmptyWidget(),
            ),
            onTap: () => pushPage(
                context,
                builder: (context) => const SprawnosciPage()
            ),
          ),
        );

      return SizedBox(
        height: SprawWidgetSmall.height + Dimen.defMarg,
        child: ListView.separated(
            padding: const EdgeInsets.only(
              left: Dimen.defMarg,
              right: Dimen.defMarg,
              bottom: Dimen.defMarg,
            ),
            key: ValueKey(keyVal),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SprawWidgetSmall(
              spraws[index],
              '',
              elevation: 0.0,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: Dimen.defMarg),
            itemCount: spraws.length
        ),
      );

    },
  );

}

class SprawPreviewEmptyWidget extends StatelessWidget{

  const SprawPreviewEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => Stack(
      children: [

        Positioned(
          top: 0,
          left: 0,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.chocolateKey]!,
            icon: MdiIcons.imageFilterHdr,
          ),
        ),

        Positioned(
          top: 0,
          left: .2*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.raspberryKey]!,
            icon: MdiIcons.fountainPenTip,
          ),
        ),

        Positioned(
          top: 0,
          left: .4*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.dawnKey]!,
            icon: MdiIcons.fire,
          ),
        ),

        Positioned(
          top: 0,
          left: .6*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.rosegoldKey]!,
            icon: MdiIcons.trumpet,
          ),
        ),

        Positioned(
          top: 0,
          left: .8*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.goldKey]!,
            icon: MdiIcons.dramaMasks,
          ),
        ),

        // -------

        Positioned(
          top: .4*constraints.maxHeight,
          left: .1*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.mintKey]!,
            icon: MdiIcons.tree,
          ),
        ),

        Positioned(
          top: .4*constraints.maxHeight,
          left: .3*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.greenKey]!,
            icon: MdiIcons.horseshoe,
          ),
        ),

        Positioned(
          top: .4*constraints.maxHeight,
          left: .5*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.turquoiseKey]!,
            icon: MdiIcons.hammerWrench,
          ),
        ),

        Positioned(
          top: .4*constraints.maxHeight,
          left: .7*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.deepblueKey]!,
            icon: MdiIcons.divingScubaMask,
          ),
        ),

        Positioned(
          top: .4*constraints.maxHeight,
          left: .9*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.deepblueKey]!,
            icon: MdiIcons.surfing,
          ),
        ),

        // -------

        Positioned(
          top: .8*constraints.maxHeight,
          left: 0,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.darkorangeKey]!,
            icon: MdiIcons.bicycle,
          ),
        ),

        Positioned(
          top: .8*constraints.maxHeight,
          left: .2*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.darkgreenKey]!,
            icon: MdiIcons.compassOutline,
          ),
        ),

        Positioned(
          top: .8*constraints.maxHeight,
          left: .4*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.darkblueKey]!,
            icon: MdiIcons.paw,
          ),
        ),

        Positioned(
          top: .8*constraints.maxHeight,
          left: .6*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.darkpurpleKey]!,
            icon: MdiIcons.chessKing,
          ),
        ),

        Positioned(
          top: .8*constraints.maxHeight,
          left: .8*constraints.maxWidth,
          child: SprawPreviewCircle(
            color: CommonColorData.all[CommonColorData.darkbrownKey]!,
            icon: MdiIcons.cake,
          ),
        ),

        Positioned.fill(child: Container()),

      ],
    ),
  );

}

class SprawPreviewCircle extends StatelessWidget{

  final CommonColorData color;
  final IconData icon;
  final double size;

  const SprawPreviewCircle({required this.color, required this.icon, this.size = 54.0, super.key});

  @override
  Widget build(BuildContext context) => GradientWidget(
    radius: size,
    width: size,
    height: size,
    colorStart: color.colorStart,
    colorEnd: color.colorEnd,
    child: Padding(
      padding: EdgeInsets.all(.11*size),
      child: Material(
        borderRadius: BorderRadius.circular(size),
        color: background_(context),
        child: GradientIcon(
          icon,
          colorStart: color.colorStart,
          colorEnd: color.colorEnd,
          size: .65*size,
        ),
      ),
    ),
  );

}

class TropyPreviewList extends StatefulWidget{

  const TropyPreviewList({super.key});

  @override
  State<StatefulWidget> createState() => TropyPreviewListState();

}

class TropyPreviewListState extends State<TropyPreviewList>{

  List<TropBaseData> get trops{
    List<TropBaseData> result = [];
    result.addAll(Trop.allOwn);
    if(TropSharedPreviewData.all != null)
      result.addAll(TropSharedPreviewData.all!.toList());

    return result;
  }

  int get tropCount => Trop.allOwn.length + (TropSharedPreviewData.all?.length??0);

  late TropSharedPreviewsLoaderListener tropSharedPreviewsLoaderListener;
  late LoginListener loginListener;

  @override
  void initState() {
    tropSharedPreviewsLoaderListener = TropSharedPreviewsLoaderListener(
        onSuccess: (){
          TropListProvider.notify_(context);
          if(mounted) setState((){});
        },
        onForceLoggedOut: (){
          if(!mounted) return;
          showAppToast(context, text: forceLoggedOutMessage);
          setState(() {});
          return;
        },
        onServerMaybeWakingUp: (){
          if(!mounted) return;
          showServerWakingUpToast(context);
          return;
        },
        onError: (_){
          if(!mounted) return;
          showAppToast(context, text: simpleErrorMessage);
        },
        onNoInternet: (){
          if(mounted) showAppToast(context, text: 'Brak dostępu do Internetu');
          if(mounted) post(() => mounted?setState(() {}):null);
        },
        onEnd: (_, __){
          if(mounted) setState(() {});
        }
    );
    tropSharedPreviewsLoader.addListener(tropSharedPreviewsLoaderListener);
    if(!TropSharedPreviewData.hasAny && AccountData.loggedIn && TropSharedPreviewData.moreToLoad)
      tropSharedPreviewsLoader.run();

    loginListener = LoginListener(
        onLogin: (emailConf){
          if(!emailConf) return;
          bool loggedIn = LoginProvider.of(context).loggedIn;

          if(loggedIn && !TropSharedPreviewData.hasAny && AccountData.loggedIn)
            tropSharedPreviewsLoader.run(reloadAll: true);

        },
        onLogout: (force){
          TropListProvider.notify_(context);
        }
    );
    AccountData.addLoginListener(loginListener);

    super.initState();
  }

  @override
  void dispose() {
    tropSharedPreviewsLoader.removeListener(tropSharedPreviewsLoaderListener);
    AccountData.removeLoginListener(loginListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer2<TropProvider, TropListProvider>(
    builder: (context, tropProv, tropProvList, child){

      List<TropBaseData> trops = this.trops;

      if(trops.isEmpty && !tropSharedPreviewsLoader.running)
        return const SizedBox(
          height: TropIcon.defSize + Dimen.defMarg,
          child: TropyPreviewEmptyWidget(),
        );

      return SizedBox(
        height: TropWidgetSmall.height + Dimen.defMarg,
        child: NotificationListener<ScrollEndNotification>(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [

                if(tropCount == 0)
                  const SizedBox(width: Dimen.defMarg)
                else
                  ListView.separated(
                    padding: const EdgeInsets.only(
                      left: Dimen.defMarg,
                      right: Dimen.defMarg,
                      bottom: Dimen.defMarg,
                    ),
                    itemBuilder: (context, index) => TropWidgetSmall(
                      trops[index],
                      elevation: 0,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(width: Dimen.defMarg),
                    itemCount: tropCount,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),

                if(tropSharedPreviewsLoader.running)
                  SizedBox(
                    height: TropWidgetSmall.height,
                    width: TropWidgetSmall.width,
                    child: Material(
                      color: cardEnab_(context),
                      borderRadius: BorderRadius.circular(AppCard.bigRadius),
                      child: const Center(
                        child: SpinKitChasingDots(
                          size: Dimen.ICON_SIZE,
                          color: AppColors.zhpTropColor,
                        ),
                      ),
                    ),
                  )

              ],
            ),
          ),
          onNotification: (scrollEnd) {
            final metrics = scrollEnd.metrics;
            if (!metrics.atEdge) return true;
            if(metrics.pixels == 0) return true;

            if(AccountData.loggedIn)
              tropSharedPreviewsLoader.run();
            setState(() {});

            return true;
          },
        ),
      );

    },
  );

}

class TropyPreviewEmptyWidget extends StatelessWidget{

  const TropyPreviewEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
    color: cardEnab_(context),
    child: Row(
      children: [

        const SizedBox(width: Dimen.SIDE_MARG),

        Icon(
            Trop.icon,
            color: iconEnab_(context),
            size: TropIcon.tileSize
        ),

        const SizedBox(width: 2*Dimen.SIDE_MARG),

        Expanded(
          child: Text(
            'Jak to wciaż nie masz żadnego tropu?!',
            style: AppTextStyle(
                color: iconEnab_(context),
                fontSize: Dimen.TEXT_SIZE_APPBAR
            ),
          ),
        ),

        const SizedBox(width: Dimen.SIDE_MARG),

      ],
    ),
  );

}