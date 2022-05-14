import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import '../../api/circle.dart';
import 'model/circle.dart';

class CircleLoaderListener extends SingleComputerListener<String>{

  final void Function(List<Circle>)? onCirclesLoaded;

  const CircleLoaderListener({
    void Function()? onStart,
    Future<void> Function(String)? onError,
    this.onCirclesLoaded,
    void Function(String err, bool forceFinished)? onEnd
  }):super(
      onStart: onStart,
      onError: onError,
      onEnd: onEnd,
  );

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
        notAuthorized: () async {
          await callError('not_authorized');
          return true;
        },
        onError: (resp) => callError(null),
    );

    return true;
  }

}