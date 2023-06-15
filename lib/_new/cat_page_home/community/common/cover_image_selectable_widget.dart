import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/common/cover_image.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'cover_image_selector_dialog.dart';

class CoverImageSelectableWidget extends StatefulWidget{

  final PaletteGenerator? palette;
  final CommunityCoverImageData? initCoverImage;
  final double height;
  final bool showAdaptiveImages;
  final bool separateAdaptiveImages;
  final bool removable;
  final void Function(CommunityCoverImageData?)? onSelected;
  final Widget Function(BuildContext)? emptyBuilder;

  const CoverImageSelectableWidget(
      this.palette,
      { this.initCoverImage,
        this.height = 200,
        this.showAdaptiveImages = true,
        this.separateAdaptiveImages = false,
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
  bool get showAdaptiveImages => widget.showAdaptiveImages;
  bool get separateAdaptiveImages => widget.separateAdaptiveImages;
  bool get removable => widget.removable;
  void Function(CommunityCoverImageData?)? get onSelected => widget.onSelected;
  Widget Function(BuildContext)? get emptyBuilder => widget.emptyBuilder;

  CommunityCoverImageData? selCoverImage;
  
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
      selCoverImage = await openSelectCoverImageDialog(
        context,
        selCoverImage,

        showAdaptiveCoverImages: showAdaptiveImages,
        separateAdaptiveCoverImages: separateAdaptiveImages,
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
                color: CommunityCoverColors.cardColor(context, palette),
              ),
            )
          else if(selCoverImage != null)
            CoverImageWidget(selCoverImage!),

          Positioned(
            bottom: Dimen.ICON_MARG,
            right: Dimen.ICON_MARG,
            child: Material(
                borderRadius: BorderRadius.circular(Dimen.ICON_FOOTPRINT),
                color: selCoverImage == null? Colors.transparent: CommunityCoverColors.cardColor(context, palette),
                clipBehavior: Clip.hardEdge,
                child: IconButton(
                  icon: Icon(MdiIcons.imageOutline),
                  onPressed: () async {
                    selCoverImage = await openSelectCoverImageDialog(
                        context,
                        selCoverImage,

                        showAdaptiveCoverImages: showAdaptiveImages,
                        separateAdaptiveCoverImages: separateAdaptiveImages,
                        canChooseNull: removable
                    );
                    onSelected?.call(selCoverImage);
                    setState(() {});
                  },
                )
            ),
          ),

          if(removable)
            Positioned(
              bottom: Dimen.ICON_MARG,
              right: Dimen.ICON_FOOTPRINT + Dimen.ICON_MARG + Dimen.ICON_MARG,
              child: Material(
                  borderRadius: BorderRadius.circular(Dimen.ICON_FOOTPRINT),
                  color: selCoverImage == null? Colors.transparent: CommunityCoverColors.cardColor(context, palette),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    icon: Icon(MdiIcons.trashCanOutline),
                    onPressed: () {
                      selCoverImage = null;
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