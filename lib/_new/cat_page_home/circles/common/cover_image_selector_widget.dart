import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/circle.dart';

class CoverImageSelectorWidget extends StatefulWidget{

  final CircleCoverImageData? selected;
  final void Function(CircleCoverImageData?)? onSelected;
  final bool separateAdaptiveCoverImages;
  final bool canChooseNull;

  const CoverImageSelectorWidget({
    this.selected,
    this.onSelected,
    this.separateAdaptiveCoverImages = false,
    this.canChooseNull = false,
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoverImageSelectorWidgetState();

}

class CoverImageSelectorWidgetState extends State<CoverImageSelectorWidget>{

  CircleCoverImageData? get initiallySelected => widget.selected;
  void Function(CircleCoverImageData?)? get onSelected => widget.onSelected;
  bool get separateAdaptiveCoverImages => widget.separateAdaptiveCoverImages;
  bool get canChooseNull => widget.canChooseNull;

  late List<CircleCoverImageData> adaptiveLocalImages;
  late List<CircleCoverImageData> standardLocalImages;

  CircleCoverImageData? get selected{
    if(bottomIndex == 0) return _selectedLocal;
    else /*if(bottomIndex == 1)*/ return CircleCoverImageData.from(controller.text);
  }

  set selected(CircleCoverImageData? value){
    if(bottomIndex == 0) _selectedLocal = value;
    else if(bottomIndex == 1) controller.text = value?.code??'';
  }

  CircleCoverImageData? _selectedLocal;

  late TextEditingController controller;

  late int bottomIndex;

  @override
  void initState() {
    adaptiveLocalImages = CircleCoverImageData.paths.where((image) => image.isAdaptive).toList();
    standardLocalImages = CircleCoverImageData.paths.where((image) => !image.isAdaptive).toList();

    if(separateAdaptiveCoverImages) {
      List<CircleCoverImageData> separated = [];
      for (CircleCoverImageData coverImage in adaptiveLocalImages) {
        separated.add(CircleCoverImageData(true, [GraphicalResource(coverImage.firstFileName, coverImage.firstAuthor)]));
        separated.add(CircleCoverImageData(true, [GraphicalResource(coverImage.secondFileName, coverImage.secondAuthor)]));
      }
      standardLocalImages.insertAll(0, separated);
      adaptiveLocalImages.clear();
    }

    if(initiallySelected == null){
      controller = TextEditingController();
    } else if(initiallySelected!.local) {
      _selectedLocal = initiallySelected!;
      controller = TextEditingController();
    } else {
      controller = TextEditingController(text: initiallySelected!.code??'');
    }

    bottomIndex = initiallySelected?.local == false?1:0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [

      Expanded(
        child: ExtendedNestedScrollView(
          floatHeaderSlivers: true,
          pinnedHeaderSliverHeightBuilder: () => CoverImageWidget.height,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text('Wybierz zdjęcie'),
              centerTitle: true,
              floating: true,
              pinned: true,
              forceElevated: innerBoxIsScrolled,
              actions: [
                IconButton(
                  icon: const Icon(MdiIcons.check),
                  onPressed: (){
                    if(!canChooseNull && selected == null){
                      showAppToast(context, text: 'Nie można nie wybrać grafiki');
                      return;
                    }
                    onSelected?.call(selected);
                  },
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, CoverImageWidget.height),
                child: Builder(
                  builder: (context){
                    if(selected == null)
                      return SizedBox(
                        height: CoverImageWidget.height,
                        child: Icon(
                          bottomIndex == 0?
                          MdiIcons.imageOffOutline:
                          MdiIcons.linkOff,
                          size: 100,
                          color: backgroundIcon_(context)
                        ),
                      );

                    return Stack(
                      children: [

                        if(bottomIndex == 0)
                          CoverImageWidget(selected, selected: false, radius: 0)
                        else if(bottomIndex == 1)
                          Image.network(
                            controller.text,
                            fit: BoxFit.cover,
                            height: CoverImageWidget.height,
                            errorBuilder: (context, __, _) => SizedBox(
                              width: double.infinity,
                              height: CoverImageWidget.height,
                              child:  Icon(
                                MdiIcons.linkOff,
                                color: backgroundIcon_(context),
                                size: 100,
                              ),
                            ),
                          ),

                        if(canChooseNull && (bottomIndex == 0 || controller.text.isNotEmpty))
                          Positioned(
                            bottom: Dimen.ICON_MARG,
                            right: Dimen.ICON_MARG,
                            child: Material(
                              borderRadius: BorderRadius.circular(2*Dimen.ICON_FOOTPRINT),
                              color: background_(context),
                              child: IconButton(
                                icon: const Icon(MdiIcons.trashCanOutline),
                                onPressed: () => setState(() => selected = null),
                              ),
                            ),
                          ),

                      ],
                    );
                  },
                ),
              ),
            )
          ],
          body: Builder(
            builder: (context){

              if(bottomIndex == 0)
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [

                    SliverList(delegate: SliverChildListDelegate([

                      if(adaptiveLocalImages.isNotEmpty)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(adaptiveLocalImages.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(Dimen.DEF_MARG),
                          child: Text(
                            'Adaptacyjne zdjęcia',
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                fontWeight: weight.halfBold
                            ),
                          ),
                        ),

                    ])),

                    if(adaptiveLocalImages.isNotEmpty)
                      SliverPadding(
                          padding: const EdgeInsets.all(Dimen.DEF_MARG),
                          sliver: SliverGrid(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1/.66,
                              crossAxisSpacing: Dimen.DEF_MARG,
                              mainAxisSpacing: Dimen.DEF_MARG,
                            ),
                            delegate: SliverChildBuilderDelegate((BuildContext context, int index) => CoverImageWidget(
                              adaptiveLocalImages[index],
                              selected: adaptiveLocalImages[index] == selected,
                              radius: AppCard.DEF_RADIUS,
                              showAuthor: false,
                              onTap: () =>
                                  setState(() => selected = adaptiveLocalImages[index]),
                            ), childCount: adaptiveLocalImages.length),
                          )
                      ),

                    SliverPadding(
                      padding: const EdgeInsets.all(Dimen.DEF_MARG),
                      sliver: SliverList(delegate: SliverChildListDelegate([
                        const SizedBox(height: Dimen.SIDE_MARG),

                        Text(
                          'Pozostałe zdjęcia',
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_BIG,
                              fontWeight: weight.halfBold
                          ),
                        ),
                      ])),
                    ),

                    SliverPadding(
                        padding: const EdgeInsets.only(
                            left: Dimen.DEF_MARG,
                            right: Dimen.DEF_MARG,
                            bottom: Dimen.DEF_MARG
                        ),
                        sliver: SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1/.66,
                            crossAxisSpacing: Dimen.DEF_MARG,
                            mainAxisSpacing: Dimen.DEF_MARG,
                          ),
                          delegate: SliverChildBuilderDelegate((BuildContext context, int index) => CoverImageWidget(
                            standardLocalImages[index],
                            selected: standardLocalImages[index] == selected,
                            radius: AppCard.DEF_RADIUS,
                            showAuthor: false,
                            onTap: () =>
                              setState(() => selected = standardLocalImages[index]),
                          ), childCount: standardLocalImages.length),
                        )
                    ),

                  ],
                );

              else if(bottomIndex == 1)
                return Column(
                  children: [

                    if(adaptiveLocalImages.isNotEmpty)
                      const SizedBox(height: Dimen.SIDE_MARG),

                    Padding(
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      child: AppTextFieldHint(
                          hint: 'Link do zdjęcia:',
                          hintTop: 'Link do zdjęcia',
                          controller: controller,
                          maxLength: Circle.maxLenCoverImageUrl,
                          onAnyChanged: (_) => setState((){})
                      ),
                    )

                  ],
                );
              
              return Container();
              
            },
          ),
        ),
      ),
      
      BottomNavigationBar(
        selectedLabelStyle: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        unselectedLabelStyle: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
        selectedItemColor: iconEnab_(context),
        unselectedItemColor: iconDisab_(context),
        currentIndex: bottomIndex,
        onTap: (index) => setState(() => bottomIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(MdiIcons.imageOutline), label: 'Lokalne'),
          BottomNavigationBarItem(icon: Icon(MdiIcons.linkBoxOutline), label: 'Z sieci'),
        ]
      )

    ],
  );
  
}

class CoverImageWidget extends StatefulWidget{

  static const double height = 200.0;

  final CircleCoverImageData? coverImage;
  final bool selected;
  final double radius;
  final bool showAuthor;
  final void Function()? onTap;

  const CoverImageWidget(this.coverImage, {this.selected = false, this.showAuthor = false, this.radius = AppCard.BIG_RADIUS, this.onTap, super.key});

  @override
  State<StatefulWidget> createState() => CoverImageWidgetState();

}

class CoverImageWidgetState extends State<CoverImageWidget>{

  CircleCoverImageData? get coverImage => widget.coverImage;
  bool get selected => widget.selected;
  double get radius => widget.radius;
  bool get showAuthor => widget.showAuthor;
  void Function()? get onTap => widget.onTap;

  late bool showNight;

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
    if(coverImage!.isAdaptive) animate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      height: CoverImageWidget.height,
      child: InkWell(
        onTap: onTap,
        child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image(
                  image: AssetImage('assets/images/circle/cover_images/${coverImage!.firstFileName}'),
                  fit: BoxFit.cover,
                ),

                if(coverImage!.isAdaptive)
                  AnimatedOpacity(
                    opacity: showNight?1:0,
                    duration: const Duration(milliseconds: 300),
                    child: Image(
                        image: AssetImage('assets/images/circle/cover_images/${coverImage!.secondFileName}'),
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

                if(showAuthor)
                  Positioned(
                    bottom: Dimen.ICON_MARG,
                    right: Dimen.ICON_MARG,
                    child: Text(
                        coverImage!.firstAuthor!,
                        style: AppTextStyle(
                            color: Colors.white,
                            shadow: true,
                            fontSize: Dimen.TEXT_SIZE_SMALL,
                            fontWeight: weight.halfBold
                        )),
                  ),

              ],
            )
        )
      ),
  );

}

Future<CircleCoverImageData?> selectCoverImage(
    BuildContext context,
    CircleCoverImageData? currentCoverImage,
    { bool separateAdaptiveCoverImages = false,
      canChooseNull = false
    }) async {

  bool anythingSelected = false;
  CircleCoverImageData? selectedCoverImage;

  await openDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
          clipBehavior: Clip.hardEdge,
          color: background_(context),
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: CoverImageSelectorWidget(
            selected: currentCoverImage,
            onSelected: (coverImage){
              anythingSelected = true;
              selectedCoverImage = coverImage;
              Navigator.pop(context);
            },
            separateAdaptiveCoverImages: separateAdaptiveCoverImages,
            canChooseNull: canChooseNull,
          ),
        ),
      )
  );

  if(anythingSelected)
    return selectedCoverImage;
  else
    return currentCoverImage;

}
