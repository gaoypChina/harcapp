import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'apel_ewan.dart';
import 'apel_ewan_own_folder_selector.dart';
import 'apel_ewan_widget.dart';

class ApelEwanFolderViewerPage extends StatefulWidget{

  final String? title;
  final List<Tuple2<ApelEwan, String?>> apelEwans;
  final ApelEwan initApelEwan;

  const ApelEwanFolderViewerPage(this.apelEwans, this.initApelEwan, {this.title, super.key});

  @override
  State<StatefulWidget> createState() => ApelEwanFolderViewerPageState();

}

class ApelEwanFolderViewerPageState extends State<ApelEwanFolderViewerPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.myslHarcFormy;

  String? get title => widget.title;
  List<Tuple2<ApelEwan, String?>> get apelEwans => widget.apelEwans;
  ApelEwan get initApelEwan => widget.initApelEwan;

  late PageController controller;
  late ValueNotifier notifier;

  @override
  void initState() {
    int initIndex = apelEwans.indexWhere((tuple) => tuple.item1 == initApelEwan);
    controller = PageController(initialPage: initIndex);
    notifier = ValueNotifier(initIndex);
    controller.addListener(() => notifier.value = controller.page);
    super.initState();
  }

  int get currentPage{

    double? page = controller.page;
    if(page == null) return controller.initialPage;
    else return page.round();

  }

  @override
  Widget build(BuildContext context) =>
      BottomNavScaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

            SliverAppBar(
              title: Text(title??'Apele ewangeliczne'),
              centerTitle: true,
              floating: true,
            ),

          ],
          body: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            itemBuilder: (context, index) => ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: Dimen.SIDE_MARG,
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.FLOATING_BUTTON_SIZE + Dimen.FLOATING_BUTTON_MARG
              ),
              children: [

                Text(
                  apelEwans[index].item1.siglum,
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                ApelEwanWidget(
                    apelEwans[index].item1,
                    initSubgroup: apelEwans[index].item2
                )

              ],
            ),
            itemCount: apelEwans.length,
          ),
        ),
        floatingActionButton: AnimatedBuilder(
            animation: notifier,
            builder: (context, child) => Transform.translate(
              offset: Offset(0, 2*Dimen.FLOATING_BUTTON_MARG*(1-cos(2*pi*notifier.value))),
              child: Opacity(

                opacity:
                max(0, cos(2*pi*notifier.value)),

                child: FloatingActionButton(
                    child: Icon(MdiIcons.bookmark),
                    onPressed: () => openApelEwanOwnFolderSelector(
                        context, apelEwans[currentPage].item1.siglum
                    )
                ),
              ),
            )
        )
      );

}
