import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/award_widgets/award_tile_edit_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_details.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class IndivCompAwardsEditorWidget extends StatefulWidget{

  final IndivCompDetails initComp;

  const IndivCompAwardsEditorWidget({this.initComp});

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
          physics: BouncingScrollPhysics(),
          slivers: [

            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

            SliverList(delegate: SliverChildListDelegate([
              TitleShortcutRowWidget(title: 'Nagrody', titleColor: hintEnab_(context)),
            ])),

            Consumer<AwardsProvider>(
              builder: (context, prov, child){

                if(prov.awards.isEmpty)
                  return SliverFillRemaining(
                    child: Center(
                      child: EmptyMessageWidget(
                        icon: MdiIcons.trophyOutline,
                        text: 'Dodaj nagrody!',
                      ),
                    ),
                  );
                else
                  return SliverPadding(
                    padding: EdgeInsets.only(top: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                    sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                            (context, index) => AwardTileEditWidget(
                                index+1,
                                prov.data[index],
                                onChanged: (text) => prov.awards[index] = text,
                                onDuplicate: () => prov.insertAfter(index, null),
                                onRemove: () => prov.removeAt(index),
                            ),
                        separatorBuilder: (context, index) => SizedBox(height: Dimen.SIDE_MARG),
                        count: Provider.of<AwardsProvider>(context, listen: false).data.length
                    )),
                  );

              },
            ),

            SliverList(delegate: SliverChildListDelegate([
              SizedBox(height: Dimen.ICON_FOOTPRINT + 3*Dimen.SIDE_MARG)
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