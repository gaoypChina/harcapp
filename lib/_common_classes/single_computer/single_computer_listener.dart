class SingleComputerListener<TErr>{

  final void Function()? onStart;
  final Future<void> Function(TErr)? onError;
  final void Function(TErr err, bool forceFinished)? onEnd;

  const SingleComputerListener({this.onStart, this.onError, this.onEnd});

}