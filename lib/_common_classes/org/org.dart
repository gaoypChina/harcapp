import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org_handler.dart';
import 'package:provider/provider.dart';

enum Org{zhp, zhr_o, zhr_c, zhr_d, fse, sh, zhp_n_l, hrp}

double backgroundTextSize(BuildContext context) => MediaQuery.of(context).size.width/3;

const Map<Org, int> orgToInt = {
  Org.zhp:0,
  Org.zhr_o:1,
  Org.zhr_c:2,
  Org.zhr_d:3,
  Org.fse:4,
  Org.sh:5,
  Org.zhp_n_l:6,
  Org.hrp:7,
};

const Map<int, Org> orgFromInt = {
  0:Org.zhp,
  1:Org.zhr_o,
  2:Org.zhr_c,
  3:Org.zhr_d,
  4:Org.fse,
  5:Org.sh,
  6:Org.zhp_n_l,
  7:Org.hrp,
};

const Map<Org, String> orgName = {
  Org.zhp:'ZHP',
  Org.zhr_o:'ZHR',
  Org.zhr_c:'ZHR', //♂
  Org.zhr_d:'ZHR', //♀
  Org.fse:'FSE',
  Org.sh:'SH',
  Org.zhp_n_l:'ZHPnL',
  Org.hrp:'HRP',
};

const Map<Org, Color> orgColor = {
  Org.zhp:Colors.green,//AppColors.zhp_green,
  Org.zhr_o:Colors.deepOrange,
  Org.zhr_c:Colors.deepOrange,
  Org.zhr_d:Colors.deepOrange,
  Org.fse:Colors.amber,
  Org.sh:Colors.blue,
  Org.zhp_n_l:Colors.teal,
  Org.hrp:Colors.red,
};

const Map<Org, String> orgFullName = {
  Org.zhp:'Związek Harcerstwa Polskiego',
  Org.zhr_o:'Związek Harcerstwa Rzeczypospolitej',
  Org.zhr_c:'Związek Harcerstwa Rzeczypospolitej',
  Org.zhr_d:'Związek Harcerstwa Rzeczypospolitej',
  Org.fse:'Federacja Skautingu Europejskiego',
  Org.sh:'Stowarzyszenie Harcerskie',
  Org.zhp_n_l:'Związek Harcerstwa Polskiego na Litwie',
  Org.hrp:'Harcerstwo Rzeczypospolitej Polskiej'
};



class OrgProvider extends ChangeNotifier{

  static OrgProvider of(BuildContext context) => Provider.of<OrgProvider>(context, listen: false);

  Org get current => OrgHandler.current;

  set current(Org value){
    OrgHandler.current = value;
    notifyListeners();
  }

  Org nextFrom(List<Org> allowedOrgs){
    Org nextOrg = OrgHandler.nextFrom(allowedOrgs);
    notifyListeners();
    return nextOrg;
  }

  Org currentFrom(List<Org> allowedOrgs) => OrgHandler.currentFrom(allowedOrgs);

}
