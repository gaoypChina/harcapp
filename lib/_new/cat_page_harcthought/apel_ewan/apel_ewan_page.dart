import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'apel_ewan.dart';
import 'apel_ewan_own_folder_selector.dart';
import 'apel_ewan_widget.dart';

class ApelEwanPage extends StatefulWidget{

  final ApelEwan apelEwan;
  final String? initSubgroup;

  const ApelEwanPage(this.apelEwan, {this.initSubgroup, super.key});

  @override
  State<StatefulWidget> createState() => ApelEwanPageState();

}

class ApelEwanPageState extends State<ApelEwanPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.myslHarcFormy;

  ApelEwan get apelEwan => widget.apelEwan;
  String? get initSubgroup => widget.initSubgroup;

  @override
  Widget build(BuildContext context) =>
      BottomNavScaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              title: Text(apelEwan.siglum),
              centerTitle: true,
              floating: true,
            ),

            SliverPadding(
              padding: const EdgeInsets.only(
                  top: Dimen.SIDE_MARG,
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.FLOATING_BUTTON_SIZE + Dimen.FLOATING_BUTTON_MARG
              ),
              sliver: SliverList(delegate: SliverChildListDelegate([

                ApelEwanWidget(apelEwan, initSubgroup: initSubgroup),

              ])),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(MdiIcons.bookmark),
          onPressed: () => openApelEwanOwnFolderSelector(
            context, apelEwan.siglum
          )
        ),
      );

}
