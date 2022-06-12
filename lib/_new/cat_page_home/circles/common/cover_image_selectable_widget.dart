import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle_cover_image_data.dart';
import '../circle_page.dart';
import '../cover_image.dart';
import 'cover_image_selector_widget.dart';

class CoverImageSelectableWidget extends StatefulWidget{

  final PaletteGenerator? palette;
  final CircleCoverImageData? initCoverImage;
  final double height;
  final bool removable;
  final void Function(CircleCoverImageData?)? onSelected;
  final Widget Function(BuildContext)? emptyBuilder;

  const CoverImageSelectableWidget(
      this.palette,
      { this.initCoverImage,
        this.height = 200,
        this.removable = true,
        this.onSelected,
        this.emptyBuilder,
        Key? key
      }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => CoverImageSelectableWidgetState();
  
}

class CoverImageSelectableWidgetState extends State<CoverImageSelectableWidget>{
  
  PaletteGenerator? get palette => widget.palette;
  double get height => widget.height;
  bool get removable => widget.removable;
  void Function(CircleCoverImageData?)? get onSelected => widget.onSelected;
  Widget Function(BuildContext)? get emptyBuilder => widget.emptyBuilder;

  CircleCoverImageData? selCoverImage;
  
  @override
  void initState() {
    selCoverImage = widget.initCoverImage;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) =>
  selCoverImage == null && emptyBuilder != null?
  SimpleButton(
    child: emptyBuilder!.call(context),
    onTap: () async {
      selCoverImage = await selectCoverImage(
          context,
          selCoverImage,
          canChooseNull: removable
      );
      onSelected?.call(selCoverImage);
      setState(() {});
    },
  ):
  SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [

          if(selCoverImage == null && emptyBuilder == null)
            Container(
              color: backgroundIcon_(context),
              child: Icon(
                MdiIcons.imageOffOutline,
                size: 100,
                color: CirclePage.cardColor(context, palette),
              ),
            )
          else
            CoverImage(selCoverImage),

          Positioned(
            bottom: Dimen.ICON_MARG,
            right: Dimen.ICON_MARG,
            child: Material(
                borderRadius: BorderRadius.circular(Dimen.ICON_FOOTPRINT),
                color: selCoverImage == null? Colors.transparent: CirclePage.cardColor(context, palette),
                clipBehavior: Clip.hardEdge,
                child: IconButton(
                  icon: const Icon(MdiIcons.imageOutline),
                  onPressed: () async {
                    selCoverImage = await selectCoverImage(
                        context,
                        selCoverImage,
                        canChooseNull: removable
                    );
                    onSelected?.call(selCoverImage);
                    setState(() {});
                  },
                )
            ),
          )

        ],
      )
  );

}