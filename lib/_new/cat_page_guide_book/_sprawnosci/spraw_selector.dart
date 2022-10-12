import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/spraw_tile_template_widget.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

import 'models/spraw.dart';

class SprawSelector extends StatefulWidget{

  final List<Spraw> allSpraws;
  final void Function(Spraw)? onSelected;
  final ScrollController? controller;

  const SprawSelector({required this.allSpraws, this.onSelected, this.controller, super.key});

  @override
  State<StatefulWidget> createState() => SprawSelectorState();

}

class SprawSelectorState extends State<SprawSelector>{

  List<Spraw> get allSpraws => widget.allSpraws;
  void Function(Spraw)? get onSelected => widget.onSelected;
  ScrollController? get controller => widget.controller;

  late List<Spraw> searchedSpraws;

  @override
  void initState() {
    searchedSpraws = allSpraws;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const BouncingScrollPhysics(),
    controller: controller,
    slivers: [

      FloatingContainer.child(
        child: SearchField(
          hint: 'Szukaj sprawności',
          margin: EdgeInsets.zero,
          onChanged: (text){

            text = remPolChars(text);
            if(text.isEmpty){
              setState(() => this.searchedSpraws = allSpraws);
              return;
            }

            List<Spraw> searchedSpraws = [];

            for(Spraw spraw in allSpraws)
              if(remPolChars(spraw.title).contains(text))
                searchedSpraws.add(spraw);

            setState(() => this.searchedSpraws = searchedSpraws);

          },
        ),
        height: SearchField.height - SearchField.defMargVal
      ),

      SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.defMarg,
          right: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) => SprawTileTemplateWidget(
            spraw: searchedSpraws[index],
            onTap: onSelected==null?null:() => onSelected!.call(searchedSpraws[index]),
          ),
          childCount: searchedSpraws.length,
        )),
      ),

    ],
  );

}

Future<void> openSprawSelector(
    BuildContext context,
    { required List<Spraw> allSpraws,
      void Function(Spraw)? onSelected
    }) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(top: App.statusBarHeight),
      child: DraggableScrollableSheet(
          builder: (context, controller) =>
              BottomSheetDef(
                  childMargin: EdgeInsets.zero,
                  builder: (context) => SprawSelector(
                      controller: controller,
                      allSpraws: allSpraws,
                      onSelected: onSelected
                  )
              )
      ),
    )
);

Future<Spraw?> selectSpraw(BuildContext context, {required List<Spraw> allSpraws}) async {

  Spraw? selected;

  await openSprawSelector(
      context,
      allSpraws: allSpraws,
      onSelected: (spraw){
        selected = spraw;
        Navigator.pop(context);
      },
  );

  return selected;
}