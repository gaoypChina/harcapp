import 'package:flutter/material.dart';

class PeriodicRebuildWidget extends StatefulWidget{

  final Duration duration;
  final Widget Function(BuildContext context) builder;

  const PeriodicRebuildWidget({required this.duration, required this.builder, super.key});

  @override
  State<StatefulWidget> createState() => PeriodicRebuildWidgetState();


}

class PeriodicRebuildWidgetState extends State<PeriodicRebuildWidget>{

  void run() async {

    while(true){
      await Future.delayed(widget.duration);
      if(!mounted) return;
      setState(() {});
    }

  }

  @override
  void initState() {
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context);



}