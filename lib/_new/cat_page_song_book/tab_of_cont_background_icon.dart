import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import '../../_app_common/common_icon_data.dart';

class TabOfContBackgroundIcon extends StatelessWidget{

  const TabOfContBackgroundIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
      tag: 'TabOfContBackgroundIcon',
      child: Icon(
        CommonIconData.get(BaseAlbum.current.iconKey),
        color: backgroundIcon_(context),
        size: 0.8*min(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
      )
  );

}