import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/ideas/trop_ideas_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/predefined/data_z.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'ideas/data_h.dart';
import 'ideas/data_hs.dart';
import 'ideas/data_w.dart';
import 'predefined/trop_predef_page.dart';
import 'model/trop.dart';
import 'trop_editor_page/_main.dart';
import 'trop_tile.dart';

class TropyPage extends StatefulWidget{

  const TropyPage({super.key});

  @override
  State<StatefulWidget> createState() => TropyPageState();

}

class TropyPageState extends State<TropyPage>{

  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<LoginProvider>(
    builder: (context, loginProv, child) => SmartRefresher(
      enablePullDown: loginProv.loggedIn,
      enablePullUp: loginProv.loggedIn,
      physics: const BouncingScrollPhysics(),
      header: MaterialClassicHeader(
          backgroundColor: cardEnab_(context),
          color: AppColors.zhpTropColor,
      ),
      controller: refreshController,
      onRefresh: () async {

        await ApiTrop.getSharedTropPreviews(
          pageSize: Trop.tropPageSize,
          lastStartTime: null,
          lastName: null,
          lastTropUniqName: null,
          onSuccess: (tropPrevs){
            TropPreviewData.setAll(tropPrevs);
            setState(() {});
          },
          onForceLoggedOut: (){
            if(!mounted) return true;
            showAppToast(context, text: forceLoggedOutMessage);
            setState(() {});
            return true;
          },
          onServerMaybeWakingUp: (){
            if(!mounted) return true;
            showServerWakingUpToast(context);
            return true;
          },
          onError: (){
            if(!mounted) return;
            showAppToast(context, text: simpleErrorMessage);
          },
        );

        if(mounted) refreshController.refreshCompleted();

      },
      child: Consumer<TropListProvider>(
        builder: (context, prov, child){

          List<Widget> slivers = [
            const SliverAppBar(
              floating: true,
              pinned: true,
              centerTitle: true,
              title: Text('Tropy'),
            )
          ];

          if(Trop.allOwn.isEmpty && Trop.allSharedWithMe.isEmpty)
            slivers.add(SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: SimpleButton(
                      radius: AppCard.bigRadius,
                      onTap: () => openNewTropBottomSheet(
                          context,
                          onNewTropSaved: (trop) =>
                              pushPage(context, builder: (context) => TropPage(trop))
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(Dimen.SIDE_MARG),
                        child: EmptyMessageWidget(
                          icon: Trop.icon,
                          text: 'Rozpocznij nowy trop!',
                        ),
                      )
                  ),
                )
            ));

          else{

            if(AccountData.loggedIn)
              slivers.add(SliverPadding(
                  padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
                  sliver: SliverList(delegate: SliverChildListDelegate([
                    const TitleShortcutRowWidget(
                      title: 'Moje tropy',
                      textAlign: TextAlign.left,
                    ),
                  ]))));

            if(Trop.allOwn.isEmpty)
              slivers.add(SliverList(delegate: SliverChildListDelegate([
                const NoTropWidget(),
              ])));
            else
              slivers.add(SliverPadding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                    (BuildContext context, int index) => SimpleButton(
                      clipBehavior: Clip.none,
                      radius: AppCard.bigRadius,
                      child: TropTile(
                        name: Trop.allOwn[index].name,
                        category: Trop.allOwn[index].category,
                        zuchTropName: Trop.allOwn[index].customIconTropName,
                        trailing: TropTileProgressWidget(Trop.allOwn[index].completenessPercent),
                        iconSize: TropIcon.defSize,
                      ),
                      onTap: () => pushPage(
                          context,
                          builder: (BuildContext context) => TropPage(Trop.allOwn[index])
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                    count: Trop.allOwn.length
                )),
              ));

            if(AccountData.loggedIn)
              slivers.add(SliverPadding(
                padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, top: Dimen.SIDE_MARG),
                sliver: SliverList(delegate: SliverChildListDelegate([
                  const TitleShortcutRowWidget(
                    title: 'Udostępnione mi tropy',
                    textAlign: TextAlign.left,
                  ),
                ])),
              ));

            if(AccountData.loggedIn && TropPreviewData.all.isEmpty)
              slivers.add(SliverList(delegate: SliverChildListDelegate([
                const NoTropWidget(),
              ])));
            else if(AccountData.loggedIn)
              slivers.add(SliverPadding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(
                    const EdgeInsets.only(bottom: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG)
                ),
                sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                    (BuildContext context, int index) => SimpleButton(
                      clipBehavior: Clip.none,
                      radius: AppCard.bigRadius,
                      child: TropTile(
                        name: TropPreviewData.all[index].name,
                        category: TropPreviewData.all[index].category,
                        zuchTropName: TropPreviewData.all[index].customIconTropName,
                       // trailing: TropTileProgressWidget(TropPreviewData.all[index].completenessPercent),
                        iconSize: TropIcon.defSize,
                      ),
                      onTap: () => loadPushTropPage(context, TropPreviewData.all[index])
                    ),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                    count: TropPreviewData.all.length
                )),
              ));

            slivers.add(
                SliverList(delegate: SliverChildListDelegate([
                  const SizedBox(height: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG)
                ]))
            );

          }

          return BottomNavScaffold(
            body: Consumer<TropListProvider>(
              builder: (context, prov, child) => CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: slivers,
              ),
            ),
            floatingActionButton: ExtendedFloatingButton(
                MdiIcons.plus,
                'Nowy trop',
                background: AppColors.zhpTropColor,
                backgroundEnd: AppColors.zhpTropDarkColor,
                textColor: Colors.white,
                onTap: () => openNewTropBottomSheet(
                    context,
                    onNewTropSaved: (trop) =>
                        pushPage(context, builder: (context) => TropPage(trop))
                )
            ),
          );

        },
      ),
    ),
  );

  Future<void> openNewTropBottomSheet(
      BuildContext context,
      { void Function(Trop)? onNewTropSaved}
      ) => showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
          title: 'Nowy trop',
          builder: (context) => Column(
            children: [

              const TitleShortcutRowWidget(title: 'Stwórz nowy trop', textAlign: TextAlign.left),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: const TropIcon(TropCategory.harcZaradnosc, size: 52.0,),
                  title: Text('Nowy trop harcerski', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...ale też HS i W', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    TropProvider tropProvider = TropProvider.of(context);
                    TropListProvider tropListProvider = TropListProvider.of(context);
                    pushPage(context, builder: (_) => TropEditorPage(
                        allCategories: allHarcTropCategories,
                        onSaved: (Trop trop){
                          Trop.addOwnToAll(trop);
                          Trop.callProviders(tropProvider, tropListProvider);
                          onNewTropSaved?.call(trop);
                        }
                    ));
                  }
              ),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: const TropIcon(TropCategory.zuchObywatelskie, size: 52.0, zuchTropName: 'biale_orly',),
                  title: Text('Nowy trop zuchowy', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...z listy gotowców', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    TropProvider tropProvider = TropProvider.of(context);
                    TropListProvider tropListProvider = TropListProvider.of(context);
                    pushPage(context, builder: (context) => TropPredefPage(
                      metoShort: 'Z',
                      predefTrops: zuchTrops,
                      allCategories: allZuchTropCategories,
                      onNewTropSaved: (trop){
                        Trop.addOwnToAll(trop);
                        Trop.callProviders(tropProvider, tropListProvider);
                        onNewTropSaved?.call(trop);
                      },
                    ));
                  }
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              const TitleShortcutRowWidget(title: 'Szukaj inspiracji', textAlign: TextAlign.left),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.metoZhpH,
                    child: SvgPicture.asset(
                      'assets/images/meto/h.svg',
                      height: 48.0,
                      width: 48.0,
                    ),
                  ),
                  trailing: const Icon(MdiIcons.lightbulbOutline),
                  title: Text('Pomysły i inspiracje', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...na trop harcerski', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => TropIdeasPage(
                      metoShort: 'H',
                      ideas: harcHTropIdeas,
                    ));
                  }
              ),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.metoZhpHS,
                    child: SvgPicture.asset(
                      'assets/images/meto/hs.svg',
                      height: 48.0,
                      width: 48.0,
                    ),
                  ),
                  trailing: const Icon(MdiIcons.lightbulbOutline),
                  title: Text('Pomysły i inspiracje', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...na trop starszoharcerski', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => TropIdeasPage(
                      metoShort: 'HS',
                      ideas: harcHSTropIdeas,
                    ));
                  }
              ),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.metoZhpW,
                    child: SvgPicture.asset(
                      'assets/images/meto/w.svg',
                      height: 48.0,
                      width: 48.0,
                    ),
                  ),
                  trailing: const Icon(MdiIcons.lightbulbOutline),
                  title: Text('Pomysły i inspiracje', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...na trop wędrowniczy', style: AppTextStyle()),
                  onTap: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => TropIdeasPage(
                      metoShort: 'W',
                      ideas: harcWTropIdeas,
                    ));
                  }
              ),

            ],
          )
      )
  );

  Future<void> loadPushTropPage(BuildContext context, TropPreviewData data) async {

    Trop? loadSharedTrop;
    if(Trop.allSharedWithMeMapByUniqName.containsKey(data.uniqName))
      if(data.lastUpdateTime == Trop.allSharedWithMeMapByUniqName[data.uniqName]!.lastServerUpdateTime)
        loadSharedTrop =  Trop.allSharedWithMeMapByUniqName[data.uniqName];

    if(loadSharedTrop != null)
      pushPage(context, builder: (context) => TropPage(loadSharedTrop!));
    else {
      showLoadingWidget(context, AppColors.zhpTropColor, 'Otwieranie...');
      await ApiTrop.getShared(
          tropUniqName: data.uniqName,
          onSuccess: (Trop trop) async {
            await popPage(context);
            trop.dumpAsShared();
            Trop.addSharedWithMeToAll(trop, context: context);
            pushPage(context, builder: (context) => TropPage(trop));
          },
          onError: (_) async {
            await popPage(context);
            showAppToast(context, text: simpleErrorMessage);
          }
      );
    }
  }

}

class NoTropWidget extends StatelessWidget{

  const NoTropWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    child: Material(
      borderRadius: BorderRadius.circular(AppCard.bigRadius),
      color: cardEnab_(context),
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Row(
          children: [

            Icon(MdiIcons.windPower, color: hintEnab_(context)),

            Expanded(
              child: Text(
                'Wieje pustką...',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold,
                    color: hintEnab_(context)
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Icon(MdiIcons.windsock, color: hintEnab_(context)),

          ],
        )
      ),
    ),
  );

}