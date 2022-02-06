
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';

import 'child_fragment_template.dart';
import 'image_loader.dart';
import 'providers.dart';
import 'source.dart';

class ChildFragment extends StatefulWidget {

  final SourceItem item;
  final ValueNotifier notifier;
  final int index;
  final bool lockable;
  final bool useAsBackground;

  ChildFragment(
      this.item,
      this.notifier,
      this.index,
      {
        this.lockable:true,
        this.useAsBackground:true,
        Key key
      }):super(key: key);

  @override
  State createState() => ChildFragmentState();

}

class ChildFragmentState extends State<ChildFragment> with TickerProviderStateMixin{

  //DisplayedItemsProvider dispItemsProv;
  FadeImageProvider fadeImgProv;

  @override
  void initState() {
    fadeImgProv = Provider.of<FadeImageProvider>(context, listen: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return ChildFragmentTemplate(
      widget.item,
      widget.notifier,
      widget.index,
      lockable: widget.lockable,
      onLoaded: (ImageProvider image, bool cached){
        if(widget.useAsBackground) {
          if(image == null) image = ImageLoader.noInternetImage;
          post(() => fadeImgProv.newImage(image, widget.index));
        }
      },
    );
  }

  void notify() => setState((){});

}