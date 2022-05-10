import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_editor/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../cover_image_selector_widget.dart';

class CoverImagePart extends StatelessWidget{

  const CoverImagePart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<CoverImageProvider>(
      builder: (context, prov, child) => CoverImageSelectorWidget(
        selected: prov.coverImage,
        onSelected: (coverImage) => prov.coverImage = coverImage,
      ),
  );

}