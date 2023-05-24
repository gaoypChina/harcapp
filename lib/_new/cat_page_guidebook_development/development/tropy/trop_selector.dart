import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/widgets/spraw_tile_template_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_tile.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class TropSelector extends StatefulWidget{

  final void Function(Trop)? onSelected;
  final ScrollController? controller;

  const TropSelector({this.onSelected, this.controller, super.key});

  @override
  State<StatefulWidget> createState() => TropSelectorState();

}

class TropSelectorState extends State<TropSelector>{

  void Function(Trop)? get onSelected => widget.onSelected;
  ScrollController? get controller => widget.controller;

  late List<Trop> searchedTrops;

  @override
  void initState() {
    searchedTrops = Trop.allOwn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    controller: controller,
    slivers: [

      FloatingContainer.child(
        child: SearchField(
          hint: 'Szukaj tropów',
          margin: EdgeInsets.zero,
          onChanged: (text){

            text = remPolChars(text);
            if(text.isEmpty){
              setState(() => this.searchedTrops = Trop.allOwn);
              return;
            }

            List<Trop> searchedTrops = [];

            for(Trop trop in Trop.allOwn)
              if(remPolChars(trop.name).contains(text))
                searchedTrops.add(trop);

            setState(() => this.searchedTrops = searchedTrops);

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
          (context, index) => SimpleButton(
            onTap: onSelected==null?null:() => onSelected!.call(searchedTrops[index]),
            child: SizedBox(
              height: SprawTileTemplateWidget.height,
              child: TropTile(
                name: searchedTrops[index].name,
                category: searchedTrops[index].category,
                zuchTropName: searchedTrops[index].customIconTropName,
                completenessPercent: Trop.allOwn[index].completenessPercent,
              ),
            ),
          ),
          childCount: searchedTrops.length,
        )),
      ),

    ],
  );

}

Future<void> openTropSelector(
  BuildContext context,
  { void Function(Trop)? onSelected
  }) => openDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
          color: background_(context),
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: Column(
            children: [
              AppBar(
                title: const Text('Wybierz trop'),
                elevation: 0,
                centerTitle: true,
              ),
              Expanded(
                child: TropSelector(onSelected: onSelected),
              )
            ],
          ),
        )
      )
  );

Future<Trop?> selectTrop(BuildContext context) async {

  Trop? selected;

  await openTropSelector(
      context,
      onSelected: (trop){
        selected = trop;
        Navigator.pop(context);
      },
  );

  return selected;
}