import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab_indicator.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'apel_ewan_thumbnail_widget.dart';

class ApelEwansPage extends StatefulWidget{

  final List<ApelEwan> allApelEwans;

  const ApelEwansPage(this.allApelEwans, {super.key});
  
  @override
  State<StatefulWidget> createState() => ApelEwansPageState();

}

class ApelEwansPageState extends State<ApelEwansPage>{

  List<ApelEwan> get allApelEwans => widget.allApelEwans;
  
  late List<ApelEwan> searchedApelEwans;

  @override
  void initState() {
    searchedApelEwans = [];
    searchedApelEwans.addAll(allApelEwans);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: DefaultTabController(
      length: 2,
      child: ExtendedNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

          SliverAppBar(
            title: const Text('Apele ewangeliczne'),
            centerTitle: true,
            floating: true,
            elevation: 0,
            pinned: true,
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              tabs: const [
                Tab(text: 'Wszystkie'),
                Tab(text: '10 Przykazań',)
              ],
              indicator: FolderTabIndicator(context),
              splashBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppCard.BIG_RADIUS),
                  topRight: Radius.circular(AppCard.BIG_RADIUS)
              ),
            ),
          ),

        ],
        pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
        body: Container(
          color: backgroundIcon_(context),
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [

              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [

                  FloatingContainer(
                    builder: (context, __, _) => SearchField(
                      background: backgroundIcon_(context),
                      preBackground: background_(context),
                      hint: 'Szukaj...',
                      onChanged: (text){

                        if(text.isEmpty)
                          setState(() => this.searchedApelEwans = allApelEwans);

                        List<ApelEwan> searchedApelEwans = [];

                        text = remPolChars(text);
                        for(ApelEwan apelEwan in allApelEwans) {
                          if (remPolChars(apelEwan.siglum
                              .replaceAll(' ', '')
                              .replaceAll(',', '')
                              .replaceAll('-', '')
                          ).contains(text.replaceAll(' ', '')
                              .replaceAll(',', '')
                              .replaceAll('-', '')
                          )) {
                            searchedApelEwans.add(apelEwan);
                            continue;
                          }

                          for (String title in apelEwan.subgroupTitle.values)
                            if (remPolChars(title).contains(text)) {
                              searchedApelEwans.add(apelEwan);
                              break;
                            }
                        }

                        setState(() => this.searchedApelEwans = searchedApelEwans);

                      },
                    ),
                    height: SearchField.height,
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    sliver: SliverGrid.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: Dimen.ICON_MARG,
                      mainAxisSpacing: Dimen.ICON_MARG,
                      childAspectRatio: 1,
                      children: searchedApelEwans.map((apelEwans) => ApelEwanThumbnailWidget(
                        apelEwans,
                      )).toList(),
                    ),
                  ),

                ],
              ),

              ApelEwanGridPage(
                  dekalogApelEwans,
                  dekalogApelEwansSuffix
              ),

            ],
          ),
        ),
      )
    ),
  );

}

class ApelEwanGridPage extends StatelessWidget{

  final List<ApelEwan> apelEwans;
  final String subgroupSuffix;

  const ApelEwanGridPage(this.apelEwans, this.subgroupSuffix, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GridView.count(
    padding: const EdgeInsets.all(Dimen.ICON_MARG),
    physics: const BouncingScrollPhysics(),
    crossAxisCount: 3,
    crossAxisSpacing: Dimen.ICON_MARG,
    mainAxisSpacing: Dimen.ICON_MARG,
    childAspectRatio: 1,
    children: apelEwans.map((apelEwans) => ApelEwanThumbnailWidget(
      apelEwans,
      subgroup: subgroupSuffix,
    )).toList(),
  );

}