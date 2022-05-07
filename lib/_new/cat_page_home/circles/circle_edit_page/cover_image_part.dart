import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_edit_page/providers.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../circle_palette_generator.dart';

class CoverImagePart extends StatefulWidget{

  const CoverImagePart({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoverImagePartState();

}

class CoverImagePartState extends State<CoverImagePart>{

  @override
  Widget build(BuildContext context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    itemBuilder: (context, index) => CoverImageWidget(CircleCoverImageData.paths[index]),
    separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
    itemCount: CircleCoverImageData.paths.length,
  );

}

class CoverImageWidget extends StatefulWidget{

  final CircleCoverImageData coverImage;

  const CoverImageWidget(this.coverImage, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoverImageWidgetState();

}

class CoverImageWidgetState extends State<CoverImageWidget>{

  CircleCoverImageData get coverImage => widget.coverImage;

  bool showNight;

  void animate() async {
    showNight = false;
    while(true){
      await Future.delayed(const Duration(milliseconds: 2000));
      if (!mounted) return;
      setState(() => showNight = !showNight);
    }
  }

  PaletteGenerator paletteGeneratorFirst;
  PaletteGenerator paletteGeneratorSecond;

  Future<void> initPaletteGenerator() async {
    paletteGeneratorFirst = await getPaletteGenerator(true, coverImage.firstFileName);
    paletteGeneratorSecond = await getPaletteGenerator(true, coverImage.secondFileName);

    setState(() {});
  }

  @override
  void initState() {
    // initPaletteGenerator();
    if(coverImage.isAdaptive) animate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<CoverImageProvider>(
    builder: (context, prov, child) => Stack(
      children: [

        InkWell(
          onTap: () => prov.coverImage = coverImage,
          child: coverImage.isAdaptive?
          Material(
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Image(image: AssetImage('assets/images/circle/cover_images/${coverImage.firstFileName}')),
                AnimatedOpacity(
                  opacity: showNight?1:0,
                  duration: const Duration(milliseconds: 300),
                  child: Image(image: AssetImage('assets/images/circle/cover_images/${coverImage.secondFileName}')),
                )
              ],
            )
          ):
          Material(
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            clipBehavior: Clip.antiAlias,
            child: Image(image: AssetImage('assets/images/circle/cover_images/${coverImage.firstFileName}')),
          ),
        ),

        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: prov.coverImage.code == coverImage.code?0.8:0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(MdiIcons.checkOutline, size: 80.0, color: Colors.white),
            ),
          )
        ),

        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: prov.coverImage.code == coverImage.code?0:0.5,
              duration: const Duration(milliseconds: 300),
              child: Container(color: Colors.white),
            ),
          )
        )

      ],
    )
  );

}