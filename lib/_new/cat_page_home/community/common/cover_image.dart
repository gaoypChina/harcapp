import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/values/server.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../details/app_settings.dart';
import 'community_cover_image_data.dart';

class CoverImageWidget extends StatelessWidget{

  final CommunityCoverImageData coverImage;
  final BoxFit fit;

  const CoverImageWidget(this.coverImage, {this.fit = BoxFit.cover, super.key});

  @override
  Widget build(BuildContext context) => Image(
    image: coverImage.getImageProvider(darkSample: coverImage.isAdaptive && AppSettings.isDark)!,

    fit: fit,

    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? imageChunkEvent) =>
    imageChunkEvent?.expectedTotalBytes == imageChunkEvent?.cumulativeBytesLoaded?
    child:
    NoImagePlaceholder(loading: true, isSample: coverImage.dataType == CommunityCoverImageDataType.sample),

    errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
      if(coverImage.url != null && coverImage.url!.contains(IMAGE_DB_SERVER_IP.replaceAll("https://", "")))
        isNetworkAvailable().then((hasNetwork){
          if(hasNetwork)
            Dio().get(IMAGE_DB_SERVER_IP).onError((e, __) => Response(requestOptions: RequestOptions(path: '')));
        });

      return NoImagePlaceholder(loading: false, isSample: coverImage.dataType == CommunityCoverImageDataType.sample);
    }
  );

}

class NoImagePlaceholder extends StatelessWidget{

  final bool loading;
  final bool isSample;

  const NoImagePlaceholder({required this.loading, required this.isSample, super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 3/2,
    child: Material(
      child: loading?
      Center(
        child: SpinKitThreeBounce(
          size: 48.0,
          color: iconDisab_(context),
        ),
      ):
      Icon(
        isSample?
        MdiIcons.imageOffOutline:
        MdiIcons.linkOff,
        size: 72,
        color: iconDisab_(context),
      ),
    )
  );

}
