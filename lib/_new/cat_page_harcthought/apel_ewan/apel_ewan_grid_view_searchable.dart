import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:tuple/tuple.dart';

import 'apel_ewan.dart';
import 'apel_ewan_folder.dart';
import 'apel_ewan_folder_viewer_page.dart';
import 'apel_ewan_grid_view.dart';

class ApelEwanGridViewSearchable<T extends ApelEwanFolder> extends StatefulWidget{

  static const int crossCount = ApelEwanGridView.crossCount;

  final T folder;
  final EdgeInsets padding;
  final bool animate;
  final void Function(ApelEwan, String?)? onTap;

  const ApelEwanGridViewSearchable({
    required this.folder,
    this.padding = const EdgeInsets.all(Dimen.ICON_MARG),
    this.animate = false,
    this.onTap,
    super.key
  });

  @override
  State<StatefulWidget> createState() => ApelEwanGridViewSearchableState<T>();

}

class ApelEwanGridViewSearchableState<T extends ApelEwanFolder> extends State<ApelEwanGridViewSearchable<T>>{

  T get folder => widget.folder;
  EdgeInsets get padding => widget.padding;
  bool get animate => widget.animate;
  void Function(ApelEwan, String?)? get onTap => widget.onTap;

  late List<ApelEwan> searchedApelEwans;

  @override
  void initState() {
    searchedApelEwans = folder.apelEwans;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [

      FloatingContainer(
        builder: (context, __, _) => SearchField(
          background: backgroundIcon_(context),
          preBackground: background_(context),
          color: background_(context),
          hint: 'Szukaj...',
          onChanged: (text){

            if(text.isEmpty)
              setState(() => this.searchedApelEwans = folder.apelEwans);

            List<ApelEwan> searchedApelEwans = [];

            text = remPolChars(text);
            for(ApelEwan apelEwan in folder.apelEwans) {
              if (remPolChars(apelEwan.siglum
                  .replaceAll(' ', '')
                  .replaceAll(',', '')
                  .replaceAll('-', '')
              ).contains(text.replaceAll(' ', '')
                  .replaceAll(',', '')
                  .replaceAll('-', '')
              )) {
                searchedApelEwans.add(apelEwan);
                continue;
              }

              for (String title in apelEwan.subgroupTitle.values)
                if (remPolChars(title).contains(text)) {
                  searchedApelEwans.add(apelEwan);
                  break;
                }
            }

            setState(() => this.searchedApelEwans = searchedApelEwans);

          },
        ),
        height: SearchField.height,
      ),

      SliverPadding(
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        sliver: SliverGrid.count(
          crossAxisCount: 3,
          crossAxisSpacing: Dimen.ICON_MARG,
          mainAxisSpacing: Dimen.ICON_MARG,
          childAspectRatio: 1,
          children: searchedApelEwans.map((apelEwan) => ApelEwanThumbnailWidget(
            apelEwan,
            onTap: (apelEwa, subgroup) => pushPage(context, builder: (context) => ApelEwanFolderViewerPage(
              searchedApelEwans.map((apelEwan) => Tuple2(apelEwan, subgroup)).toList(),
              apelEwan,
            )),
          )).toList(),
        ),
      ),
    ],
  );

}