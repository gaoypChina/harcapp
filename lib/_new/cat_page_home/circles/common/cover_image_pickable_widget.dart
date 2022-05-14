import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle_cover_image_data.dart';
import '../circle_page.dart';
import '../cover_image.dart';
import 'cover_image_selector_widget.dart';
import 'net_image_picker.dart';

class CoverImagePickableWidget extends StatefulWidget{

  final PaletteGenerator? palette;
  final CircleCoverImageData? initCoverImage;
  final double height;
  final bool removable;
  final void Function(CircleCoverImageData?)? onSelected;

  const CoverImagePickableWidget(
      this.palette,
      { this.initCoverImage,
        this.height = 200,
        this.removable = true,
        this.onSelected,
        Key? key
      }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => CoverImagePickableWidgetState();
  
}

class CoverImagePickableWidgetState extends State<CoverImagePickableWidget>{
  
  PaletteGenerator? get palette => widget.palette;
  double get height => widget.height;
  bool get removable => widget.removable;
  void Function(CircleCoverImageData?)? get onSelected => widget.onSelected;

  CircleCoverImageData? selCoverImage;
  
  @override
  void initState() {
    selCoverImage = widget.initCoverImage;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [

          if(selCoverImage == null)
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
            bottom: Dimen.DEF_MARG,
            right: Dimen.DEF_MARG,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                if(removable && selCoverImage != null)
                  Material(
                      borderRadius: BorderRadius.circular(Dimen.ICON_FOOTPRINT),
                      color: CirclePage.cardColor(context, palette),
                      clipBehavior: Clip.hardEdge,
                      child: IconButton(
                        icon: const Icon(MdiIcons.trashCanOutline),
                        onPressed: (){
                          setState(() => selCoverImage = null);
                        },
                      )
                  ),

                if(removable && selCoverImage != null)
                  const SizedBox(width: Dimen.DEF_MARG),

                Material(
                    borderRadius: BorderRadius.circular(Dimen.ICON_FOOTPRINT),
                    color: selCoverImage == null? Colors.transparent: CirclePage.cardColor(context, palette),
                    clipBehavior: Clip.hardEdge,
                    child: IconButton(
                      icon: const Icon(MdiIcons.imageOutline),
                      onPressed: () async {
                        selCoverImage = await selectCoverImage(selCoverImage);
                        onSelected?.call(selCoverImage);
                        setState(() {});
                      },
                    )
                ),

                const SizedBox(width: Dimen.DEF_MARG),

                Material(
                    borderRadius: BorderRadius.circular(Dimen.ICON_FOOTPRINT),
                    color: selCoverImage == null? Colors.transparent: CirclePage.cardColor(context, palette),
                    clipBehavior: Clip.hardEdge,
                    child: IconButton(
                      icon: const Icon(MdiIcons.linkBoxOutline),
                      onPressed: () async {
                        CircleCoverImageData? _coverImage = await selectNetCoverImage(
                            selCoverImage!.local?'':selCoverImage!.code
                        );
                        if(_coverImage == null) return;

                        onSelected?.call(_coverImage);
                        setState(() => selCoverImage = _coverImage);
                      },
                    )
                ),

              ],
            ),
          )

        ],
      )
  );


  Future<CircleCoverImageData?> selectCoverImage(CircleCoverImageData? currentCoverImage) async {

    CircleCoverImageData? selectedCoverImage;

    await openDialog(
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Material(
              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
              child: Column(
                children: [

                  Expanded(
                    child: CoverImageSelectorWidget(
                      selected: selectedCoverImage,
                      onSelected: (coverImage) => selectedCoverImage = coverImage,
                      separateAdaptiveCoverImages: true,
                      canChooseNull: true,
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: SimpleButton.from(
                            context: context,
                            text: 'Wróć',
                            icon: MdiIcons.arrowLeft,
                            onTap: (){
                              selectedCoverImage = currentCoverImage;
                              Navigator.pop(context);
                            }
                        ),
                      ),

                      Expanded(
                        child: SimpleButton.from(
                            context: context,
                            text: 'Wybierz',
                            icon: MdiIcons.check,
                            iconLeading: false,
                            onTap: () => Navigator.pop(context)
                        ),
                      )
                    ],
                  )

                ],
              )
          ),
        )
    );

    return selectedCoverImage;

  }

  Future<CircleCoverImageData?> selectNetCoverImage(String? initLink) async {

    TextEditingController controller = TextEditingController(text: initLink);

    await openDialog(
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: Material(
                  borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NetImagePickerWidget(controller: controller),

                      Row(
                        children: [
                          Expanded(
                            child: SimpleButton.from(
                                context: context,
                                text: 'Wróć',
                                icon: MdiIcons.arrowLeft,
                                onTap: (){
                                  Navigator.pop(context);
                                }
                            ),
                          ),

                          Expanded(
                            child: SimpleButton.from(
                                context: context,
                                text: 'Wybierz',
                                icon: MdiIcons.check,
                                iconLeading: false,
                                onTap: (){
                                  Navigator.pop(context);
                                }
                            ),
                          )
                        ],
                      )

                    ],
                  )
              ),
            ),
          ),
        )
    );

    if(controller.text == null || controller.text.isEmpty)
      return null;

    return CircleCoverImageData(false, [
      GraphicalResource(controller.text, null)
    ]);

  }
  
}