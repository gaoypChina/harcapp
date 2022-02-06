
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:sensors/sensors.dart';

enum GyroscofeShift{
  ABSOLUITE,
  FACTOR
}

class GyroscopeWidget extends StatefulWidget {
  final GlobalKey globalKey;
  final Widget child;
  final double multipleX;
  final double multipleY;
  final double scale;
  final GyroscofeShift shift;

  GyroscopeWidget({
    this.globalKey,
    this.child,
    this.multipleX: 1,
    this.multipleY: 1,
    this.scale: 1,
    this.shift: GyroscofeShift.ABSOLUITE
  }):super(key: globalKey);

  static GyroscopeWidget fill({GlobalKey key, @required Widget child, @required double scale}){
    return GyroscopeWidget(
      globalKey: key??GlobalKey(),
      child: child,
      scale: scale,
      multipleX: (1 - scale)/2,
      multipleY: (1 - scale)/2,
      shift: GyroscofeShift.FACTOR,
    );

  }

  @override
  _GyroscopeWidgetState createState() => _GyroscopeWidgetState();
}

class _GyroscopeWidgetState extends State<GyroscopeWidget>{

  ValueNotifier<List<double>> notifier;
  static const double _max = 9.81;

  double childWidth;
  double childHeight;

  @override
  void initState() {
    super.initState();

    notifier = ValueNotifier([0, 0]);

    accelerometerEvents.listen((AccelerometerEvent event) =>
      notifier.value = [event.x/_max * widget.multipleX, event.z/_max * widget.multipleY]
    );

    childWidth = 1;
    childHeight = 1;
  }

  @override
  Widget build(BuildContext context) {

    if(widget.globalKey!=null)
      post((){
        childWidth = widget.globalKey.currentContext.size.width;
        childHeight = widget.globalKey.currentContext.size.height;
      });

    return
    widget.shift == GyroscofeShift.ABSOLUITE?
    AnimatedBuilder(
      //key: widget.globalKey,
      animation: notifier,
      child: widget.child,
      builder: (context, child) => Transform.translate(
          offset: Offset(
              -notifier.value[0],
              -notifier.value[1]
          ),
          child: Transform.scale(scale: widget.scale, child: child)
      ),
    )
    :
    AnimatedBuilder(
      //key: widget.globalKey,
      animation: notifier,
      child: widget.child,
      builder: (context, child){

        return Transform.translate(
            offset: Offset(
                -notifier.value[0]*childWidth,
                -notifier.value[1]*childHeight
            ),
            child: Transform.scale(scale: widget.scale, child: child)
        );

      },
    );

  }
}