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

class CoverImagePart extends StatefulWidget{

  const CoverImagePart({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoverImagePartState();

}

class CoverImagePartState extends State<CoverImagePart>{

  List<CircleCoverImageData> adaptiveImages;
  List<CircleCoverImageData> standardImages;

  @override
  void initState() {
    adaptiveImages = CircleCoverImageData.paths.where((image) => image.isAdaptive).toList();
    standardImages = CircleCoverImageData.paths.where((image) => !image.isAdaptive).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [

      SliverPadding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        sliver: SliverList(delegate: SliverChildListDelegate([

          const TitleShortcutRowWidget(title: 'Wybrane zdjęcie'),

          Consumer<CoverImageProvider>(
            builder: (context, prov, child) => CoverImageWidget(prov.coverImage),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          const TitleShortcutRowWidget(title: 'Adaptacyjne zdjęcia'),
        ])),
      ),

      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
        sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
          (context, index) => CoverImageWidget(adaptiveImages[index]),
          separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
          count: adaptiveImages.length
        ))
      ),

      SliverPadding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        sliver: SliverList(delegate: SliverChildListDelegate([
          const SizedBox(height: Dimen.SIDE_MARG),

          const TitleShortcutRowWidget(title: 'Pozostałe zdjęcie'),
        ])),
      ),

      SliverPadding(
          padding: const EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: Dimen.SIDE_MARG
          ),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => CoverImageWidget(standardImages[index]),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: standardImages.length
          ))
      ),

    ],
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
    while(true){
      await Future.delayed(const Duration(milliseconds: 2000));
      if (!mounted) return;
      setState(() => showNight = !showNight);
    }
  }

  @override
  void initState() {
    showNight = false;
    if(coverImage.isAdaptive) animate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<CoverImageProvider>(
      builder: (context, prov, child) => SizedBox(
          height: 200, //600 / MediaQuery.of(context).devicePixelRatio,
          child: Stack(
            fit: StackFit.expand,
            children: [

              InkWell(
                onTap: () => prov.coverImage = coverImage,
                child: coverImage.isAdaptive?
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: AssetImage('assets/images/circle/cover_images/${coverImage.firstFileName}'),
                        fit: BoxFit.cover,
                      ),
                      AnimatedOpacity(
                        opacity: showNight?1:0,
                        duration: const Duration(milliseconds: 300),
                        child: Image(
                          image: AssetImage('assets/images/circle/cover_images/${coverImage.secondFileName}'),
                          fit: BoxFit.cover
                        ),
                      )
                    ],
                  )
                ):
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                  clipBehavior: Clip.antiAlias,
                  child: Image(
                    image: AssetImage('assets/images/circle/cover_images/${coverImage.firstFileName}'),
                    fit: BoxFit.cover
                  ),
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

              Positioned(
                bottom: Dimen.ICON_MARG,
                right: Dimen.ICON_MARG,
                child: Text(
                    coverImage.firstAuthor,
                    style: AppTextStyle(
                        color: Colors.white,
                        shadow: true,
                        fontWeight: weight.halfBold
                    )),
              ),

              Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      opacity: prov.coverImage.code == coverImage.code?0:0.5,
                      duration: const Duration(milliseconds: 300),
                      child: Container(color: background_(context)),
                    ),
                  )
              ),

            ],
          )
      )
  );

}