import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'circle/model/circle.dart';
import 'circle/start_widgets/circle_loading_widget.dart';
import 'circle/start_widgets/circle_preview_widget.dart';
import 'circle/start_widgets/circle_prompt_login.dart';
import 'community_editor/_main.dart';
import 'forum/model/forum.dart';
import 'model/community.dart';
import 'communities_loader.dart';
import 'community_widget.dart';

class SearchForumPage extends StatefulWidget{

  const SearchForumPage({super.key});

  @override
  State<StatefulWidget> createState() => SearchForumPageState();

}

class SearchForumPageState extends State<SearchForumPage>{

  StreamSubscription<ConnectivityResult>? networkListener;
  late bool networkAvailable;

  late List<Community> searchedForums;
  
  @override
  void initState() {

    networkAvailable = true;
    () async {
      networkAvailable = await isNetworkAvailable();
      if(mounted) setState((){});
    }();

    networkListener = addConnectionListener((hasConnection) async{
      networkAvailable = hasConnection;
      if(!mounted) return;
      setState((){});
      if(!hasConnection)
        showAppToast(context, text: 'Brak internetu');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
        physics:
        const BouncingScrollPhysics(),

        slivers: [
          const SliverAppBar(
            title: Text('Szukaj forów'),
            centerTitle: true,
          ),

          SliverList(delegate: SliverChildListDelegate([

            const SearchField(
              hint: 'Nazwa forum:',
            )

          ]))

        ]
    ),
  );
  
}
