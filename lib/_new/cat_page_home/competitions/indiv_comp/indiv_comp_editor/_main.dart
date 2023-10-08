import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/indiv_comp_awards_editor_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import '../../../../../_common_widgets/loading_widget.dart';
import 'common_header.dart';
import 'indiv_comp_colors_editor_widget.dart';
import 'indiv_comp_danger_editor_widget.dart';
import 'indiv_comp_mode_editor_widget.dart';
import 'indiv_comp_tasks_editor_widget.dart';

class IndivCompEditorPage extends StatefulWidget{

  static double get toolbarBottomHeight => const TabBar(tabs: []).preferredSize.height + IndivCompThumbnailWidget.defSize;

  final int? initTab;

  final IndivComp? initComp;

  final String? initTitle;
  final List<IndivCompTask>? initTasks;
  final List<String?>? initAwards;

  final FutureOr<void> Function(IndivComp comp)? onSuccess;
  final FutureOr<void> Function()? onRemoved;

  const IndivCompEditorPage({
    this.initTab,
    this.initComp,
    this.initTitle,
    this.initTasks,
    this.initAwards,
    this.onSuccess,
    this.onRemoved,
    super.key});

  @override
  State<StatefulWidget> createState() => IndivCompEditorPageState();

}

class IndivCompEditorPageState extends State<IndivCompEditorPage> with TickerProviderStateMixin{

  late TabController tabController;
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {

    tabController = TabController(length: editMode?5:4, initialIndex: widget.initTab??0, vsync: this);

    controller = TextEditingController(text: widget.initComp?.name??widget.initTitle??'');
    focusNode = FocusNode();

    super.initState();
  }

  bool get editMode => widget.initComp != null;

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ModeProvider(
        startDate: widget.initComp?.startTime,
        endDate: widget.initComp?.endTime,
        rankDispType: widget.initComp?.rankDispType,
      )),
      ChangeNotifierProvider(create: (context) => ColorKeyProvider(colorKey: widget.initComp?.colorsKey??CommonColorData.randomKey)),
      ChangeNotifierProvider(create: (context) => IconKeyProvider(iconKey: widget.initComp?.iconKey??CommonIconData.randomKey)),
      ChangeNotifierProvider(create: (context) => TaskBodiesProvider(tasks: widget.initComp == null?widget.initTasks:widget.initComp!.tasks)),
      ChangeNotifierProvider(create: (context) => widget.initComp == null?AwardsProvider(awards: widget.initAwards):AwardsProvider.fromIndivCompAwards(widget.initComp!.awards)),
    ],
    builder: (context, child) => BottomNavScaffold(
      //resizeToAvoidBottomInset: true,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: Text(widget.initComp == null?'Nowe współzawod.':'Edytuj współzawod.', overflow: TextOverflow.fade),
              forceElevated: innerBoxIsScrolled,
              centerTitle: true,
              pinned: true,
              actions: [
                IconButton(
                    icon: Icon(MdiIcons.check),
                    onPressed: ()async{

                      ColorKeyProvider colorKeyProv = ColorKeyProvider.of(context);
                      TaskBodiesProvider taskBodiesProv = TaskBodiesProvider.of(context);
                      IconKeyProvider iconKeyProv = IconKeyProvider.of(context);
                      ModeProvider modeProv = ModeProvider.of(context);
                      AwardsProvider awardsProv = AwardsProvider.of(context);

                      if(!await isNetworkAvailable()){
                        if(mounted) showAppToast(context, text: noInternetMessage);
                        return;
                      }

                      if(controller.text.isEmpty){
                        if(mounted) showAppToast(context, text: 'Podaj nazwę współzawodnictwa');
                        focusNode.requestFocus();
                        return;
                      }

                      if(mounted) showLoadingWidget(context, 'Ostatnia prosta...');

                      if(IndivCompModeEditorWidget.verifyHandleDateOrder(context))

                        if(editMode)
                          await ApiIndivComp.update(
                              key: widget.initComp!.key,
                              name: widget.initComp!.name != controller.text?
                              controller.text:
                              null,

                              colorsKey:
                              widget.initComp!.colorsKey != colorKeyProv.colorsKey?
                              colorKeyProv.colorsKey:
                              null,

                              iconKey:
                              widget.initComp!.iconKey != iconKeyProv.iconKey?
                              iconKeyProv.iconKey:
                              null,

                              startTime:
                              widget.initComp!.startTime != modeProv.startDate?
                              modeProv.startDate:
                              null,

                              endTime:
                              widget.initComp!.endTime != modeProv.endDate?
                              modeProv.endDate:
                              null,

                              createTasks: taskBodiesProv.createdTasks(),
                              updateTasks: taskBodiesProv.updatedTasks(),
                              removeTasks: taskBodiesProv.removedTasks(),

                              rankDispType:
                              widget.initComp!.rankDispType != modeProv.rankDispType?
                              modeProv.rankDispType:
                              null,

                              awards:
                              !listEquals(widget.initComp!.awardsEncoded, awardsProv.awards)?
                              awardsProv.awards:
                              null,

                              onSuccess: (indivComp) async {
                                if(mounted) await popPage(context);
                                await widget.onSuccess?.call(indivComp);
                              },
                              onServerMaybeWakingUp: () {
                                if(mounted) Navigator.pop(context); // Close loading widget.
                                if(mounted) showServerWakingUpToast(context);
                                return true;
                              },
                              onError: (){
                                if(mounted) Navigator.pop(context); // Close loading widget.
                                if(mounted) showAppToast(context, text: simpleErrorMessage);
                              }
                          );
                        else
                          await ApiIndivComp.create(
                              name: controller.text,
                              colorsKey: colorKeyProv.colorsKey,
                              iconKey: iconKeyProv.iconKey,
                              startTime: modeProv.startDate!,
                              endTime: modeProv.endDate,
                              rankDispType: modeProv.rankDispType,
                              tasks: taskBodiesProv.createdTasks(),
                              awards: awardsProv.awards,
                              onSuccess: (indivComp) async {
                                if(mounted) await popPage(context);
                                await widget.onSuccess?.call(indivComp);
                              },
                              onForceLoggedOut: (){
                                if(mounted) showAppToast(context, text: forceLoggedOutMessage);
                                return true;
                              },
                              onServerMaybeWakingUp: () {
                                if(mounted) showServerWakingUpToast(context);
                                return true;
                              },
                              onError: (){
                                if(mounted) showAppToast(context, text: simpleErrorMessage);
                              }
                          );

                    }
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, IndivCompEditorPage.toolbarBottomHeight),
                child: Consumer2<ColorKeyProvider, IconKeyProvider>(
                  builder: (context, colorKeyProv, iconKeyProv, child) => Column(
                    children: [

                      CommonHeader(
                        iconKey: iconKeyProv.iconKey,
                        colorsKey: colorKeyProv.colorsKey,
                        controller: controller,
                        focusNode: focusNode,
                        heroTag: widget.initComp==null?null:IndivCompThumbnailWidget.defHeroTag(widget.initComp!),
                      ),

                      TabBar(
                        physics: const BouncingScrollPhysics(),
                        controller: tabController,
                        tabs: [
                          Tab(icon: Icon(MdiIcons.eyeOutline)),
                          Tab(icon: Icon(MdiIcons.paletteOutline)),
                          Tab(icon: Icon(MdiIcons.cubeOutline)),
                          Tab(icon: Icon(MdiIcons.trophyOutline)),
                          if(editMode) Tab(icon: Icon(MdiIcons.alertCircleOutline, color: Colors.red)),
                        ],
                        indicator: AppTabBarIncdicator(context: context, color: colorKeyProv.avgColor),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
        body: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: [
            const IndivCompModeEditorWidget(),
            const IndivCompColorsEditorWidget(),
            const IndivCompTasksEditorWidget(),
            const IndivCompAwardsEditorWidget(),
            if(editMode) IndivCompDangerEditorWidget(widget.initComp!, onRemoved: widget.onRemoved),
          ],
        ),

      ),
    ),
  );

}