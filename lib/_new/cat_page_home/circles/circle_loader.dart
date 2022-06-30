import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import '../../api/circle.dart';
import 'model/circle.dart';

class CircleLoaderListener extends SingleComputerApiListener<String>{

  final void Function(List<Circle>)? onCirclesLoaded;

  const CircleLoaderListener({
    super.onStart,
    super.onError,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onCirclesLoaded,
  });

}

CircleLoader circleLoader = CircleLoader();
class CircleLoader extends SingleComputer<String?, CircleLoaderListener>{

  @override
  String get computerName => 'CircleLoader';

  CircleLoader();

  @override
  Future<bool> perform() async {
    if(!await isNetworkAvailable())
      return false;

    await ApiCircle.getAll(
        onSuccess: (List<Circle> comps){

          Circle.silentInit(comps);

          for(CircleLoaderListener? listener in listeners)
            listener!.onCirclesLoaded?.call(comps);
        },
      onServerMaybeWakingUp: () async {
        for(CircleLoaderListener? listener in listeners)
          listener!.onServerMaybeWakingUp?.call();

        return true;
      },
      onForceLoggedOut: () async {
        for(CircleLoaderListener? listener in listeners)
          listener!.onForceLoggedOut?.call();

        return true;
      },
        onError: (resp) => callError(null),
    );

    return true;
  }

}