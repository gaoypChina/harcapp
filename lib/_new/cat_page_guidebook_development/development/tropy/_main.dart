import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/ideas/trop_ideas_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/predefined/data_z.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
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
import 'open_trop_dialog.dart';
import 'predefined/trop_predef_page.dart';
import 'model/trop.dart';
import 'trop_editor_page/_main.dart';
import 'trop_shared_previews_loader.dart';
import 'trop_tile.dart';

class TropyPage extends StatefulWidget{

  const TropyPage({super.key});

  @override
  State<StatefulWidget> createState() => TropyPageState();

}

class TropyPageState extends State<TropyPage>{

  late RefreshController refreshController;

  late TropSharedPreviewsLoaderListener tropSharedPreviewsLoaderListener;

  bool get moreToLoad => TropSharedPreviewData.moreToLoad;

  bool get tropPreviewEmpty => TropSharedPreviewData.all?.isEmpty??true;

  late SynchronizerListener syncListener;
  late LoginListener loginListener;

  @override
  void initState() {

    bool loggedIn = LoginProvider.of(context).loggedIn;
    bool loadInit = loggedIn && !TropSharedPreviewData.hasAny && TropSharedPreviewData.moreToLoad;
    refreshController = RefreshController(
        initialRefresh: loadInit,
        initialRefreshStatus:
        loadInit || tropSharedPreviewsLoader.running?
        RefreshStatus.refreshing:
        RefreshStatus.idle
    );
    if(loadInit && AccountData.loggedIn)
      tropSharedPreviewsLoader.run(reloadAll: true);

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
          if(!mounted) return;
          showAppToast(context, text: noInternetMessage);
          refreshController.loadComplete(); // This is called in `post()` inside.
          post(() => setState(() {}));
        },
        onEnd: (_, __){
          if(!mounted) return;
          refreshController.loadComplete();
          refreshController.refreshCompleted();
          post(() => setState(() {}));
        }
    );
    tropSharedPreviewsLoader.addListener(tropSharedPreviewsLoaderListener);

    syncListener = SynchronizerListener(
      onEnd: (syncOper){
        if(syncOper == SyncOper.post && mounted)
          TropLoadedUsersProvider.notify_(context);
      }
    );

    synchronizer.addListener(syncListener);
    loginListener = LoginListener(
      onLogin: (emailConf){
        if(!emailConf) return;
        bool loggedIn = LoginProvider.of(context).loggedIn;
        bool loadInit = loggedIn && !TropSharedPreviewData.hasAny && AccountData.loggedIn;

        refreshController = RefreshController(
          initialRefresh: loadInit
        );
        if(loadInit)
          tropSharedPreviewsLoader.run(reloadAll: true);

      }
    );
    AccountData.addLoginListener(loginListener);

    super.initState();
  }

  @override
  void dispose() {
    tropSharedPreviewsLoader.removeListener(tropSharedPreviewsLoaderListener);
    synchronizer.removeListener(syncListener);
    AccountData.removeLoginListener(loginListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: Consumer2<TropListProvider, LoginProvider>(
        builder: (context, tropListProv, loginProv, child){

          List<Widget> slivers = [];
          if(Trop.allOwn.isEmpty && tropPreviewEmpty)
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
                      child: Padding(
                        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
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
                      title: 'Moje lokalne tropy',
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
                        completenessPercent: Trop.allOwn[index].completenessPercent,
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
                    title: 'Udostępnione tropy',
                    textAlign: TextAlign.left,
                  ),
                ])),
              ));

            if(AccountData.loggedIn && tropPreviewEmpty)
              slivers.add(SliverList(delegate: SliverChildListDelegate([
                const NoTropWidget(),
              ])));
            else if(AccountData.loggedIn)
              slivers.add(SliverPadding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                    (BuildContext context, int index) => SimpleButton(
                        clipBehavior: Clip.none,
                        radius: AppCard.bigRadius,
                        child: TropTile(
                          name: TropSharedPreviewData.all![index].name,
                          category: TropSharedPreviewData.all![index].category,
                          zuchTropName: TropSharedPreviewData.all![index].customIconTropName,
                          completenessPercent: TropSharedPreviewData.all![index].completenessPercent,
                          iconSize: TropIcon.defSize,
                        ),
                        onTap: () => loadPushTropPage(context, TropSharedPreviewData.all![index])
                    ),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                    count: TropSharedPreviewData.all!.length
                )),
              ));

            if(!moreToLoad)
              slivers.add(
                  SliverList(delegate: SliverChildListDelegate([
                    const SizedBox(height: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG)
                  ]))
              );

          }

          return NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                SliverAppBar(
                  floating: true,
                  centerTitle: true,
                  title: const Text('Tropy'),
                  forceElevated: innerBoxIsScrolled,
                )
              ],
              body: SmartRefresher(
                physics: const BouncingScrollPhysics(),
                enablePullDown: loginProv.loggedIn && !refreshController.isLoading,
                enablePullUp: loginProv.loggedIn && moreToLoad && !refreshController.isRefresh,
                footer: AppCustomFooter(
                  moreToLoad: moreToLoad && !tropPreviewEmpty,
                  showDotWhenAllLoaded: true
                ),
                header: MaterialClassicHeader(
                  backgroundColor: cardEnab_(context),
                  color: AppColors.zhpTropColor,
                ),
                controller: refreshController,
                onRefresh: () async {
                  await tropSharedPreviewsLoader.run(awaitFinish: true, reloadAll: true);
                },
                onLoading: () async {

                  if(!moreToLoad) {
                    refreshController.loadComplete();
                    if(mounted) post(() => mounted?setState(() {}):null);
                    return;
                  }

                  await tropSharedPreviewsLoader.run(awaitFinish: true);

                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: loginProv.loggedIn,
                  slivers: slivers,
                ),
              )
          );

        }
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

  Future<void> openNewTropBottomSheet(
      BuildContext context,
      { void Function(Trop)? onNewTropSaved }
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
                  onTap: () => pushReplacePage(context, builder: (_) => TropEditorPage(
                        allCategories: allHarcTropCategories,
                        onSaved: onNewTropSaved
                    ))
              ),

              ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                  ),
                  leading: const TropIcon(TropCategory.zuchObywatelskie, size: 52.0, zuchTropName: 'biale_orly',),
                  title: Text('Nowy trop zuchowy', style: AppTextStyle(fontWeight: weight.halfBold)),
                  subtitle: Text('...z listy gotowców', style: AppTextStyle()),
                  onTap: () => pushReplacePage(context, builder: (context) => TropPredefPage(
                      metoShort: 'Z',
                      predefTrops: zuchTrops,
                      allCategories: allZuchTropCategories,
                      onNewTropSaved: onNewTropSaved,
                    ))

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
                  trailing: Icon(MdiIcons.lightbulbOutline),
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
                  trailing: Icon(MdiIcons.lightbulbOutline),
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
                  trailing: Icon(MdiIcons.lightbulbOutline),
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