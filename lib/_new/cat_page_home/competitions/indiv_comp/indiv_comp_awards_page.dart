import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'award_widgets/award_tile_dense_widget.dart';
import 'award_widgets/award_tile_widget.dart';
import 'models/indiv_comp.dart';

class AwardPageViewWidget extends StatelessWidget{

  final IndivComp comp;
  final bool expanded;
  final EdgeInsets padding;

  const AwardPageViewWidget(this.comp, {this.expanded = false, this.padding, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<comp.awards.length; i++)
      children.add(
        Padding(
          padding: padding,
          child: expanded?
          AwardTileWidget(i+1, comp.colors, comp.awards[i]):
          AwardTileDenseWidget(i+1, comp.colors, comp.awards[i])),
        );

    return SizedBox(
      height: AwardTileDenseWidget.height,
      child: PageView(children: children, physics: const BouncingScrollPhysics()),
    );

  }

}

class AwardListWidget extends StatelessWidget{

  final List<IndivCompAward> awards;
  final CommonColorData colors;
  final int limit;
  final bool expanded;

  const AwardListWidget(this.awards, this.colors, {this.limit, this.expanded = false, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<min(limit??awards.length, awards.length); i++) {
      children.add(
          expanded ?
          AwardTileWidget(i + 1, colors, awards[i]) :
          AwardTileDenseWidget(i + 1, colors, awards[i]));
      if(i<awards.length-1)
        children.add(const SizedBox(height: 18.0));

    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children);

  }

}

class IndivCompAwardsPage extends StatefulWidget{

  final IndivComp comp;

  const IndivCompAwardsPage(this.comp, {Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => IndivCompAwardsPageState();

}

class IndivCompAwardsPageState extends State<IndivCompAwardsPage>{

  IndivComp get comp => widget.comp;

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            title: Text('Lista nagród'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(delegate: SliverChildListDelegate([

                AwardListWidget(comp.awards, comp.colors, expanded: true)

              ])),
          ),

        ],
      ),
    );

  }

}