import 'package:flutter/cupertino.dart';

import '../../module_statistics_registrator.dart';
import '../common/short_read_widget.dart';
import 'gaweda.dart';

class GawedaWidget extends StatelessWidget{

  final Gaweda gaweda;

  const GawedaWidget(this.gaweda, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ShortReadWidget<Gaweda>(ModuleStatsMixin.myslHarcGawedy, gaweda);

}