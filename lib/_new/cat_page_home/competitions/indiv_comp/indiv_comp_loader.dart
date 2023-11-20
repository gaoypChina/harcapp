import 'dart:async';

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'models/indiv_comp.dart';

class IndivCompLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<IndivComp>)? onIndivCompsLoaded;

  IndivCompLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onIndivCompsLoaded,
  });

}

IndivCompLoader indivCompLoader = IndivCompLoader();
class IndivCompLoader extends SingleComputer<String?, IndivCompLoaderListener>{

  @override
  String get computerName => 'IndivCompLoader';

  IndivCompLoader();

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (IndivCompLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiIndivComp.getAll(
        onSuccess: (List<IndivComp> comps){

          IndivComp.silentInit(comps);

          for(IndivCompLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onIndivCompsLoaded?.call(comps);
        },
        onServerMaybeWakingUp: () async {
          for(IndivCompLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(IndivCompLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: (resp) => callKnownError(null),
    );

  }

}