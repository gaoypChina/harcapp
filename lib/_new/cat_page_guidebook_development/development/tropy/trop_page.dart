import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_editor_page/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_widget.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


class TropPage extends StatelessWidget{

  final Trop _trop;

  Trop get trop => _trop;

  const TropPage(this._trop, {super.key});

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: Consumer<TropProvider>(
      builder: (context, prov, child) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text(trop.name),
            centerTitle: true,
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.pencilOutline),
                onPressed: () {

                  pushPage(context, builder: (context) => TropEditorPage(
                    initTrop: trop,
                    allCategories:
                    trop.isCategoryHarc?
                    allHarcTropCategories:
                    allZuchTropCategories,
                    onSaved: (updatedTrop){
                      trop.update(updatedTrop);
                      showAppToast(context, text: 'Trop poprawiony');
                      prov.notify();
                    }
                  ));

                },
              )
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([

              TropWidget(
                trop
              )

            ])),
          )

        ],
      )
    )
  );

}