import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org.dart';
import 'package:harcapp/_common_widgets/colored_tab.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/provider.dart';
import 'package:provider/provider.dart';

import '../../module_statistics_registrator.dart';
import 'child_fse.dart';
import 'child_zhp.dart';
import 'child_zhr.dart';

enum Pion {zuch, harcerz, wedrownik}

class PrawoPrzyrzeczenieFragment extends StatefulWidget {

  const PrawoPrzyrzeczenieFragment({Key key}) : super(key: key);

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

  int counter = -1;
  String barButtonTitle;

  List<TabItem> tabs = [];

  TabController controller;

  @override
  void initState() {
    OrgManager.current = OrgManager.currentFrom(allowedOrgs);
    controller = TabController(vsync: this, length: 3, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => TabBarProvider(),
      builder: (context, child) => BottomNavScaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            buildAppBar(context)
          ],
          body: LayoutBuilder(
            builder: (context, constraints){
              if(OrgManager.current == Org.zhp) return ChildZHP(controller);
              else if(OrgManager.current == Org.zhr_o) return ChildZHR(controller);
              else if(OrgManager.current == Org.fse) return ChildFSE(controller);
              else return Container();
            },
          ),
        ),
      ),
    );
  }

  SliverAppBar buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      title: const Text('Prawo i Przyrzeczenie'),
      centerTitle: true,
      backgroundColor: background_(context),
      actions: <Widget>[
        OrgSwitcher(
            allowedOrgs: allowedOrgs,
            onTap: (currentOrg){
              showAppToast(context, text: orgFullName[currentOrg]);
              //AppScaffold.showMessage(context, orgFullName[currentOrg]);
              setState((){});
            }
        )
      ],
      bottom: PreferredSize(
        preferredSize: const TabBar(tabs: []).preferredSize,
        child: Consumer<TabBarProvider>(
          builder: (context, prov, child) =>
              prov.tabBarBuilder==null?Container():prov.tabBarBuilder(context),
        ),
      ),
    );
  }
}
