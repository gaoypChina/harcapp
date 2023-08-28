
import 'dart:async';

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'model/trop.dart';

TropSharedPreviewsLoader tropSharedPreviewsLoader = TropSharedPreviewsLoader();

abstract class TropLoaderError{}

class TropSharedPreviewsLoaderListener extends SingleComputerApiListener<TropLoaderError>{

  final FutureOr<void> Function(List<TropSharedPreviewData>, bool)? onSharedPrevsLoaded;

  TropSharedPreviewsLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onSharedPrevsLoaded,
  });
}

class TropSharedPreviewsLoader extends SingleComputer<TropLoaderError, TropSharedPreviewsLoaderListener>{

  @override
  String get computerName => 'TropSharedPreviewsLoader';

  bool get tropPreviewEmpty => TropSharedPreviewData.all?.isEmpty??true;

  late bool reloadAll;

  @override
  Future<bool> run({bool awaitFinish = false, bool reloadAll=false}){
    this.reloadAll = reloadAll;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {

    if(!await isNetworkAvailable()){
      for (TropSharedPreviewsLoaderListener listener in listeners)
        listener.onNoInternet?.call();
      return;
    }

    bool thisReloadAll = reloadAll;

    await ApiTrop.getSharedTropPreviews(
      pageSize: Trop.tropPageSize,
      lastStartDate: thisReloadAll || tropPreviewEmpty ?
      null :
      TropSharedPreviewData.all!.last.startDate,

      lastName: thisReloadAll || tropPreviewEmpty ?
      null :
      TropSharedPreviewData.all!.last.name,

      lastTropKey: thisReloadAll || tropPreviewEmpty ?
      null :
      TropSharedPreviewData.all!.last.key,

      searchPhrase: '',

      onSuccess: (tropPrevsPage) {
        if (thisReloadAll)
          TropSharedPreviewData.setAll(tropPrevsPage);
        else
          TropSharedPreviewData.addAllToAll(tropPrevsPage);

        TropSharedPreviewData.moreToLoad = tropPrevsPage.length == Trop.tropPageSize;

        if (tropPrevsPage.length != Trop.tropPageSize) {
          Trop.removeAbsentPreviewsFromShared();
          TropSharedPreviewData.removeAbsent();
        }

        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onSharedPrevsLoaded?.call(tropPrevsPage, thisReloadAll);

      },
      onForceLoggedOut: () {
        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onForceLoggedOut?.call();
        return true;
      },
      onServerMaybeWakingUp: () {
        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onServerMaybeWakingUp?.call();
        return true;
      },
      onError: () {
        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onError?.call(null);
      },
    );
  }

}