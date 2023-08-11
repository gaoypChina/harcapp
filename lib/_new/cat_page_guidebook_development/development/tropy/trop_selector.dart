import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/widgets/spraw_tile_template_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_tile.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'trop_shared_previews_loader.dart';

class TropSelector extends StatefulWidget{

  final void Function(String?, String?)? onSelected;
  final ScrollController? controller;

  const TropSelector({this.onSelected, this.controller, super.key});

  @override
  State<StatefulWidget> createState() => TropSelectorState();

}

class TropSelectorState extends State<TropSelector>{

  void Function(String?, String?)? get onSelected => widget.onSelected;
  ScrollController? get controller => widget.controller;

  late List<Trop> searchedOwnTrops;
  late List<TropSharedPreviewData> searchedSharedTrops;

  @override
  void initState() {
    searchedOwnTrops = Trop.allOwn;
    searchedSharedTrops = TropSharedPreviewData.all??[];

    if(TropSharedPreviewData.all == null)
      tropSharedPreviewsLoader.run();

    super.initState();
  }

  List<Widget> getSlivers(){
    List<Widget> slivers = [
      FloatingContainer.child(
          child: SearchField(
            hint: 'Szukaj tropów',
            margin: EdgeInsets.zero,
            onChanged: (text){

              text = remPolChars(text);
              if(text.isEmpty){
                setState(() => this.searchedOwnTrops = Trop.allOwn);
                setState(() => searchedSharedTrops = TropSharedPreviewData.all??[]);
                return;
              }

              List<Trop> searchedOwnTrops = [];

              for(Trop trop in Trop.allOwn)
                if(remPolChars(trop.name).contains(text))
                  searchedOwnTrops.add(trop);

              setState(() => this.searchedOwnTrops = searchedOwnTrops);

              // Run shared trop search.

            },
          ),
          height: SearchField.height - SearchField.defMargVal
      )
    ];

    if(Trop.allOwn.isEmpty && !TropSharedPreviewData.hasAny)
      slivers.add(SliverFillRemaining(
        child: Center(
            child: EmptyMessageWidget(
              text: 'Nie masz rozpoczętych\nżadnych tropów',
              icon: Trop.icon,
            )
        ),
      ));
    else if(searchedOwnTrops.isEmpty && searchedSharedTrops.isEmpty)
      slivers.add(SliverFillRemaining(
        child: Center(
            child: EmptyMessageWidget(
              text: 'Brak tropów spełniających\nkryteria wyszukiwania',
              icon: Trop.icon,
            )
        ),
      ));
    else{

      if(searchedOwnTrops.isNotEmpty)
        slivers.add(SliverList(delegate: SliverChildListDelegate([
          const Padding(
            padding: EdgeInsets.only(top: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
            child: TitleShortcutRowWidget(title: 'Moje lokalne tropy', textAlign: TextAlign.left),
          )
        ])));

      slivers.add(SliverList(delegate: SliverChildBuilderDelegate(
        (context, index) => SimpleButton(
          radius: 0,
          onTap: onSelected==null?null:() => onSelected!.call(
              searchedOwnTrops[index].lclId, null
          ),
          child: SizedBox(
            height: SprawTileTemplateWidget.height,
            child: Padding(
              padding: const EdgeInsets.only(
                right: Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
              ),
              child: TropTile(
                name: searchedOwnTrops[index].name,
                category: searchedOwnTrops[index].category,
                zuchTropName: searchedOwnTrops[index].customIconTropName,
                completenessPercent: searchedOwnTrops[index].completenessPercent,
              ),
            ),
          ),
        ),
        childCount: searchedOwnTrops.length,
      )),
      );

      if(searchedSharedTrops.isNotEmpty)
        slivers.add(SliverList(delegate: SliverChildListDelegate([
          const Padding(
          padding: EdgeInsets.only(top: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
            child: TitleShortcutRowWidget(title: 'Udostępnione tropy', textAlign: TextAlign.left)
          )
        ])));

      slivers.add(SliverList(delegate: SliverChildBuilderDelegate(
        (context, index) => SimpleButton(
          radius: 0,
          onTap: onSelected==null?null:() => onSelected!.call(
              null, searchedSharedTrops[index].key
          ),
          child: SizedBox(
            height: SprawTileTemplateWidget.height,
            child: Padding(
              padding: const EdgeInsets.only(
                right: Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
              ),
              child: TropTile(
                name: searchedSharedTrops[index].name,
                category: searchedSharedTrops[index].category,
                zuchTropName: searchedSharedTrops[index].customIconTropName,
                completenessPercent: searchedSharedTrops[index].completenessPercent,
              )
            ),
          ),
        ),
        childCount: searchedSharedTrops.length,
      )),
      );

    }

    return slivers;

  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    controller: controller,
    slivers: getSlivers(),
  );

}

Future<void> openTropSelector(
    BuildContext context,
    { void Function(String? lclId, String? tropKey)? onSelected
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

Future<(String?, String?)> selectTrop(BuildContext context) async {

  String? selLclId;
  String? selTropKey;

  await openTropSelector(
    context,
    onSelected: (lclId, tropKey){
      selLclId = lclId;
      selTropKey = tropKey;
      Navigator.pop(context);
    },
  );

  return (selLclId, selTropKey);
}