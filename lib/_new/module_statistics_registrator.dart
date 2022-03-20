import 'package:flutter/material.dart';

import '../_common_classes/time_settings.dart';
import '../account/statistics.dart';
import '../logger.dart';


mixin ModuleStatsMixin<T extends StatefulWidget> on State<T>{

  // Skromny ja
  static const String indivComp = 'indivComp';

  // Stopnie i sprawności
  static const String stopnie = 'stopnie';
  static const String sprawnosci = 'sprawnosci';

  // Poradnik i rozwój
  static const String biografie = 'biografie';
  static const String chwyty = 'chwyty';
  static const String dokumenty = 'dokumenty';
  static const String historia = 'historia';
  static const String kuchniaHarcerska = 'kuchniaHarcerska';
  static const String las = 'las';
  static const String musztra = 'musztra';
  static const String okrzyki = 'okrzyki';
  static const String prawoPrzyrzeczenie = 'prawoPrzyrzeczenie';
  static const String slownik = 'slownik';
  static const String strefaInstruktora = 'strefaInstruktora';
  static const String strukturaFunkcje = 'strukturaFunkcje';
  static const String symbolika = 'symbolika';
  static const String szyfry = 'szyfry';
  static const String znakiPatrolowe = 'znakiPatrolowe';

  // Artykuły
  static const String myslHarcArtykuly = 'myslHarcArtykuly';
  static const String myslHarcGawedy = 'myslHarcGawedy';
  static const String myslHarcWiersze = 'myslHarcWiersze';
  static const String myslHarcFormy = 'myslHarcFormy';

  // Duch
  static const String strefaDucha = 'strefaDucha';

  // Gierki
  static const String graPytajki = 'graPytajki';
  static const String graSlowoKlucz = 'graSlowoKlucz';

  // Org
  static const String orgFSE = 'orgFSE';
  static const String orgRRP = 'orgRRP';
  static const String orgZHP = 'orgZHP';
  static const String orgZHR = 'orgZHR';

  String get moduleId;

  @override
  void initState() {
    () async {
      await moduleStatisticsRegistrator.open(moduleId);
    }();
    super.initState();
  }

  @override
  void dispose() {
    moduleStatisticsRegistrator.commit();
    super.dispose();
  }

}

ModuleStatisticsRegistrator moduleStatisticsRegistrator = ModuleStatisticsRegistrator();

class ModuleStatisticsRegistrator{

  int depth = 0;
  String _moduleId;
  DateTime _openTime;

  void clear(){
    _moduleId = null;
    _openTime = null;
  }

  Future<void> open(String moduleId) async {
    if(!await TimeSettings.isTimeAutomatic){
      logger.d('ModuleStatisticsRegistrator ($_moduleId) stats aborted. Time not automatic.');
      clear();
      return;
    }
    if(_moduleId != moduleId){
      _moduleId = moduleId;
      _openTime = DateTime.now();
      logger.d('ModuleStatisticsRegistrator ($_moduleId) opened.');
    }else{
      depth++;
      logger.d('ModuleStatisticsRegistrator ($_moduleId) pushed.');
    }
  }

  Future<void> commit() async {
    if(!await TimeSettings.isTimeAutomatic){
      clear();
      logger.d('ModuleStatisticsRegistrator ($_moduleId) stats aborted. Time not automatic.');
      return;
    }
    if(_moduleId == null) return;
    if(depth > 0){
      depth--;
      return;
    }

    Duration totalOpenDuration = DateTime.now().difference(_openTime);

    if(totalOpenDuration < const Duration(seconds: 3)) {
      logger.d('ModuleStatisticsRegistrator ($_moduleId, $totalOpenDuration) stat aborted. Open time too short.');
      clear();
      return;
    }
    Statistics.registerModuleAction(
        _moduleId,
        _openTime,
        totalOpenDuration,
    );

    logger.d('ModuleStatisticsRegistrator ($_moduleId, $totalOpenDuration) stats saved.');
    clear();
  }

}