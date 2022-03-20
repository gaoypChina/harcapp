import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/provider.dart';
import 'package:provider/provider.dart';

import '../../../_common_classes/org/org_switcher.dart';
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

  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<OrgProvider>(
    builder: (context, prov, child) => ChangeNotifierProvider(
      create: (context) => TabBarProvider(),
      builder: (context, child) => BottomNavScaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
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
            )
          ],
          body: LayoutBuilder(
            builder: (context, constraints){
              if(prov.current == Org.zhp) return ChildZHP(controller);
              else if(prov.current == Org.zhr_o) return ChildZHR(controller);
              else if(prov.current == Org.fse) return ChildFSE(controller);
              else return Container();
            },
          ),
        ),
      ),
    ),
  );

}
