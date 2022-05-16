import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:provider/provider.dart';

import '../../module_statistics_registrator.dart';
import 'child_fse.dart';
import 'child_zhp.dart';
import 'child_zhr.dart';

enum Pion {zuch, harcerz, wedrownik}

class PrawoPrzyrzeczenieFragment extends StatefulWidget {

  const PrawoPrzyrzeczenieFragment({super.key});

  @override
  State createState() => PrawoPrzyrzeczenieFragmentState();

}

class PrawoPrzyrzeczenieFragmentState extends State<PrawoPrzyrzeczenieFragment> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.prawoPrzyrzeczenie;

  static const List<Org> allowedOrgs = [
    Org.fse,
    Org.zhp,
    Org.zhr_o,
  ];

  // 0 - zuch
  // 1 - harc
  // 2 - wedro
  late Pion lastViewedPion;

  @override
  void initState() {
    lastViewedPion = Pion.harcerz;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<OrgProvider>(
    builder: (context, prov, child) => Builder(
      builder: (context){
        if(prov.current == Org.zhp)
          return ChildZHP(
            initPion: lastViewedPion,
            allowedOrgs: allowedOrgs,
            onTabChanged: (pion) => lastViewedPion = pion,
          );
        else if(prov.current == Org.zhr_o || prov.current == Org.zhr_c || prov.current == Org.zhr_d)
          return ChildZHR(
            initPion: lastViewedPion,
            allowedOrgs: allowedOrgs,
            onTabChanged: (pion) => lastViewedPion = pion,
          );
        else if(prov.current == Org.fse)
          return ChildFSE(
            initPion: lastViewedPion,
            allowedOrgs: allowedOrgs,
            onTabChanged: (pion) => lastViewedPion = pion,
          );
        else
          return Container();
      },
    ),
  );

}
