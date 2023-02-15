import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/widgets/spraw_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class ViewAllSprawPage extends StatefulWidget{

  final List<SprawGroup> sprawGroupList;
  final int initIndex;
  final String? heroTagId;

  final void Function(Spraw)? onClaimed;
  final void Function(Spraw)? onSaveChanged;
  final void Function(Spraw)? onReqComplChanged;
  final void Function(Spraw)? onCompleted;
  final void Function(Spraw)? onAbandoned;
  final void Function(Spraw, bool)? onStartStop;

  const ViewAllSprawPage(
      this.sprawGroupList,
      {this.initIndex=0,
        this.heroTagId,

        this.onClaimed,
        this.onSaveChanged,
        this.onReqComplChanged,
        this.onCompleted,
        this.onAbandoned,
        this.onStartStop,

      });

  @override
  State<StatefulWidget> createState() => ViewAllSprawPageState();

}

class ViewAllSprawPageState extends State<ViewAllSprawPage>{

  List<SprawGroup> get sprawGroupList => widget.sprawGroupList;

  void Function(Spraw)? get onClaimed => widget.onClaimed;
  void Function(Spraw)? get onSaveChanged => widget.onSaveChanged;
  void Function(Spraw)? get onReqComplChanged => widget.onReqComplChanged;
  void Function(Spraw)? get onCompleted => widget.onCompleted;
  void Function(Spraw)? get onAbandoned => widget.onAbandoned;
  void Function(Spraw, bool)? get onStartStop => widget.onStartStop;

  late List<Spraw> allItems;

  PageController? controller;

  @override
  void initState() {

    allItems = [];

    for(SprawGroup sprawGroup in widget.sprawGroupList)
      allItems.addAll(sprawGroup.allSpraws);

    controller = PageController(initialPage: widget.initIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget title = Text(
      sprawGroupList.isNotEmpty?sprawGroupList[0].title:'Przeglądaj sprawności',
      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: appBarTextEnab_(context)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return BottomNavScaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

          SliverAppBar(
            floating: true,
            leading:
            widget.heroTagId == null || sprawGroupList.isEmpty?null:
            Hero(
              tag: 'BACK${sprawGroupList[0].id}',
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(MdiIcons.arrowLeft),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            title:
            widget.heroTagId==null?
            title:
            Hero(
              tag: 'TITLE${widget.heroTagId}',
              child: Material(
                color: Colors.transparent,
                child: title,
              ),
            ),
            centerTitle: true,
          )
        ],
        body: PageView.builder(
          controller: controller,
          physics: BouncingScrollPhysics(),
          itemCount: allItems.length,
          itemBuilder: (context, index) => SprawWidget(
            allItems[index],
            showBack: false,
            iconHeroTag: true,

            onClaimed: () => onClaimed!(allItems[index]),
            onSaveChanged: () => onSaveChanged!(allItems[index]),
            onReqComplChanged: () => onReqComplChanged!(allItems[index]),
            onCompleted: () => onCompleted!(allItems[index]),
            onAbandoned: () => onAbandoned!(allItems[index]),
            onStartStop: (inProgress) => onStartStop!(allItems[index], inProgress),
          ),
        ),
      )
    );

  }

}