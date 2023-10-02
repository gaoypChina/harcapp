import 'dart:async';

class SingleComputerListener<TErr>{

  bool toBeRemoved;

  final FutureOr<void> Function()? onStart;
  final FutureOr<void> Function(TErr?)? onError;
  final FutureOr<void> Function(TErr? err, bool unknownErrorCalled, bool forceFinished)? onEnd;

  SingleComputerListener({this.onStart, this.onError, this.onEnd})
      : toBeRemoved = false;

}

class SingleComputerApiListener<TErr> extends SingleComputerListener<TErr>{

  final FutureOr<void> Function()? onNoInternet;
  final FutureOr<bool> Function()? onForceLoggedOut;
  final FutureOr<bool> Function()? onServerMaybeWakingUp;

  SingleComputerApiListener({
    super.onStart,
    super.onError,
    required this.onNoInternet,
    this.onForceLoggedOut,
    this.onServerMaybeWakingUp,
    super.onEnd
  });

}