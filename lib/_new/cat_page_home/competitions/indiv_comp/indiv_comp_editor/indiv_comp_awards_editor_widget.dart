import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/award_widgets/award_tile_edit_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_details.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class IndivCompAwardsEditorWidget extends StatefulWidget{

  final IndivCompDetails? initComp;

  const IndivCompAwardsEditorWidget({this.initComp, super.key});

  @override
  State<StatefulWidget> createState() => _IndivCompAwardsEditorWidgetState();

}

class _IndivCompAwardsEditorWidgetState extends State<IndivCompAwardsEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

            Consumer2<AwardsProvider, ColorKeyProvider>(
              builder: (context, awardProv, colorProv, child){

                if(awardProv.awards!.isEmpty)
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: EmptyMessageWidget(
                        icon: MdiIcons.trophyOutline,
                        text: 'Dodaj nagrody!',
                      ),
                    ),
                  );
                else
                  return SliverPadding(
                    padding: const EdgeInsets.all(settingsPartPaddingVal),
                    sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                            (context, index) => AwardTileEditWidget(
                              index+1,
                              colorProv.colors,
                              awardProv.data![index],
                                onChanged: (text) => awardProv.awards![index] = text,
                                onDuplicate: () => awardProv.insertAfter(index, null),
                                onRemove: () => awardProv.removeAt(index),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                        count: Provider.of<AwardsProvider>(context, listen: false).data!.length
                    )),
                  );

              },
            ),

            SliverList(delegate: SliverChildListDelegate([
              const SizedBox(height: Dimen.ICON_FOOTPRINT + 3*Dimen.SIDE_MARG)
            ]))

          ]
      ),

      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: Dimen.ICON_FOOTPRINT,
          color: background_(context),
        )
      ),

      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: EditGradientButton(
            MdiIcons.trophy,
            'Dodaj nagrodę',
            onTap: () async => setState(() => Provider.of<AwardsProvider>(context, listen: false).add('')),
        ),
      ),
    ],
  );

}