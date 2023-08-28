import 'dart:async';

class SingleComputerListener<TErr>{

  final FutureOr<void> Function()? onStart;
  final FutureOr<void> Function(TErr?)? onError;
  final FutureOr<void> Function(TErr? err, bool forceFinished)? onEnd;

  const SingleComputerListener({this.onStart, this.onError, this.onEnd});

}

class SingleComputerApiListener<TErr> extends SingleComputerListener<TErr>{

  final FutureOr<void> Function()? onNoInternet;
  final FutureOr<bool> Function()? onForceLoggedOut;
  final FutureOr<bool> Function()? onServerMaybeWakingUp;

  const SingleComputerApiListener({
    super.onStart,
    super.onError,
    required this.onNoInternet,
    this.onForceLoggedOut,
    this.onServerMaybeWakingUp,
    super.onEnd
  });

}