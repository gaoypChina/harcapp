import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/src/layer/tile_layer/tile_layer.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../details/app_settings.dart';
import 'data.dart';

class WDecheMarker extends Marker{

  final WDecheData data;
  WDecheMarker({
    required this.data,
    required super.point,
    required super.builder,
    super.width = 30.0,
    super.height = 30.0,
  });

}

class WDechePage extends StatefulWidget {

  const WDechePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WDechePageState();

}

class WDechePageState extends State<WDechePage> {

  static const String tileImagePath = 'assets/images/w_deche/wood_tile.webp';

  static const int deltaFactor = 3;

  static const int interactiveFlags = InteractiveFlag.drag |
  InteractiveFlag.flingAnimation;

  late List<WDecheData> visibleData;
  late List<WDecheMarker> markers;

  double get northBound{
    try{
      return mapController.bounds!.north;
    } catch(e){
      return double.nan;
    }
  }

  double get southBound{
    try{
      return mapController.bounds!.south;
    } catch(e){
      return double.nan;
    }
  }

  double get westBound{
    try{
      return mapController.bounds!.west;
    } catch(e){
      return double.nan;
    }
  }

  double get eastBound{
    try{
      return mapController.bounds!.east;
    } catch(e){
      return double.nan;
    }
  }

  void removeOld(LatLng center, double latScrDelta, double lngScrDelta){

    List<WDecheData> newVisibleData = [];
    List<WDecheMarker> newMarkers = [];

    for(WDecheMarker marker in markers)
      if( marker.point.latitude < center.latitude + latScrDelta*(deltaFactor + .5) &&
          marker.point.latitude > center.latitude - latScrDelta*(deltaFactor + .5) &&
          marker.point.longitude < center.longitude + lngScrDelta*(deltaFactor + .5) &&
          marker.point.longitude > center.longitude - lngScrDelta*(deltaFactor + .5)
      ){
        newVisibleData.add(marker.data);
        newMarkers.add(marker);
      }

    logger.d('Removed ${markers.length - newMarkers.length} markers.');
    visibleData = newVisibleData;
    markers = newMarkers;

  }

  WDecheMarker createMarker(WDecheData data, double topLat, double leftLng, double latScrDelta, double lngScrDelta){
    String fontFamily = data.fontFamily??WDecheData.allFontFamilies[Random().nextInt(WDecheData.allFontFamilies.length)];
    int textRotDegrees = Random().nextInt(60) - 30;
    int imgRotDegrees = Random().nextInt(40) - 20;
    bool imageOnTop = Random().nextBool();

    Widget image;

    if(data.imageName != null)
      image = Padding(
        padding: EdgeInsets.all(.5*data.imageSize),
        child: RotationTransition(
            turns: AlwaysStoppedAnimation(imgRotDegrees / 360),
            child: SimpleShadow(
              sigma: 3,
              color: Colors.brown,
              offset: Offset.zero,
              opacity: 1,
              child: SvgPicture.asset(
                'assets/images/w_deche/${data.imageName}.svg',
                fit: BoxFit.contain,
                height: data.imageSize,
                width: data.imageSize,
                color: Colors.black.withOpacity(.8),
              ),
            )
        ),
      );
    else
      image = Container();

    return WDecheMarker(
        data: data,
        point: LatLng(
          topLat + (.2 + (Random().nextDouble()%.6))*latScrDelta * latScrDelta,
          leftLng + (.2 + (Random().nextDouble()%.6))*lngScrDelta * lngScrDelta,
        ),
        width: .8*MediaQuery.of(context).size.width,
        height: .8*MediaQuery.of(context).size.height,
        builder: (context) => Center(
          child: Column(
            children: [

              if(imageOnTop) image,

              RotationTransition(
                turns: AlwaysStoppedAnimation(textRotDegrees / 360),
                child: Text(
                  data.text,
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.brown,
                        offset: Offset.zero,
                      )
                    ],
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
              ),

              if(!imageOnTop) image

            ],
          )
        )
    );
  }

  void addMissingData(LatLng center, double latScrDelta, double lngScrDelta){

    double lat = center.latitude - latScrDelta*(deltaFactor + .5);
    double maxLat = center.latitude + latScrDelta*(deltaFactor + .5);

    int added = 0;

    List<WDecheData> availableData = WDecheData.all.where((data) => !visibleData.contains(data)).toList();

    while(lat <= maxLat){

      double lng = center.longitude - lngScrDelta*(deltaFactor + .5);
      double maxLng = center.longitude + lngScrDelta*(deltaFactor + .5);

      while(lng <= maxLng) {
        if (markers.where((marker) =>
            marker.point.latitude >= lat - latScrDelta &&
            marker.point.latitude <= lat + 2*latScrDelta &&
            marker.point.longitude >= lng - 1*lngScrDelta &&
            marker.point.longitude <= lng + 2*lngScrDelta
        ).isEmpty) {
          WDecheData data = availableData[Random().nextInt(availableData.length)];
          visibleData.add(data);
          availableData.remove(data);
          markers.add(createMarker(data, lat, lng, latScrDelta, lngScrDelta));
          added++;
        }
        lng += lngScrDelta;
      }
      lat += latScrDelta;
    }
    logger.d('Added $added markers');

  }

  late MapController mapController;

  late bool loaded;

  @override
  void initState() {
    visibleData = [];
    markers = [];
    post(() async {
      WDecheData data = WDecheData.all[Random().nextInt(WDecheData.all.length)];
      visibleData.add(data);
      markers.add(createMarker(data, 0, 0, 0.05, 0.05));
      setState(() {});
    });
    mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    appBar: AppBar(
      title: Text('W Dechę!', style: AppTextStyle(color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 206, 152, 106),
    ),
    body: FlutterMap(
      mapController: mapController,
      options: MapOptions(
          center: LatLng(0.0, 0.0),
          zoom: 16,
          minZoom: 16,
          maxZoom: 16,
          interactiveFlags: interactiveFlags,
          onPositionChanged: (position, _){

            double latDelta = position.bounds!.north - position.bounds!.south;
            double lngDelta = position.bounds!.east - position.bounds!.west;

            removeOld(position.center!, latDelta, lngDelta);
            addMissingData(position.center!, latDelta, lngDelta);
            setState(() {});

          }
      ),
      children: [

        TileLayer(
          urlTemplate: '',
          userAgentPackageName: '',
          tileBuilder: (context, _, __) => Image.asset(tileImagePath),
          tileSize: 1000,
        ),

        MarkerLayer(
            markers: markers
        ),

        if(AppSettings.devMode)
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: background_(context).withOpacity(.7),
              child: Builder(
                builder: (context){

                  return Text(
                    'N: ${northBound.toStringAsFixed(3)}\n'
                        'S: ${southBound.toStringAsFixed(3)}\n'
                        'W: ${westBound.toStringAsFixed(3)}\n'
                        'E: ${eastBound.toStringAsFixed(3)}\n'
                        '\n'
                        'ΔscrnLat: ${(northBound - southBound).toStringAsFixed(3)}\n'
                        'ΔscrnLng: ${(eastBound - westBound).toStringAsFixed(3)}\n'
                        'Visib data: ${visibleData.length}\n'
                        'Markers: ${markers.length}',
                  );
                },
              ),
            ),
          ),

      ],
    )
  );
}
