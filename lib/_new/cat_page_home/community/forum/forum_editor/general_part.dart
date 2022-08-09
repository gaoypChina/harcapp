import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/forum_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/common/cover_image_selectable_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:harcapp_core/dimen.dart';

import '../model/forum.dart';

class GeneralPart extends StatefulWidget{

  final PaletteGenerator? palette;

  const GeneralPart({this.palette, super.key});

  @override
  State<StatefulWidget> createState() => GeneralPartState();

}

class GeneralPartState extends State<GeneralPart>{

  PaletteGenerator? get palette => widget.palette;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        child: Consumer<CoverImageProvider>(
            builder: (context, prov, child) => CoverImageSelectableWidget(
              palette,
              initCoverImage: prov.coverImage,
              removable: false,
              onSelected: (coverImage) => prov.coverImage = coverImage,
            )
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Consumer<DescriptionProvider>(
        builder: (context, prov, child) => AppTextFieldHint(
          hint: 'Opis kręgu:',
          hintTop: 'Opis kręgu',
          controller: prov.descriptionController,
          maxLength: Forum.maxLenDescription,
          maxLines: null,
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Consumer<ColorsKeyProvider>(
        builder: (context, prov, child) => SwitchListTile(
          activeColor: CommunityCoverColors.strongColor(context, palette),
          contentPadding: const EdgeInsets.symmetric(horizontal: 3.0),
          title: Text('Tło kolorystyczne', style: AppTextStyle()),
          value: prov.colorsKey == 'auto',
          onChanged: (bool checked) => prov.colorsKey = (checked?'auto':'none')
        ),
      ),
    ],
  );

}
