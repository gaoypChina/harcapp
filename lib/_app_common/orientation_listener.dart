import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/common.dart';

abstract class OrientationState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver{

  Orientation? _currentOrientation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    post(() => _currentOrientation = MediaQuery.of(context).orientation);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override void didChangeMetrics() {

    post((){
      MediaQueryData mediaQuery = MediaQuery.of(context);
      if(mediaQuery.orientation != _currentOrientation){
        _currentOrientation = MediaQuery.of(context).orientation;
        orientationChanged(_currentOrientation);
      }
    });

  }

  void orientationChanged(Orientation? orientation);

}
