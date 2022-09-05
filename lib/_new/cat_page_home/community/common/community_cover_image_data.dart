import 'dart:io';
import 'dart:convert' show base64;

import 'package:flutter/material.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tuple/tuple.dart';

enum CommunityCoverImageDataType{
  sample, url, localFile
}

class CommunityCoverImageData{

  static Map<String?, Tuple2<PaletteGenerator?, PaletteGenerator?>> palettes = {};

  static String samplePrefix = 'sample';
  static String urlPrefix = 'url';
  static String filePrefix = 'file';

  static List<CommunityCoverImageData> allSample = const [
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:alien-planet-levitating-rocks#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:alien-planet-levitating-rocks#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:alone-castaway-man-cave-uninhabited-island.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:alpaca-christmas-fair-night.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:alpaca-mexican-desert-with-red-mountains.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:art-class-scene-child-painting-with-teacher.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:barn-farm-with-chickens-straw-hay.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:barn-interior-with-chicken-farm-house.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:bbq-party-backyard-with-cooking-grill.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:bird-superhero-red-costume-forest.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:bungalow-party-with-woman-resort-wooden-house.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:catholic-priest-with-bible-church-interior.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:city-crossroad-night-transport-intersection.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:city-park-with-orange-trees-autumn.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:city-street-with-houses-road.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:city-top-view-with-buildings-cars-road-pedestrian-crosswalk-night.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:classroom-mathematics-learning.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:crow-fly-canyon-with-red-mountains.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:deer-forest.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:egypt-cat-goddess-pyramids#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:egypt-cat-goddess-pyramids#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:egypt-pyramids-nile-river-desert#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:egypt-pyramids-nile-river-desert#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:empty-subway-platform-with-arriving-trains.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:flooded-laundry-basement-water-leakage-home-cellar-interior.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:forest-deciduous-trees-rocks-grass-bushes-sunlight-spots.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:fox-winter-forest-wild.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:giant-octopus-ocean.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:hiker-mountain-ice-cave-with-campfire-bed#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:hiker-mountain-ice-cave-with-campfire-bed#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:home-room-christmas-night-empty-fireplace.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:hot-air-balloons-fly-mountain-lake-night.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:interior-arabic-style-middle-east-room-design.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:kraken-attacks-ship-octopus.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:lake-with-wooden-pier-fisherman-boat.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:lion-savanna.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:living-room-with-sofa-chair-night.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:magic-castle-mountain-top-near-river-pier-with-boat-water-surface#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:magic-castle-mountain-top-near-river-pier-with-boat-water-surface#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:medieval-town-street-with-old-european-buildings.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:mountain-landscape-with-forest-lonely-cliff.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:mountain-with-log-bridge-river-with-waterfall-fog.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:mountain-with-log-bridge-river-with-waterfall-light.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:night-forest-with-camp-fire-river-mountains.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:night-ocean-full-moon-stars-shine.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:people-railroad-station-platform.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:phoenix-fenix-fire-bird-cartoon-character-cave.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:pink-magic-castle-princess-fairy-palace-mountains.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:pirate-parrot-hat-anchor-sea-beach.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:pirate-ship-moored-island-with-treasure#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:pirate-ship-moored-island-with-treasure#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:room-christmas-night-empty-home-interior.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:rustic-autumn-meadow-landscape-rural-yellow-field.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:snake-field-autumn.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:snake-forest-swamp.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:sparrow-bird-sitting-branch-winter.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:steaming-volcanoes.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:summer-camp-with-bonfire-tent-forest.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:summer-camp-with-bonfire-tent-night.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:summer-camp-with-bonfire-tent-van-backpack-chair-guitar#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:summer-camp-with-bonfire-tent-van-backpack-chair-guitar#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:summer-camp-with-tent-campfire-lake#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:summer-camp-with-tent-campfire-lake#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:sunrise-winter-forest-with-frozen-pond-nature.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:sunset-sky-clouds-city-skyscrapers.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:telescope-science-discovery-watching-stars-planets-outer-space.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:tiger-fantastic-world.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:traveler-man-winter-mountains-travel-journey.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:turtle-sea-underwater.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:unusual-mushroom-forest-swamp-alien-planet.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('upklyak:urban-building-skyline-panoramic#light.webp', 'freepik.com (upklyak)'),
          GraphicalResource('upklyak:urban-building-skyline-panoramic#night.webp', 'freepik.com (upklyak)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:waterfall-cascade-forest.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:wooden-house-winter-forest-night-forester.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('upklyak:zebra-savannah.webp', 'freepik.com (upklyak)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:astronauts-family-red-planet-surface-illustration.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:aurora-borealis-night-sky-waterfall.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('vectorpouch:ballroom-palace-illustration-royal-gothic-hall-with-stained-glass-windows#light.webp', 'freepik.com (vectorpouch)'),
          GraphicalResource('vectorpouch:ballroom-palace-illustration-royal-gothic-hall-with-stained-glass-windows#night.webp', 'freepik.com (vectorpouch)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:basketball-court-tropic-city.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:cargo-ship-sea-port-dock-illustration.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('vectorpouch:car-parking-city-street#light.webp', 'freepik.com (vectorpouch)'),
          GraphicalResource('vectorpouch:car-parking-city-street#night.webp', 'freepik.com (vectorpouch)')
        ]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:christmas-night-in-mountain-city.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:competition-golden-silver-bronze-cup-trophies.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:concept-attic-repair-renovation-wooden-room-roof.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:construction-site.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:couple-romantic-date-dinner.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:fisherman-seascape-hills.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:house-tree-empty-children-playground.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:medieval-castle-throne-room-ballroom-knights-armor-both-sides-king.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:medieval-torture-hall.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:pirate-captain-ship-cabin-interior.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:planets-outer-space-with-satellites-meteors-illustration.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:playground-park-with-children.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:quest-escape-room-egypt-pharaoh-tomb-with-people.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:radio-hosts-dj-studio-presenters-man-woman.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:railway-station-at-mountains-autumn.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:room-people-playing-digital-entertainment.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:russian-stove-samovar-illustretion.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:space-fairy-tale-with-huge-whale.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:spaceship-start-heavy-rocket-carrier-taking-off-launching-satellite-international-station-earth.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: [GraphicalResource('vectorpouch:windows-house-castle-brick-wall-facade.webp', 'freepik.com (vectorpouch)')]),
    CommunityCoverImageData(CommunityCoverImageDataType.sample,
        sample: [
          GraphicalResource('vectorpouch:woman-greenhouse-time-care-garden-plants#light.webp', 'freepik.com (vectorpouch)'),
          GraphicalResource('vectorpouch:woman-greenhouse-time-care-garden-plants#night.webp', 'freepik.com (vectorpouch)')
        ]),
  ];

  final CommunityCoverImageDataType dataType;

  final List<GraphicalResource>? sample;
  final String? url;
  final String? localFilePath;

  bool get isAdaptive => sample?.length != 1;

  String? get firstFileName => sample==null?null:sample![0].path;
  String? get secondFileName => sample==null?null:isAdaptive?sample![1].path:null;

  String? get themedFileName{
    if(secondFileName == null) return firstFileName;
    return AppSettings.isDark?secondFileName:firstFileName;
  }

  String? get firstAuthor => sample==null?null:sample![0].author;
  String? get secondAuthor => sample==null?null:isAdaptive?sample![1].author:null;

  const CommunityCoverImageData(this.dataType, {this.sample, this.url, this.localFilePath});

  static CommunityCoverImageData from(Map responseData){

    // E.g.: vectorpouch:woman-greenhouse-time-care-garden-plants
    // E.g.: vectorpouch:car-parking-city-street#
    if(responseData.containsKey(samplePrefix)) {

      String code = responseData[samplePrefix];
      List<GraphicalResource> graphics = [];

      if(code.contains('#')){
        // String filePath = code.split(':')[1];
        String author = 'freepik.com (${code.split(':')[0]})';
        graphics.add(GraphicalResource('${code}light.webp', author));
        graphics.add(GraphicalResource('${code}night.webp', author));
      } else {
        // String filePath = code.split(':')[1];
        String author = 'freepik.com (${code.split(':')[0]})';
        graphics.add(GraphicalResource('$code.webp', author));
      }

      return CommunityCoverImageData(CommunityCoverImageDataType.sample, sample: graphics);

    // E.g.: www.image.com/0783450317984
    }else // if(responseData.containsKey(urlPrefix))
      return CommunityCoverImageData(CommunityCoverImageDataType.url, url: responseData[urlPrefix]);

  }

  Future<Map> toReqMap() async {

    switch(dataType){

      case CommunityCoverImageDataType.sample:
        if(isAdaptive) return {samplePrefix: '${firstFileName!.split('#')[0]}#'};
        else return {samplePrefix: firstFileName!.split('.')[0]};

      case CommunityCoverImageDataType.url:
        return {urlPrefix: url};

      case CommunityCoverImageDataType.localFile:
        return {filePrefix: base64.encode(File(localFilePath!).readAsBytesSync())};

    }

  }

  ImageProvider? getImageProvider({darkSample = false}){
    if(dataType == CommunityCoverImageDataType.localFile)
      return FileImage(File(localFilePath!));
    else if(dataType == CommunityCoverImageDataType.sample) {
      if(darkSample && secondFileName == null) return null;
      return AssetImage('assets/images/circle/cover_images/${darkSample ? secondFileName : firstFileName}');
    }else
      return NetworkImage(url??'', headers:{"Keep-Alive": "timeout=5"});
  }

  String get uniqueID{
    switch(dataType){

      case CommunityCoverImageDataType.sample:
        if(isAdaptive) return '$samplePrefix@${firstFileName!.split('#')}#';
        else return '$samplePrefix@$firstFileName';

      case CommunityCoverImageDataType.url:
        return '$urlPrefix@$url';

      case CommunityCoverImageDataType.localFile:
        return '$localFilePath@$localFilePath';

    }
  }

}