import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'models/indiv_comp.dart';

class IndivCompLoaderListener extends SingleComputerListener<String>{

  final void Function(List<IndivComp>) onIndivCompsLoaded;

  const IndivCompLoaderListener({
    void Function() onStart,
    Future<void> Function(String) onError,
    this.onIndivCompsLoaded,
    void Function(String err, bool forceFinished) onEnd
  }):super(
      onStart: onStart,
      onError: onError,
      onEnd: onEnd,
  );

}

IndivCompLoader indivCompLoader = IndivCompLoader();
class IndivCompLoader extends SingleComputer<String, IndivCompLoaderListener>{

  @override
  String get computerName => 'IndivCompProfileLoader';

  IndivCompLoader();

  @override
  Future<bool> perform() async {
    if(!await isNetworkAvailable())
      return false;

    await ApiIndivComp.getAll(
        onSuccess: (List<IndivComp> profiles){

          IndivComp.silentInit(profiles);

          for(IndivCompLoaderListener listener in listeners)
            listener.onIndivCompsLoaded?.call(profiles);
        },
        notAuthorized: () async {
          await callError('not_authorized');
          return true;
        },
        onError: (resp) => callError(null),
    );

    return true;
  }

}