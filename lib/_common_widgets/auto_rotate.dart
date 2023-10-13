import 'package:flutter/cupertino.dart';

class AutoRotate extends StatefulWidget{

  int speed;
  Widget? child;

  AutoRotate({super.key, required this.speed, this.child});

  @override
  State<StatefulWidget> createState() => AutoRotateState();

}

class AutoRotateState extends State<AutoRotate>{

  late ValueNotifier<double> notifier;

  @override
  void initState() {

    notifier = ValueNotifier<double>(0);

    () async {
      while(true) {
        await Future.delayed(const Duration(milliseconds: 16));
        notifier.value += 0.1;
      }
    }();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: notifier,
      builder: (BuildContext context, Widget? child)
        => Transform.rotate(
          angle: notifier.value,
          child: child,
        ),
      child: widget.child,
    );
  }

}