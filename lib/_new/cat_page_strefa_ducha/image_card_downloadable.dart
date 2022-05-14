import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/source.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'image_card.dart';
import 'image_loader.dart';

class ImageCardDownloadable extends StatefulWidget{

  final SourceItem? item;
  final ValueNotifier? pageViewNotifier;
  final int? index;
  final void Function(ImageProvider?, int?)? onLoaded;

  final void Function()? onLike;
  final void Function()? onLongPress;

  const ImageCardDownloadable(
      this.item,
      { this.pageViewNotifier,
        this.index,
        this.onLoaded,
        this.onLike,
        this.onLongPress,
        Key? key
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ImageCardDownloadableState();

}

class ImageCardDownloadableState extends State<ImageCardDownloadable>{

  SourceItem? get item => widget.item;
  ValueNotifier? get pageViewNotifier => widget.pageViewNotifier;
  int? get index => widget.index;
  void Function(ImageProvider?, int?)? get onLoaded => widget.onLoaded;

  void Function()? get onLike => widget.onLike;
  void Function()? get onLongPress => widget.onLongPress;

  Image? image;

  StreamSubscription<ConnectivityResult>? subscription;

  late bool error;
  late bool noNet;

  Future<void> loadImage() async {
    noNet = !await isNetworkAvailable();
    if(noNet && !item!.cachedFile.existsSync())
      setState(() {});
    else
      ImageLoader.loadImage(
          item!,
          onComplete: (Image? image, bool cached){
            if(mounted) setState(() => this.image = image);
            onLoaded!(image!.image, index);
          },
          onError: () async {
            if(await isNetworkAvailable())
              if(mounted) setState(() => error = true);
              else
              if(mounted) setState(() => noNet = true);

            onLoaded!(null, index);
          }
      );
  }

  @override
  void initState() {
    error = false;
    noNet = false;
    loadImage();

    subscription = addConnectionListener((hasConnection) async{
      if(image != null) return;
      if(hasConnection) loadImage();
      else setState(() => noNet = true);
    });

    super.initState();
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    if(error)
      return _ErrorCard(
        onReload: (){
          setState(() => error = false);
          loadImage();
        },
      );

    if(noNet)
      return ImageCard(
        ImageLoader.noInternetImage,
        pageViewNotifier: pageViewNotifier,
        index: index,
        onTap: ()async{
          noNet = !await isNetworkAvailable();
          if(noNet) showAppToast(context, text: 'Brak internetu');
          else{
            setState(() => noNet = false);
            loadImage();
          }
        },
      );

    if(image == null)
      return const _LoadingCard();
    
    return ImageCard(
        image!.image,
        pageViewNotifier: pageViewNotifier,
        index: index,
        onLike: onLike,
        onLongPress: onLongPress,
    );
    
  }

}

class _ErrorCard extends StatelessWidget{
  
  final void Function()? onReload;
  
  const _ErrorCard({this.onReload});
  
  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1,
    child: SimpleButton(
        elevation: AppCard.bigElevation,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        radius: AppCard.BIG_RADIUS,
        color: cardEnab_(context),
        onTap: onReload,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const EmptyMessageWidget(
                text: 'Mamy problem',
                icon: MdiIcons.cloudAlert
            ),

            const SizedBox(height: Dimen.ICON_MARG),

            Text(
              'Załaduj ponownie',
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_NORMAL,
                color: hintEnab_(context),
                fontWeight: weight.bold
              )
            )
            
          ],
        )
    ),
  );
}

class _LoadingCard extends StatelessWidget{
  
  const _LoadingCard();

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1,
    child: Material(
        elevation: AppCard.bigElevation,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        child: Center(
          child: SpinKitFoldingCube(
            size: 72,
            color: hintEnab_(context),
          ),
        )
    ),
  );
}