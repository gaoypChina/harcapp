import 'dart:io';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle/model/circle.dart';

class CoverImageSelectorDialog extends StatefulWidget{

  final CommunityCoverImageData? selected;
  final void Function(CommunityCoverImageData?)? onSelected;
  final bool showAdaptiveCoverImages;
  final bool separateAdaptiveCoverImages;
  final bool canChooseNull;

  const CoverImageSelectorDialog({
    this.selected,
    this.onSelected,
    this.showAdaptiveCoverImages = true,
    this.separateAdaptiveCoverImages = false,
    this.canChooseNull = false,
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoverImageSelectorDialogState();

}

class CoverImageSelectorDialogState extends State<CoverImageSelectorDialog>{

  CommunityCoverImageData? get initiallySelected => widget.selected;
  void Function(CommunityCoverImageData?)? get onSelected => widget.onSelected;
  bool get showAdaptiveCoverImages => widget.showAdaptiveCoverImages;
  bool get separateAdaptiveCoverImages => widget.separateAdaptiveCoverImages;
  bool get canChooseNull => widget.canChooseNull;

  late List<CommunityCoverImageData> adaptiveSampleImages;
  late List<CommunityCoverImageData> standardSampleImages;

  CommunityCoverImageData? get selected{
    if(bottomIndex == 0) return selectedSample;
    else if(bottomIndex == 1) return CommunityCoverImageData(CommunityCoverImageDataType.localFile, localFilePath: localImageFile?.path);

    else /*if(bottomIndex == 2)*/ return CommunityCoverImageData(CommunityCoverImageDataType.url, localFilePath: netImageController.text);
  }

  set selected(CommunityCoverImageData? value){
    if(bottomIndex == 0)
      selectedSample = value;

    else if(bottomIndex == 1)
      localImageFile = value == null || value.localFilePath == null?
      null:
      File(value.localFilePath!);
    
    else if(bottomIndex == 2)
      netImageController.text = value?.url??'';
  }

  CommunityCoverImageData? selectedSample;
  File? localImageFile;
  late FocusNode netFocusNode;
  late TextEditingController netImageController;

  late int bottomIndex;

  late bool currAnimDark;
  late bool previewDark;

  bool? networkImgLoadedWithError;

  void animate() async {
    while(true){
      await Future.delayed(const Duration(milliseconds: 2800));
      if (!mounted) return;
      setState(() => currAnimDark = !currAnimDark);
    }
  }

  @override
  void initState() {

    List<CommunityCoverImageData> allAdaptives = CommunityCoverImageData.allSample.where((image) => image.isAdaptive).toList();

    if(showAdaptiveCoverImages)
      adaptiveSampleImages = allAdaptives;
    else
      adaptiveSampleImages = [];

    standardSampleImages = CommunityCoverImageData.allSample.where((image) => !image.isAdaptive).toList();

    if(separateAdaptiveCoverImages) {
      List<CommunityCoverImageData> separated = [];
      for (CommunityCoverImageData coverImage in allAdaptives) {
        separated.add(CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [coverImage.sample![0]]));
        separated.add(CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [coverImage.sample![1]]));
      }
      standardSampleImages.insertAll(0, separated);
    }

    netFocusNode = FocusNode();

    if(initiallySelected == null){
      netImageController = TextEditingController();
      bottomIndex = 0;
    } else switch(initiallySelected!.dataType){

      case CommunityCoverImageDataType.sample:
        netImageController = TextEditingController();
        selectedSample = initiallySelected;
        bottomIndex = 0;
        break;

      case CommunityCoverImageDataType.localFile:
        netImageController = TextEditingController();
        bottomIndex = 1;
        break;

      case CommunityCoverImageDataType.url:
        netImageController = TextEditingController(text: initiallySelected!.url??'');
        bottomIndex = 2;
        break;
    }

    currAnimDark = false;
    previewDark = AppSettings.isDark;

    if(showAdaptiveCoverImages)
      animate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(MediaQuery.of(context).viewInsets),
    child: Material(
      clipBehavior: Clip.hardEdge,
      color: background_(context),
      borderRadius: BorderRadius.circular(AppCard.bigRadius),
      child: Column(
        children: [

          Expanded(
            child: ExtendedNestedScrollView(
              floatHeaderSlivers: true,
              pinnedHeaderSliverHeightBuilder: () => CoverImagePreviewWidget.height,
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                SliverAppBar(
                  title: const Text('Wybierz zdjęcie'),
                  centerTitle: true,
                  // floating: true,
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    IconButton(
                      icon: Icon(MdiIcons.check),
                      onPressed: (){

                        if(bottomIndex == 0 && !canChooseNull && selected == null){
                          showAppToast(context, text: 'Nie można nie wybrać grafiki');
                          return;
                        }

                        if(bottomIndex == 1 && !canChooseNull && localImageFile == null){
                          showAppToast(context, text: 'Błąd ładowania grafiki');
                          return;
                        }

                        if(bottomIndex == 2 && (networkImgLoadedWithError == null || networkImgLoadedWithError == true)){
                          showAppToast(context, text: 'Błąd ładowania grafiki');
                          return;
                        }

                        onSelected?.call(selected);
                      },
                    )
                  ],
                )
              ],
              body: Builder(
                builder: (context){

                  if(bottomIndex == 0)
                    return CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [

                        FloatingContainer.child(
                          child: Material(
                            color: background_(context),
                              elevation: AppCard.bigElevation,
                              child: selected == null?
                              const SizedBox(
                                height: CoverImagePreviewWidget.height,
                                child: EmptyCoverImage(bottomIndex: 0),
                              ):
                              Stack(
                                children: [

                                  CoverImagePreviewWidget(
                                      selected,
                                      selected: false,
                                      radius: 0,
                                      showNight: selected != null && selected!.isAdaptive?previewDark:null
                                  ),

                                  if(selected != null && selected!.isAdaptive)
                                    Positioned(
                                      bottom: Dimen.ICON_MARG,
                                      left: Dimen.ICON_MARG,
                                      child: Material(
                                        borderRadius: BorderRadius.circular(2*Dimen.ICON_FOOTPRINT),
                                        clipBehavior: Clip.antiAlias,
                                        color: background_(context),
                                        child: IconButton(
                                          icon: Icon(previewDark?MdiIcons.weatherNight:MdiIcons.weatherSunny),
                                          onPressed: () => setState(() => previewDark = !previewDark),
                                        ),
                                      ),
                                    ),

                                  if(canChooseNull)
                                    Positioned(
                                      bottom: Dimen.ICON_MARG,
                                      right: Dimen.ICON_MARG,
                                      child: RemoveButton(
                                        onPressed: () => setState(() => selected = null),
                                      ),
                                    ),

                                ],
                              ),
                          ),
                          height: CoverImagePreviewWidget.height,
                          rebuild: true
                        ),

                        if(adaptiveSampleImages.isNotEmpty)
                          SliverList(delegate: SliverChildListDelegate([

                            const SizedBox(height: Dimen.SIDE_MARG),

                            Padding(
                              padding: const EdgeInsets.all(Dimen.defMarg),
                              child: Text(
                                'Adaptacyjne zdjęcia',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(Dimen.defMarg),
                              child: Text(
                                'Zdjęcie zmieni się wraz z przejściem aplikacji między jasnym i ciemnym motywem',
                                style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_NORMAL,
                                ),
                              ),
                            ),

                          ])),

                        if(adaptiveSampleImages.isNotEmpty)
                          SliverPadding(
                              padding: const EdgeInsets.all(Dimen.defMarg),
                              sliver: SliverGrid(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1/.66,
                                  crossAxisSpacing: Dimen.defMarg,
                                  mainAxisSpacing: Dimen.defMarg,
                                ),
                                delegate: SliverChildBuilderDelegate((BuildContext context, int index) => CoverImagePreviewWidget(
                                  adaptiveSampleImages[index],
                                  selected: adaptiveSampleImages[index] == selected,
                                  radius: AppCard.defRadius,
                                  showAuthor: false,
                                  showNight: currAnimDark,
                                  onTap: () => setState(() => selected = adaptiveSampleImages[index]),
                                ), childCount: adaptiveSampleImages.length),
                              )
                          ),

                        SliverPadding(
                          padding: const EdgeInsets.all(Dimen.defMarg),
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
                                left: Dimen.defMarg,
                                right: Dimen.defMarg,
                                bottom: Dimen.defMarg
                            ),
                            sliver: SliverGrid(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1/.66,
                                crossAxisSpacing: Dimen.defMarg,
                                mainAxisSpacing: Dimen.defMarg,
                              ),
                              delegate: SliverChildBuilderDelegate((BuildContext context, int index) => CoverImagePreviewWidget(
                                standardSampleImages[index],
                                selected: standardSampleImages[index] == selected,
                                radius: AppCard.defRadius,
                                showAuthor: false,
                                onTap: () =>
                                    setState(() => selected = standardSampleImages[index]),
                              ), childCount: standardSampleImages.length),
                            )
                        ),

                      ],
                    );

                  else if(bottomIndex == 1)
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        Expanded(
                          child:
                          localImageFile == null?
                          Container(
                            color: background_(context),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: Dimen.ICON_MARG,
                                  right: Dimen.ICON_MARG,
                                  left: Dimen.ICON_MARG
                              ),
                              child: EmptyCoverImage(
                                bottomIndex: 1,
                                onTap: uploadFile,
                              ),
                            ),
                          ):
                          Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [

                                Image.file(
                                  localImageFile!,
                                  fit: BoxFit.cover,
                                  // height: CoverImagePreviewWidget.height,
                                  // width: double.infinity,
                                ),

                                if(canChooseNull && localImageFile != null)
                                  Positioned(
                                    bottom: Dimen.ICON_MARG,
                                    right: Dimen.ICON_MARG,
                                    child: RemoveButton(
                                      onPressed: () => setState(() => localImageFile = null),
                                    ),
                                  ),

                              ],
                            ),
                          )
                        ),

                        if(adaptiveSampleImages.isNotEmpty)
                          const SizedBox(height: Dimen.SIDE_MARG),

                        Padding(
                            padding: const EdgeInsets.all(Dimen.ICON_MARG),
                            child: SimpleButton.from(
                                context: context,
                                radius: AppCard.defRadius,
                                color: backgroundIcon_(context),
                                text: 'Wrzuć zdjęcie lokalne',
                                onTap: uploadFile
                            )
                        )

                      ],
                    );

                  else if(bottomIndex == 2)
                    return Column(
                      children: [

                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [

                                Image.network(
                                    netImageController.text,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? imageChunkEvent){
                                      if(imageChunkEvent != null && imageChunkEvent.cumulativeBytesLoaded == imageChunkEvent.expectedTotalBytes)
                                        post(() => setState(() => networkImgLoadedWithError = false));

                                      return child;
                                    },
                                    errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){

                                      if(stackTrace != null)
                                        post(() => setState(() => networkImgLoadedWithError = true));

                                      return Positioned(
                                        top: Dimen.ICON_MARG,
                                        right: Dimen.ICON_MARG,
                                        left: Dimen.ICON_MARG,
                                        bottom: 0,
                                        child: EmptyCoverImage(
                                          bottomIndex: 2,
                                          onTap: () => netFocusNode.requestFocus(),
                                        ),
                                      );
                                    }
                                ),

                                if(canChooseNull && netImageController.text.isNotEmpty)
                                  Positioned(
                                    bottom: Dimen.ICON_MARG,
                                    right: Dimen.ICON_MARG,
                                    child: RemoveButton(
                                      onPressed: () => setState(() => netImageController.text = ''),
                                    ),
                                  ),

                              ],
                            ),
                          ),
                        ),

                        if(adaptiveSampleImages.isNotEmpty)
                          const SizedBox(height: Dimen.SIDE_MARG),

                        Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: AppTextFieldHint(
                            focusNode: netFocusNode,
                              hint: 'Podaj link do zdjęcia:',
                              hintStyle: AppTextStyle(
                                color: hintEnab_(context),
                                fontWeight: weight.halfBold
                              ),
                              hintTop: 'Link do zdjęcia',
                              controller: netImageController,
                              maxLength: Circle.maxLenCoverImageUrl,
                              onAnyChanged: (_) => setState((){})
                          )
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
              backgroundColor: background_(context),
              currentIndex: bottomIndex,
              onTap: (index) => setState(() => bottomIndex = index),
              items: [
                BottomNavigationBarItem(icon: Icon(MdiIcons.imageOutline), label: 'Przykładowe'),
                BottomNavigationBarItem(icon: Icon(MdiIcons.trayArrowUp), label: 'Lokalne'),
                BottomNavigationBarItem(icon: Icon(MdiIcons.linkBoxOutline), label: 'Z sieci'),
              ]
          )

        ],
      ),
    ),
  );

  void uploadFile() async {

    XFile? result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(result == null) return;
    setState(() => localImageFile = File(result.path));

  }

}

class EmptyCoverImage extends StatelessWidget{

  final int bottomIndex;
  final void Function()? onTap;

  const EmptyCoverImage({required this.bottomIndex, this.onTap, super.key});

  @override
  Widget build(BuildContext context){

    Widget child = Icon(
        bottomIndex == 0?
        MdiIcons.imageOffOutline:
        bottomIndex == 1?
        MdiIcons.trayArrowUp:
        MdiIcons.linkOff,
        size: 100,
        color: backgroundIcon_(context)
    );

    if(onTap == null)
      return child;

    return SimpleButton(
      onTap: onTap,
      child: child,
    );

  }

}

class RemoveButton extends StatelessWidget{

  final void Function()? onPressed;
  const RemoveButton({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => Material(
    borderRadius: BorderRadius.circular(2*Dimen.ICON_FOOTPRINT),
    clipBehavior: Clip.antiAlias,
    color: background_(context),
    child: IconButton(
      icon: Icon(MdiIcons.trashCanOutline),
      onPressed: onPressed,
    ),
  );

}

class CoverImagePreviewWidget extends StatelessWidget{

  static const double height = 200.0;

  final CommunityCoverImageData? coverImage;
  final bool selected;
  final double radius;
  final bool showAuthor;
  final bool? showNight;
  final void Function()? onTap;

  const CoverImagePreviewWidget(this.coverImage, {this.selected = false, this.radius = AppCard.bigRadius, this.showAuthor = false, this.showNight, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
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
                    opacity: showNight == false?0:1,
                    duration: const Duration(milliseconds: 500),
                    child: Image(
                        image: AssetImage('assets/images/circle/cover_images/${coverImage!.secondFileName}'),
                        fit: BoxFit.cover
                    ),
                  ),

                Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedOpacity(
                        opacity: selected?0.8:0,
                        duration: const Duration(milliseconds: 500),
                        child: Icon(MdiIcons.checkOutline, size: 80.0, color: Colors.white),
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

Future<CommunityCoverImageData?> openSelectCoverImageDialog(
    BuildContext context,
    CommunityCoverImageData? currentCoverImage,
    { bool showAdaptiveCoverImages = true,
      bool separateAdaptiveCoverImages = false,
      canChooseNull = false
    }) async {

  bool anythingSelected = false;
  CommunityCoverImageData? selectedCoverImage;

  await openDialog(
      context: context,
      builder: (context) => CoverImageSelectorDialog(
        selected: currentCoverImage,
        onSelected: (coverImage){
          anythingSelected = true;
          selectedCoverImage = coverImage;
          Navigator.pop(context);
        },
        showAdaptiveCoverImages: showAdaptiveCoverImages,
        separateAdaptiveCoverImages: separateAdaptiveCoverImages,
        canChooseNull: canChooseNull,
      )
  );

  if(anythingSelected)
    return selectedCoverImage;
  else
    return currentCoverImage;

}
