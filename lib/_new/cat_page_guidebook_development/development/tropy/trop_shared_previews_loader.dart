
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'model/trop.dart';

TropSharedPreviewsLoader tropSharedPreviewsLoader = TropSharedPreviewsLoader();

abstract class TropLoaderError{}

class TropSharedPreviewsLoaderListener extends SingleComputerListener<TropLoaderError>{

  void Function()? onSuccess;
  void Function()? onForceLoggedOut;
  void Function()? onServerMaybeWakingUp;
  void Function()? onNoInternet;

  TropSharedPreviewsLoaderListener({
    super.onStart,
    super.onError,
    super.onEnd,

    this.onSuccess,
    this.onForceLoggedOut,
    this.onServerMaybeWakingUp,
    this.onNoInternet,
  });
}

class TropSharedPreviewsLoader extends SingleComputer<TropLoaderError, TropSharedPreviewsLoaderListener>{

  @override
  String get computerName => 'TropLoader';

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

    await ApiTrop.getSharedTropPreviews(
      pageSize: Trop.tropPageSize,
      lastStartTime: reloadAll || tropPreviewEmpty ?
      null :
      TropSharedPreviewData.all!.last.startDate.toIso8601String(),

      lastName: reloadAll || tropPreviewEmpty ?
      null :
      TropSharedPreviewData.all!.last.name,

      lastTropKey: reloadAll || tropPreviewEmpty ?
      null :
      TropSharedPreviewData.all!.last.key,

      onSuccess: (tropPrevsPage) {
        if (reloadAll)
          TropSharedPreviewData.setAll(tropPrevsPage);
        else
          TropSharedPreviewData.addAllToAll(tropPrevsPage);

        TropSharedPreviewData.moreToLoad = tropPrevsPage.length == Trop.tropPageSize;

        if (tropPrevsPage.length != Trop.tropPageSize) {
          Trop.removeAbsentPreviewsFromShared();
          TropSharedPreviewData.removeAbsent();
        }

        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onSuccess?.call();

      },
      onForceLoggedOut: () {
        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onForceLoggedOut?.call();

        // if(!mounted) return true;
        // showAppToast(context, text: forceLoggedOutMessage);
        // setState(() {});
        return true;
      },
      onServerMaybeWakingUp: () {
        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onServerMaybeWakingUp?.call();
        // if(!mounted) return true;
        // showServerWakingUpToast(context);
        return true;
      },
      onError: () {
        for (TropSharedPreviewsLoaderListener listener in listeners)
          listener.onError?.call(null);
        // if(!mounted) return;
        // showAppToast(context, text: simpleErrorMessage);
      },
    );
  }

}