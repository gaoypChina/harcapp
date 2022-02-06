import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'award_widgets/award_tile_dense_widget.dart';
import 'award_widgets/award_tile_widget.dart';
import 'models/indiv_comp.dart';

Widget rankToAwardWidget(int rank, {double size: Dimen.ICON_SIZE}){
  if(rank == 1)
    return AwardFirstWidget(size: size);
  else if(rank == 2)
    return AwardSecondWidget(size: size);
  else if(rank == 3)
    return AwardThirdWidget(size: size);
  else
    return AwardOtherWidget(size: size);
}

class AwardFirstWidget extends StatelessWidget{

  final double size;

  const AwardFirstWidget({this.size: Dimen.ICON_SIZE});

  @override
  Widget build(BuildContext context) => GradientIcon(MdiIcons.trophy, colorStart: Colors.yellow, colorEnd: Colors.amber, size: size);

}

class AwardSecondWidget extends StatelessWidget{

  final double size;

  const AwardSecondWidget({this.size: Dimen.ICON_SIZE});

  @override
  Widget build(BuildContext context) => GradientIcon(MdiIcons.trophyVariant, colorStart: Colors.grey[300], colorEnd: Colors.grey[600], size: size);

}

class AwardThirdWidget extends StatelessWidget{

  final double size;

  const AwardThirdWidget({this.size: Dimen.ICON_SIZE});

  @override
  Widget build(BuildContext context) => GradientIcon(MdiIcons.trophyAward, colorStart: Colors.orange[500], colorEnd: Colors.brown[600], size: size);

}

class AwardOtherWidget extends StatelessWidget{

  final double size;

  const AwardOtherWidget({this.size: Dimen.ICON_SIZE});

  @override
  Widget build(BuildContext context) => GradientIcon(MdiIcons.rhombusMediumOutline, colorStart: Colors.grey[200], colorEnd: Colors.grey[400], size: size);

}

class AwardPageViewWidget extends StatelessWidget{

  final List<IndivCompAward> awards;
  final bool expanded;
  final EdgeInsets padding;

  const AwardPageViewWidget(this.awards, {this.expanded = false, this.padding});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<awards.length; i++)
      children.add(
        Padding(
          padding: padding,
          child: expanded?
          AwardTileWidget(i+1, awards[i]):
          AwardTileDenseWidget(i+1, awards[i])),
        );

    return SizedBox(
      height: AwardTileDenseWidget.height,
      child: PageView(children: children, physics: BouncingScrollPhysics()),
    );

  }

}

class AwardListWidget extends StatelessWidget{

  final List<IndivCompAward> awards;
  final int limit;
  final bool expanded;

  const AwardListWidget(this.awards, {this.limit, this.expanded = false});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<min(limit??awards.length, awards.length); i++) {
      children.add(expanded ? AwardTileWidget(i + 1, awards[i]) : AwardTileDenseWidget(i + 1, awards[i]));
      if(i<awards.length-1)
        children.add(SizedBox(height: 18.0));

    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children);

  }

}

class IndivCompAwardsPage extends StatefulWidget{

  final IndivComp comp;

  const IndivCompAwardsPage(this.comp);

  @override
  State<StatefulWidget> createState() => IndivCompAwardsPageState();

}

class IndivCompAwardsPageState extends State<IndivCompAwardsPage>{

  IndivComp get comp => widget.comp;

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Lista nagród'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(delegate: SliverChildListDelegate([

                AwardListWidget(comp.awards, expanded: true)

              ])),
          ),

        ],
      ),
    );

  }

}