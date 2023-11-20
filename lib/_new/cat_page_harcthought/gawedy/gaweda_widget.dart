import 'package:flutter/material.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import '../common/short_read_widget.dart';
import 'gaweda.dart';

class GawedaWidget extends StatelessWidget{

  final Gaweda gaweda;

  const GawedaWidget(this.gaweda, {super.key});

  @override
  Widget build(BuildContext context) => ShortReadWidget<Gaweda>(ModuleStatsMixin.myslHarcGawedy, gaweda);

}