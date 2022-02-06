import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_cards/org_card_widget_remplate.dart';
import 'package:harcapp/_new/details/_main.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/harc_app.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha_button.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import '../app_drawer.dart';
import '../cat_page.dart';
import 'games/_main_page.dart';
import 'games/_main_row.dart';
import 'organizations/_main.dart';
import 'organizations/org_cards/all_data.dart';

class CatPageOther extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => CatPageOtherState();

}

class CatPageOtherState extends CatPageState<CatPageOther>{

  @override
  ColorPack get colorPack => ColorPackOther();

  PageController controller;
  ValueNotifier<double> notifier;

  List<Widget> children;

  @override
  Widget build(BuildContext context) {


    controller = PageController(viewportFraction: Dimen.viewportFraction(context));
    notifier = ValueNotifier(0);
    controller.addListener(() => notifier.value = controller.page);
    post(() => notifier.value = controller.page);

    children = [];
    for(int i=0; i<orgCardWidgets.length; i++)
      children.add(
          AnimatedBuilder(
              animation: notifier,
              builder: (context, child) =>
                  Transform.translate(
                    offset: Offset(
                        MediaQuery
                            .of(context)
                            .size
                            .width * (i - notifier.value) * 0.02,
                        0
                    ),
                    child: orgCardWidgets[i],
                  )
          )
      );

    return AppScaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: AccountHeaderIcon(),
              backgroundColor: background_(context),
              shadowColor: Colors.transparent,
              //automaticallyImplyLeading: false,
              title: HarcApp(size: Dimen.TEXT_SIZE_APPBAR, color: iconEnab_(context)),
              centerTitle: true,
              actions: [SizedBox(width: Dimen.ICON_FOOTPRINT)],

            ),

          ];
        },
        body: ListView(
          clipBehavior: Clip.none,
          physics: BouncingScrollPhysics(),
          children: [

            Padding(
              padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              child: Column(
                children: [

                  StrefaDuchaButton(),

                  SizedBox(height: Dimen.SIDE_MARG),

                  TitleShortcutRowWidget(
                    title: 'Gierki',
                    textAlign: TextAlign.start,
                    onOpen: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => GamesPage())),
                  ),

                  SizedBox(
                      height: 200,
                      child: GamesPreviewRow()
                  ),

                  SizedBox(height: Dimen.SIDE_MARG),

                  TitleShortcutRowWidget(
                    title: 'Org. harcerskie i skautowe',
                    textAlign: TextAlign.start,
                    onOpen: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => OrganizationsPage())),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: OrgCardWidgetTemplate.height,
              child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  children: children,
                  clipBehavior: Clip.none
              ),
            ),

            SizedBox(height: Dimen.SIDE_MARG),

          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigator(),
    );
  }

}