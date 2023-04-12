import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:tuple/tuple.dart';

enum GyroscofeShift{
  ABSOLUITE,
  FACTOR
}

class GyroscopeWidget extends StatefulWidget {
  final Widget? child;
  final double multipleX;
  final double multipleY;
  final double scale;
  final GyroscofeShift shift;

  const GyroscopeWidget({
    this.child,
    this.multipleX = 1,
    this.multipleY = 1,
    this.scale = 1,
    this.shift = GyroscofeShift.ABSOLUITE,
    Key? key
  }):super(key: key);

  static GyroscopeWidget fill({required Widget child, required double scale, Key? key}) => GyroscopeWidget(
    scale: scale,
    multipleX: (1 - scale)/2,
    multipleY: (1 - scale)/2,
    shift: GyroscofeShift.FACTOR,
    key: key,
    child: child,
  );

  @override
  _GyroscopeWidgetState createState() => _GyroscopeWidgetState();

}

class _GyroscopeWidgetState extends State<GyroscopeWidget>{

  late ValueNotifier<Tuple2<double, double>> notifier;
  static const double _max = 9.81;

  late double childWidth;
  late double childHeight;

  late double maxX;
  late double maxY;

  late GlobalKey globalKey;

  @override
  void initState() {
    super.initState();

    notifier = ValueNotifier(const Tuple2(0, 0));

    maxX = _max / widget.multipleX;
    maxY = _max / widget.multipleY;

    // This should be:
    // gyroscopeEvents.listen((GyroscopeEvent event)
    // But it seems someone named it wrong.
    accelerometerEvents.listen((AccelerometerEvent event){
      notifier.value = Tuple2(event.x, event.z);
    });

    childWidth = 1;
    childHeight = 1;

    globalKey = GlobalKey();
    if(widget.shift == GyroscofeShift.FACTOR)
      post((){
        childWidth = globalKey.currentContext!.size!.width;
        childHeight = globalKey.currentContext!.size!.height;
      });
  }

  @override
  Widget build(BuildContext context) =>
    widget.shift == GyroscofeShift.ABSOLUITE?
    AnimatedBuilder(
      key: globalKey,
      animation: notifier,
      child: Transform.scale(scale: widget.scale, child: widget.child),
      builder: (context, child) => Transform.translate(
          filterQuality: FilterQuality.none,
          offset: Offset(
              -notifier.value.item1/maxX,
              -notifier.value.item2/maxY
          ),
          child: child,
      ),
    ) :
    AnimatedBuilder(
      key: globalKey,
      animation: notifier,
      child: Transform.scale(scale: widget.scale, child: widget.child),
      builder: (context, child) => Transform.translate(
        filterQuality: FilterQuality.none,
        offset: Offset(
            -notifier.value.item1*childWidth/maxX,
            -notifier.value.item2*childHeight/maxY
        ),
        child: child,
      ),
    );

}