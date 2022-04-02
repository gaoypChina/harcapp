import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/indiv_comp_awards_editor_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import '../../loading_widget.dart';
import 'common_header.dart';
import 'indiv_comp_colors_editor_widget.dart';
import 'indiv_comp_danger_editor_widget.dart';
import 'indiv_comp_icon_editor_widget.dart';
import 'indiv_comp_mode_editor_widget.dart';
import 'indiv_comp_tasks_editor_widget.dart';

class IndivCompEditorPage extends StatefulWidget{

  static double get toolbarBottomHeight => const TabBar(tabs: []).preferredSize.height + IndivCompThumbnailWidget.defSize;

  final IndivComp initComp;

  final String initTitle;
  final List<IndivCompTask> initTasks;
  final List<String> initAwards;


  final void Function(IndivComp comp) onSaved;
  final void Function() onRemoved;

  const IndivCompEditorPage({
    this.initComp,
    this.initTitle,
    this.initTasks,
    this.initAwards,
    this.onSaved,
    this.onRemoved,
    Key key
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => IndivCompEditorPageState();

}

class IndivCompEditorPageState extends State<IndivCompEditorPage>{

  TextEditingController controller;
  FocusNode focusNode;

  @override
  void initState() {

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
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModeProvider(
            startDate: widget.initComp?.startTime,
            endDate: widget.initComp?.endTime,
            overviewMode: widget.initComp?.overviewMode,
        )),
        ChangeNotifierProvider(create: (context) => ColorKeyProvider(colorKey: widget.initComp?.colorsKey??CommonColorData.randomKey)),
        ChangeNotifierProvider(create: (context) => IconKeyProvider(iconKey: widget.initComp?.iconKey??CommonIconData.randomKey)),
        ChangeNotifierProvider(create: (context) => TaskBodiesProvider(tasks: widget.initComp == null?widget.initTasks:widget.initComp.tasks)),
        ChangeNotifierProvider(create: (context) => widget.initComp == null?AwardsProvider(awards: widget.initAwards):AwardsProvider.fromIndivCompAwards(widget.initComp.awards)),
      ],
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: DefaultTabController(
          length: editMode?6:5,
          child: NestedScrollView(
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
                        icon: const Icon(MdiIcons.check),
                        onPressed: ()async{

                          if(!await isNetworkAvailable()){
                            showAppToast(context, text: 'Brak dostępu do Internetu');
                            return;
                          }

                          if(controller.text.isEmpty){
                            showAppToast(context, text: 'Podaj nazwę współzawodnictwa');
                            focusNode.requestFocus();
                            return;
                          }

                          showLoadingWidget(context, iconEnab_(context), 'Ostatnia prosta...');

                          if(IndivCompModeEditorWidget.verifyHandleDateOrder(context))

                            if(editMode)
                              await ApiIndivComp.update(
                                  key: widget.initComp.key,
                                  name: controller.text,

                                  colorsKey:
                                  widget.initComp.colorsKey != Provider.of<ColorKeyProvider>(context, listen: false).colorsKey?
                                  Provider.of<ColorKeyProvider>(context, listen: false).colorsKey:
                                  null,

                                  iconKey:
                                  widget.initComp.iconKey != Provider.of<IconKeyProvider>(context, listen: false).iconKey?
                                  Provider.of<IconKeyProvider>(context, listen: false).iconKey:
                                  null,

                                  startTime:
                                  widget.initComp.startTime != Provider.of<ModeProvider>(context, listen: false).startDate?
                                  Provider.of<ModeProvider>(context, listen: false).startDate:
                                  null,

                                  endTime:
                                  widget.initComp.endTime != Provider.of<ModeProvider>(context, listen: false).endDate?
                                  Provider.of<ModeProvider>(context, listen: false).endDate:
                                  null,

                                  createTasks: Provider.of<TaskBodiesProvider>(context, listen: false).createdTasks(),
                                  updateTasks: Provider.of<TaskBodiesProvider>(context, listen: false).updatedTasks(),
                                  removeTasks: Provider.of<TaskBodiesProvider>(context, listen: false).removedTasks(),

                                  overviewMode:
                                  widget.initComp.overviewMode != Provider.of<ModeProvider>(context, listen: false).overviewMode?
                                  Provider.of<ModeProvider>(context, listen: false).overviewMode:
                                  null,

                                  awards:
                                  widget.initComp.awards != Provider.of<AwardsProvider>(context, listen: false).awards?
                                  Provider.of<AwardsProvider>(context, listen: false).awards:
                                  null,

                                  onSuccess: widget.onSaved
                              );
                            else
                              await ApiIndivComp.create(
                                  name: controller.text,
                                  colorsKey: Provider.of<ColorKeyProvider>(context, listen: false).colorsKey,
                                  iconKey: Provider.of<IconKeyProvider>(context, listen: false).iconKey,
                                  startTime: Provider.of<ModeProvider>(context, listen: false).startDate,
                                  endTime: Provider.of<ModeProvider>(context, listen: false).endDate,
                                  overviewMode: Provider.of<ModeProvider>(context, listen: false).overviewMode,
                                  tasks: Provider.of<TaskBodiesProvider>(context, listen: false).createdTasks(),
                                  awards: Provider.of<AwardsProvider>(context, listen: false).awards,
                                  onSuccess: widget.onSaved
                              );

                          Navigator.pop(context);
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
                            heroTag: widget.initComp,
                          ),

                          TabBar(
                            physics: const BouncingScrollPhysics(),
                            tabs: [
                              const Tab(icon: Icon(MdiIcons.eyeOutline)),
                              const Tab(icon: Icon(MdiIcons.paletteOutline)),
                              const Tab(icon: Icon(MdiIcons.flare)),
                              const Tab(icon: Icon(MdiIcons.cubeOutline)),
                              const Tab(icon: Icon(MdiIcons.trophyOutline)),
                              if(editMode) const Tab(icon: Icon(MdiIcons.alertCircleOutline, color: Colors.red)),
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
              physics: const BouncingScrollPhysics(),
              children: [
                const IndivCompModeEditorWidget(),
                const IndivCompColorsEditorWidget(),
                const IndivCompIconEditorWidget(),
                const IndivCompTasksEditorWidget(),
                const IndivCompAwardsEditorWidget(),
                if(editMode) IndivCompDangerEditorWidget(widget.initComp, onRemoved: widget.onRemoved),
              ],
            ),

          ),
        ),
      ),
    );
  }

}