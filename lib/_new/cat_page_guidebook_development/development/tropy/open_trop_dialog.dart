import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

void openTropDialog(
    BuildContext context,
    Trop trop
) => openDialog(
    context: context,
    builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets.add(AppCard.normMargin),
        child: Material(
            color: background_(context),
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            clipBehavior: Clip.hardEdge,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [

                SliverAppBar(),

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
        ),
      )
);