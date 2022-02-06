import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/providers.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/family_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/view_all_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'widgets/common.dart';

class SprawGroupPage extends StatefulWidget {

  final SprawGroup group;

  SprawGroupPage(this.group);

  @override
  State createState() => SprawGroupPageState();

}

class SprawGroupPageState extends State<SprawGroupPage> {

  @override
  Widget build(BuildContext context) {

    CurrentSprawGroupProvider currentSprawGroupProv = Provider.of<CurrentSprawGroupProvider>(context, listen: false);

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            floating: true,
            leading: Hero(
              tag: 'BACK${widget.group.id}',
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(MdiIcons.arrowLeft),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            title: Hero(
                tag: 'TITLE${widget.group.id}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    widget.group.title,
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: appBarTextEnab_(context)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
            ),
            centerTitle: true,
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
              return Padding(
                padding: EdgeInsets.only(bottom: index < widget.group.families.length - 1?2*Dimen.ICON_MARG:0),
                child: FamilyWidget(
                    widget.group.families[index],
                    groupName: widget.group.title,
                    onPicked: (data){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllSprawPage(
                              [widget.group],
                              initIndex: widget.group.allSpraws.indexOf(data),
                              heroTagId: widget.group.id,

                              onClaimed: (spraw) => currentSprawGroupProv.notify(),
                              onSaveChanged: (spraw) => currentSprawGroupProv.notify(),
                              onReqComplChanged: (spraw) => currentSprawGroupProv.notify(),
                              onCompleted: (spraw) => currentSprawGroupProv.notify(),
                              onAbandoned: (spraw) => currentSprawGroupProv.notify(),
                              onStartStop: (spraw, inProgress) => currentSprawGroupProv.notify(),

                            ),
                          )
                      );
                    }
                ),
              );
            },
                childCount: widget.group.families.length
            ),
          ),

        ],
      ),
    );

  }
}

