import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CoverImageSelectorWidget extends StatefulWidget{

  final CircleCoverImageData selected;
  final void Function(CircleCoverImageData) onSelected;
  final bool separateAdaptiveCoverImages;
  final bool canChooseNull;

  const CoverImageSelectorWidget({
    this.selected,
    this.onSelected,
    this.separateAdaptiveCoverImages = false,
    this.canChooseNull = false,
    Key key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoverImageSelectorWidgetState();

}

class CoverImageSelectorWidgetState extends State<CoverImageSelectorWidget>{

  CircleCoverImageData get initiallySelected => widget.selected;
  void Function(CircleCoverImageData) get onSelected => widget.onSelected;
  bool get separateAdaptiveCoverImages => widget.separateAdaptiveCoverImages;
  bool get canChooseNull => widget.canChooseNull;

  List<CircleCoverImageData> adaptiveImages;
  List<CircleCoverImageData> standardImages;

  CircleCoverImageData selected;

  @override
  void initState() {
    adaptiveImages = CircleCoverImageData.paths.where((image) => image.isAdaptive).toList();
    standardImages = CircleCoverImageData.paths.where((image) => !image.isAdaptive).toList();

    if(separateAdaptiveCoverImages) {
      List<CircleCoverImageData> separated = [];
      for (CircleCoverImageData coverImage in adaptiveImages) {
        separated.add(CircleCoverImageData(true, [GraphicalResource(coverImage.firstFileName, coverImage.firstAuthor)]));
        separated.add(CircleCoverImageData(true, [GraphicalResource(coverImage.secondFileName, coverImage.secondAuthor)]));
      }
      standardImages.insertAll(0, separated);
      adaptiveImages.clear();
    }

    selected = initiallySelected;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [

      SliverPadding(
        padding: const EdgeInsets.only(
          top: Dimen.SIDE_MARG,
          left: Dimen.SIDE_MARG,
          right: Dimen.SIDE_MARG,
        ),
        sliver: SliverList(delegate: SliverChildListDelegate([

          Text(
            'Wybrane zdjęcie',
            style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_BIG,
              fontWeight: weight.halfBold
            ),
          ),

          const SizedBox(height: Dimen.ICON_MARG),

          if(selected == null)
            SizedBox(
              height: CoverImageWidget.height,
              child: Icon(
                  MdiIcons.imageOffOutline,
                  size: 100,
                  color: backgroundIcon_(context)
              ),
            )
          else
            CoverImageWidget(selected, selected: true),

          //Consumer<CoverImageProvider>(
          //  builder: (context, prov, child) => CoverImageWidget(prov.coverImage),
          //),

          if(adaptiveImages.isNotEmpty)
            const SizedBox(height: Dimen.SIDE_MARG + Dimen.ICON_MARG),

          if(adaptiveImages.isNotEmpty)
            Text(
              'Adaptacyjne zdjęcia',
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold
              ),
            ),

          if(adaptiveImages.isNotEmpty)
            const SizedBox(height: Dimen.ICON_MARG),

        ])),
      ),

      if(adaptiveImages.isNotEmpty)
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
            (context, index) => CoverImageWidget(
              adaptiveImages[index],
              selected: adaptiveImages[index] == selected,
              onTap: (){
                setState(() => selected = adaptiveImages[index]);
                onSelected?.call(adaptiveImages[index]);
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
            count: adaptiveImages.length
          ))
        ),

      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
        sliver: SliverList(delegate: SliverChildListDelegate([
          const SizedBox(height: Dimen.SIDE_MARG + Dimen.ICON_MARG),

          Text(
            'Pozostałe zdjęcia',
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold
            ),
          ),

          const SizedBox(height: Dimen.ICON_MARG),
        ])),
      ),

      SliverPadding(
          padding: const EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: Dimen.SIDE_MARG
          ),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => CoverImageWidget(
                standardImages[index],
                selected: standardImages[index] == selected,
                onTap: (){
                  setState(() => selected = standardImages[index]);
                  onSelected?.call(standardImages[index]);
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: standardImages.length
          ))
      ),

    ],
  );

}

class CoverImageWidget extends StatefulWidget{

  static double height = 200.0;

  final CircleCoverImageData coverImage;
  final bool selected;
  final void Function() onTap;

  const CoverImageWidget(this.coverImage, {this.selected, this.onTap, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoverImageWidgetState();

}

class CoverImageWidgetState extends State<CoverImageWidget>{

  CircleCoverImageData get coverImage => widget.coverImage;
  bool get selected => widget.selected;
  void Function() get onTap => widget.onTap;

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
  Widget build(BuildContext context) => SizedBox(
      height: CoverImageWidget.height, //600 / MediaQuery.of(context).devicePixelRatio,
      child: InkWell(
        onTap: onTap,
        child: Material(
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

                if(coverImage.isAdaptive)
                  AnimatedOpacity(
                    opacity: showNight?1:0,
                    duration: const Duration(milliseconds: 300),
                    child: Image(
                        image: AssetImage('assets/images/circle/cover_images/${coverImage.secondFileName}'),
                        fit: BoxFit.cover
                    ),
                  ),

                Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedOpacity(
                        opacity: selected?0.8:0,
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
                        opacity: selected?0:0.5,
                        duration: const Duration(milliseconds: 300),
                        child: Container(color: background_(context)),
                      ),
                    )
                ),
              ],
            )
        )
      ),
  );

}