import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'image_loader.dart';
import 'providers.dart';
import 'source.dart';

enum ItemState{
  LOADING,
  SUCCESS,
  FAILED,
}

class ChildFragmentTemplate extends StatefulWidget {

  final SourceItem item;
  final ValueNotifier notifier;
  final int index;
  final bool lockable;
  final Function(ImageProvider image, bool cached) onLoaded;
  final Function(bool locked) onLocked;
  final Function(bool onPin) onPin;

  const ChildFragmentTemplate(
      this.item,
      this.notifier,
      this.index,
      { this.lockable = true,
        this.onLoaded,
        this.onLocked,
        this.onPin,
        Key key
      }):super(key: key);

  @override
  State createState() => ChildFragmentTemplateState();

}

class ChildFragmentTemplateState extends State<ChildFragmentTemplate> with TickerProviderStateMixin{

  SourceItem get item => widget.item;

  ValueNotifier get notifier => widget.notifier??ValueNotifier(0);

  ItemState itemState;
  Image image;

  StreamSubscription<ConnectivityResult> subscription;

  @override
  void setState(fn) {
    if(mounted) super.setState(fn);
  }

  @override
  void initState() {
    loadImage(resetState: false);

    subscription = addConnectionListener((hasConnection) async {
      if(hasConnection) {
        if(itemState == ItemState.FAILED)
          await loadImage();

      }else {
        if(itemState == ItemState.LOADING)
          setState(() => itemState = ItemState.FAILED);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<void> loadImage({bool resetState = true}) async{

    void Function(Function() func) set = resetState?(func) => setState(func):(func) => func();

    if(item == null) {

      set(() => itemState = ItemState.FAILED);

      if(widget.onLoaded!=null) widget.onLoaded(image?.image, null);
    }else {
      set(() => itemState = ItemState.LOADING);
      await ImageLoader.loadImage(
        item,
        onComplete: ({Image image, bool cached}) {
          if(image == null){
            if(cached) set(() => itemState = ItemState.FAILED);
            else setState(() => itemState = ItemState.FAILED);

            if (widget.onLoaded != null) widget.onLoaded(image?.image, cached);
            return;
          }

          if(cached) {
            this.image = image;
            itemState = ItemState.SUCCESS;
          } else
            setState(() {
              this.image = image;
              itemState = ItemState.SUCCESS;
            });
          if (widget.onLoaded != null) widget.onLoaded(image?.image, cached);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: ChangeNotifierProvider<FavoriteProvider>(
        create: (context) => FavoriteProvider(item==null?false:item.isFavorite),
        builder: (context, _){

          if(itemState == ItemState.LOADING)
            return Center(child: SpinKitFoldingCube(color: accent_(context), size: 24));

          if(itemState == ItemState.FAILED)
            return ImageCard(
                item,
                notifier,
                Image(image: ImageLoader.noInternetImage),
                null,
                widget.index
            );

          return Stack(children: <Widget>[

            Consumer<LockProvider>(
                builder: (context, lockProv, _) {

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: AppBar().preferredSize.height),
                      AnimatedContainer(
                        curve: Curves.easeOutQuad,
                        duration: const Duration(milliseconds: 350),
                        height: lockProv.locked ? 2 * Dimen.ICON_SIZE : 0,
                        child: lockProv.locked ?
                        TopButtons(item, widget.lockable, onPin: widget.onPin) :
                        Container(),
                      ),
                      Expanded(child: Row(
                        children: [
                          AnimatedContainer(curve: Curves.easeOutQuad,
                            duration: const Duration(milliseconds: 350),
                            width: lockProv.locked ? Dimen.ICON_SIZE : 0,
                          ),
                          Expanded(
                            child: Stack(
                              children: [

                                ImageCard(
                                    item,
                                    notifier,
                                    image,
                                    lockProv,
                                    widget.index,
                                    onLocked: widget.onLocked
                                ),

                                Positioned.fill(
                                    child: Center(
                                        child: Consumer2<FavoriteProvider, LockProvider>(
                                            builder: (context, favProv, lockProv, child){
                                              return AnimatedOpacity(
                                                  opacity:
                                                  lockProv != null && !lockProv.locked && favProv.value?1:0,
                                                  duration: const Duration(milliseconds: 300),
                                                  child: const HeartWidget()
                                              );
                                            }
                                        )
                                    )
                                )

                              ],
                            )
                          ),
                          AnimatedContainer(curve: Curves.easeOutQuad,
                            duration: const Duration(milliseconds: 350),
                            width: lockProv.locked ? Dimen.ICON_SIZE : 0,
                          ),
                        ],
                      )),
                      AnimatedContainer(
                        curve: Curves.easeOutQuad,
                        duration: const Duration(milliseconds: 350),
                        height: lockProv.locked ? 2 * Dimen.ICON_SIZE : 0,
                        child: lockProv.locked ? BottomButtons(item) : Container(),
                      ),
                      SizedBox(height: AppBar().preferredSize.height),
                    ],
                  );
                }
            ),
          ]);
        },
      ),
    );

  }
}

class ImageCard extends StatelessWidget{

  final SourceItem item;
  final ValueNotifier notifier;
  final image;
  final LockProvider lockProv;
  final int index;
  final Function(bool locked) onLocked;

  const ImageCard(this.item, this.notifier, this.image, this.lockProv, this.index, {this.onLocked});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier,
      child: Center(
          child: AppCard(
            elevation: AppCard.bigElevation,
            radius: AppCard.BIG_RADIUS,
            margin: AppCard.normMargin,
            padding: EdgeInsets.zero,
            onDoubleTap: item==null?null:(){
              FavoriteProvider favProv = Provider.of<FavoriteProvider>(context, listen: false);
              favProv.value = !favProv.value;

              if(favProv.value) item.addToFavorite();
              else item.removeFromFavorite();
            },
            onLongPress: (){
              if(lockProv == null) return;
              lockProv.locked = !lockProv.locked;
              onLocked?.call(lockProv.locked);
            },
            child: AnimatedBuilder(
              animation: notifier,
              child: image,
              builder: (BuildContext context, Widget child) => Transform.scale(
                  scale: 1 + sin(notifier.value - index).abs()*0.4,//Offset(0, MediaQuery.of(context).size.height*(index - notifier.value)*0.2),
                  child: image//GyroscopeWidget.fill(key: imageKey, child: image, scale: 1.04)
              ),
            ),
            color: Colors.transparent,
          )
      ),
      builder: (context, child) => Transform.translate(
          offset: Offset(0, MediaQuery.of(context).size.height/2*(index - notifier.value)),
          child: child
      ),
    );
  }

}

class TopButtons extends StatelessWidget{

  final SourceItem item;
  final bool lockable;
  final Function(bool pinned) onPin;

  const TopButtons(this.item, this.lockable, {this.onPin, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<PinProvider>(
            builder: (context, prov, child) => IconButton(
              icon: Icon(prov.item==item?MdiIcons.pin:MdiIcons.pinOffOutline, color: Colors.white),
              onPressed: item==null || !lockable?null:(){
                if(prov.item == item)
                  prov.item = null;
                else
                  prov.item = item;

                if(onPin != null) onPin(prov.item!=null);
              }
            ),
          )
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget{

  final SourceItem item;

  const BottomButtons(this.item, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        IconButton(
            icon: const Icon(MdiIcons.shareVariant, color: Colors.white),
            onPressed: ()async{
              File file = item.cachedFile;
              await Share.shareFiles([file.path], text: 'Udostępnij...');
            }
        ),

        IconButton(
          icon: const Icon(MdiIcons.link, color: Colors.white),
          onPressed: () => launchURL(item.sourceUrl),
        ),

        IconButton(
            icon: const Icon(MdiIcons.fileDownloadOutline, color: Colors.white),
            onPressed: ()async{
              if(await Permission.storage.request().isGranted){
                await GallerySaver.saveImage(item.cachedFile.path);
                showAppToast(context, text: 'Zapisano w galerii.');
              }
            }
        ),

        IconButton(
          icon: const Icon(MdiIcons.informationOutline, color: Colors.white),
          onPressed: () => showAppToast(context, text: item.cachedFileName)
        )
      ],
    );
  }

}

class HeartWidget extends StatefulWidget{

  const HeartWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HeartWidgetState();

}

class HeartWidgetState extends State<HeartWidget>{

  bool visible;
  static const Duration _duration = Duration(milliseconds: 2000);

  void pulse()async{
    if(!mounted) return;
    setState(() => visible = !visible);
    await Future.delayed(_duration);
    pulse();
  }

  @override
  void initState() {
    visible = true;
    pulse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double size = 0.8*min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return IgnorePointer(
      child: AnimatedOpacity(
          opacity: visible?0.25:0.1,
          duration: _duration,
          child: Stack(
            children: [
              Icon(
                MdiIcons.heartOutline,
                color: Colors.black,
                size: size,
              ),

              Blur(
                child: Icon(
                  MdiIcons.heartOutline,
                  color: Colors.white,
                  size: size,
                ),
                sigma: 8,
              ),

            ],
          )
      ),
    );

  }

}