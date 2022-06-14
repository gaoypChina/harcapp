import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'models/indiv_comp.dart';

class IndivCompLoaderListener extends SingleComputerListener<String>{

  final void Function(List<IndivComp>)? onIndivCompsLoaded;

  const IndivCompLoaderListener({
    super.onStart,
    this.onIndivCompsLoaded,
    super.onError,
    super.onForceLoggedOut,
    super.onEnd
  });

}

IndivCompLoader indivCompLoader = IndivCompLoader();
class IndivCompLoader extends SingleComputer<String?, IndivCompLoaderListener>{

  @override
  String get computerName => 'IndivCompLoader';

  IndivCompLoader();

  @override
  Future<bool> perform() async {
    if(!await isNetworkAvailable())
      return false;

    await ApiIndivComp.getAll(
        onSuccess: (List<IndivComp> comps){

          IndivComp.silentInit(comps);

          for(IndivCompLoaderListener? listener in listeners)
            listener!.onIndivCompsLoaded?.call(comps);
        },
        onForceLoggedOut: () async {

          for(IndivCompLoaderListener? listener in listeners)
            listener!.onForceLoggedOut?.call();

          return true;
        },
        onError: (resp) => callError(null),
    );

    return true;
  }

}