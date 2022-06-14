import 'dart:async';

class SingleComputerListener<TErr>{

  final FutureOr<void> Function()? onStart;
  final FutureOr<void> Function(TErr?)? onError;
  final FutureOr<bool> Function()? onForceLoggedOut;
  final FutureOr<void> Function(TErr? err, bool forceFinished)? onEnd;

  const SingleComputerListener({this.onStart, this.onError, this.onForceLoggedOut, this.onEnd});

}