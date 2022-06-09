import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../../_common_classes/sliver_child_builder_separated_delegate.dart';
import '../../../_common_widgets/app_toast.dart';
import 'announcement_edit_page/_main.dart';
import 'announcement_widget.dart';
import 'circle_editor/_main.dart';
import 'circle_page.dart';
import 'circle_palette_generator.dart';
import 'circle_role.dart';
import 'cover_image.dart';
import 'members_page/members_admin_page.dart';
import 'members_page/members_page.dart';
import 'model/circle.dart';

class CircleDescriptionPage extends StatefulWidget{

  final Circle circle;
  final void Function()? onLeft;
  final void Function()? onDeleted;
  const CircleDescriptionPage(this.circle, {this.onLeft, this.onDeleted, super.key});

  @override
  State<StatefulWidget> createState() => CircleDescriptionPageState();

}

class CircleDescriptionPageState extends State<CircleDescriptionPage>{

  static const String allAnnsTab = 'all_announcements';
  static const String pinnedAnnsTab = 'pinned_announcements';
  static const String awaitingAnnsTab = 'awaiting_announcements';

  late String currTab;

  Circle get circle => widget.circle;
  void Function()? get onLeft => widget.onLeft;
  void Function()? get onDeleted => widget.onDeleted;

  late RefreshController refreshController;

  PaletteGenerator? paletteGeneratorFirst;
  PaletteGenerator? paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    paletteGeneratorFirst = await getPaletteGenerator(circle.coverImage!.local, circle.coverImage!.firstFileName);
    paletteGeneratorSecond = await getPaletteGenerator(circle.coverImage!.local, circle.coverImage!.secondFileName);

    if(!refresh) return;

    setState(() {});
    notifyScrollController();
  }

  late ScrollController scrollController;

  late GlobalKey appBarKey;
  late GlobalKey tabBarKey;

  late AppBarProvider appBarProv;

  @override
  void initState() {

    currTab = allAnnsTab;

    appBarKey = GlobalKey();
    tabBarKey = GlobalKey();

    scrollController = ScrollController();
    scrollController.addListener(() {
      double topPadding = MediaQuery.of(context).padding.top;
      final appBarBox = appBarKey.currentContext?.findRenderObject() as RenderBox?;
      double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (appBarPos < kToolbarHeight && !appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = true;
      else if(appBarPos >= kToolbarHeight && appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = false;

      if (appBarPos < 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;
      else if(appBarPos >= 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;

      final tabBarBox = tabBarKey.currentContext?.findRenderObject() as RenderBox?;
      double tabBarPos = tabBarBox==null? -double.infinity: tabBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if (tabBarPos <= 96 && appBarProv.elevated) appBarProv.elevated = false;
      else if(tabBarPos > 96 && !appBarProv.elevated) appBarProv.elevated = true;
    });

    refreshController = RefreshController();
    initPaletteGenerator();

    super.initState();
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }
  
  PaletteGenerator? get paletteAlways{
    if(paletteGeneratorSecond == null) return paletteGeneratorFirst;
    return AppSettings.isDark?paletteGeneratorSecond:paletteGeneratorFirst;
  }
  
  PaletteGenerator? get palette{
    if(circle.colorsKey == 'none') return null;
    return paletteAlways;
  }


  Color? get appBarColor => CirclePage.appBarColor(context, palette);
  Color? get backgroundColor => CirclePage.backgroundColor(context, palette);
  Color? get cardColor => CirclePage.cardColor(context, palette);
  Color get strongColor => CirclePage.strongColor(context, palette);
  Color get iconColor => CirclePage.coverIconColor(context, paletteAlways);

  void notifyScrollController() => post(() => scrollController.jumpTo(scrollController.offset + 1e-10));

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: backgroundColor,
    appBottomNavColor: backgroundColor,
    body: ChangeNotifierProvider(
      create: (context){
        appBarProv = AppBarProvider();
        return appBarProv;
      },
      builder: (context, child) =>
      paletteAlways == null?
      const CircleLoadingWidget():
      SmartRefresher(
          enablePullDown: true,
          physics: const BouncingScrollPhysics(),
          header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: strongColor),
          controller: refreshController,
          onRefresh: () async {

            if(!await isNetworkAvailable()){
              showAppToast(context, text: 'Brak dostępu do Internetu');
              refreshController.refreshCompleted();
              return;
            }

            await ApiCircle.get(
                circleKey: circle.key,
                onSuccess: (updatedCircle) async {
                  circle.name = updatedCircle.name;
                  circle.description = updatedCircle.description;
                  circle.coverImage = updatedCircle.coverImage;
                  circle.colorsKey = updatedCircle.colorsKey;

                  await initPaletteGenerator(refresh: false);

                  setState(() {});
                },
                onError: () => showAppToast(context, text: 'Coś poszło nie tak...')
            );
            refreshController.refreshCompleted();

          },
          child: Container()

      ),
    ),
  );


}

class CircleLoadingWidget extends StatelessWidget{

  const CircleLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: SpinKitDualRing(color: iconEnab_(context), size: 48.0),
  );

}

class AppBarProvider extends ChangeNotifier{

  late bool _elevated;
  bool get elevated => _elevated;
  set elevated(bool value){
    _elevated = value;
    notifyListeners();
  }

  late bool _showTitleOnAppBar;
  bool get showTitleOnAppBar => _showTitleOnAppBar;
  set showTitleOnAppBar(bool value){
    _showTitleOnAppBar = value;
    notifyListeners();
  }

  late bool _coverVisible;
  bool get coverVisible => _coverVisible;
  set coverVisible(bool value){
    _coverVisible = value;
    notifyListeners();
  }

  AppBarProvider(){
    _elevated = true;
    _showTitleOnAppBar = false;
    _coverVisible = true;
  }

}