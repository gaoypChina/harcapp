import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_other/games/data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'org_cards/all_data.dart';


class OrganizationsPage extends StatefulWidget {

  @override
  State createState() => OrganizationsPageState();

}

class OrganizationsPageState extends State<OrganizationsPage>{

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Organizacje harcerskie i skautowe'),
            centerTitle: true,
            floating: true,
            backgroundColor: background_(context),
          ),

          SliverPadding(
            padding: EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(
                delegate: SliverChildSeparatedBuilderDelegate(
                    (context, index) => orgCardWidgets[index],
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: Dimen.SIDE_MARG),
                    count: orgCardWidgets.length
                )
            ),
          )

        ],
      ),
    );

  }

}
