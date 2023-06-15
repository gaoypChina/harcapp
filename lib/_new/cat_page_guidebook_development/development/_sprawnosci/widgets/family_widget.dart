import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'spraw_tile_widget.dart';

class FamilyWidget extends StatelessWidget{

  final SprawFamily sprawFamily;
  final String? groupName;
  final void Function(Spraw spraw)? onPicked;

  const FamilyWidget(this.sprawFamily, {this.groupName, this.onPicked, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        if(sprawFamily.title != null)
          Padding(
            padding: const EdgeInsets.only(
              top: 2*Dimen.ICON_MARG,
            ),
            child: Row(
              children: [

                const SizedBox(height: Dimen.ICON_FOOTPRINT, width: Dimen.ICON_FOOTPRINT,),

                Expanded(
                  child: Text(
                    sprawFamily.title!.toUpperCase(),
                    style: AppTextStyle(
                      fontWeight: weight.bold,
                      fontSize: Dimen.TEXT_SIZE_BIG,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                if(sprawFamily.fragment != null)
                  IconButton(
                      icon: Icon(MdiIcons.dotsVertical),
                      onPressed: () => showScrollBottomSheet(
                          context: context,
                          builder: (context) => BottomSheetDef(
                              title: sprawFamily.title,
                              builder: (context) => Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                      sprawFamily.fragment!,
                                      style: AppTextStyle(
                                          fontSize: Dimen.TEXT_SIZE_BIG,
                                          fontStyle: FontStyle.italic,
                                          height: 1.2,
                                          fontWeight: weight.halfBold
                                      )
                                  ),
                                  const SizedBox(height: 2*Dimen.BOTTOM_SHEET_MARG),
                                  if(sprawFamily.fragmentAuthor != null)
                                    Text(
                                        '~ ${sprawFamily.fragmentAuthor}',
                                        style: AppTextStyle(
                                            fontSize: Dimen.TEXT_SIZE_BIG,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: weight.halfBold,
                                            color: hintEnab_(context)
                                        ),
                                        textAlign: TextAlign.end
                                    ),
                                ],
                              )
                          )
                      )
                  )
                else
                  const SizedBox(height: Dimen.ICON_FOOTPRINT, width: Dimen.ICON_FOOTPRINT,),
              ],
            ),
          ),

        if(sprawFamily.tags != null)
          Padding(
            padding: const EdgeInsets.only(left: Dimen.ICON_MARG, right: Dimen.ICON_MARG, bottom: Dimen.ICON_MARG),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 14.0,
              runSpacing: 14.0,
              children: sprawFamily.tags!.map((tag) => Text(tag, style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context)))).toList(),
            ),
          ),

        Column(
          children: sprawFamily.spraws!.map((spraw) => SprawTileWidget(
              spraw: spraw,
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              onPicked: onPicked
          )).toList(),
        ),

      ],
    );
  }

}