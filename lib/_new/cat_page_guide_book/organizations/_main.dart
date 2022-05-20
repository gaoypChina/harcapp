import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';

import 'org_pages/fse_org_widget.dart';
import 'org_pages/rrp_org_page.dart';
import 'org_pages/zhp_org_page.dart';
import 'org_pages/zhr_org_page.dart';


class OrganizationsPage extends StatefulWidget {

  const OrganizationsPage({super.key});

  @override
  State createState() => OrganizationsPageState();

}

class OrganizationsPageState extends State<OrganizationsPage>{

  @override
  Widget build(BuildContext context) {

    /*
    CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: const Text('Organizacje harcerskie i skautowe'),
            centerTitle: true,
            floating: true,
            backgroundColor: background_(context),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(
                delegate: SliverChildSeparatedBuilderDelegate(
                    (context, index) => orgCardWidgets[index],
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
                    count: orgCardWidgets.length
                )
            ),
          )

        ],
      ),
     */

    return BottomNavScaffold(
      body: DefaultTabController(
        length: 4,
        child: ExtendedNestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text('Organizacje harc. i skaut.'),
              centerTitle: true,
              floating: true,
              pinned: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                indicator: AppTabBarIncdicator(context: context),
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Federacja Skautingu Europejskiego'),
                  Tab(text: 'Związek Harcerstwa Rzeczypospolitej'),
                  Tab(text: 'Związek Harcerstwa Polskiego'),
                  Tab(text: 'Royal Rangers Polska'),
                ],
              ),
            )
          ],
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              FSEOrgWidget(),
              ZHROrgPage(),
              ZHPOrgPage(),
              RRPOrgPage(),
            ],
          ),
        ),
      )
    );

  }

}
