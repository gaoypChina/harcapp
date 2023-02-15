import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';

import 'cat_page_guidebook_development/_main.dart';
import 'cat_page_harc_map/_main.dart';
import 'cat_page_harcthought/_main.dart';
import 'cat_page_home/_main.dart';
import 'cat_page_song_book/_main.dart';
import 'cat_page_strefa_ducha/_main.dart';

class MainPage extends StatefulWidget{

  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => MainPageState();

}

class MainPageState extends State<MainPage>{

  late int selectedIndex;
  late Widget page;

  @override
  void initState() {
    selectedIndex = 0;
    page = const CatPageHome();

    super.initState();
  }

  EdgeInsets screenPadding() => MediaQuery.of(context).padding;

  @override
  Widget build(BuildContext context){

    post(() => App.statusBarHeight = MediaQuery.of(context).padding.top);

    return WillPopScope(
      onWillPop: () async{
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
        body: Consumer<AppBottomNavigatorProvider>(
            builder: (context, prov, child) {
              switch(prov.selectedIndex){
                case AppBottomNavItem.home:
                  return const CatPageHome();
                case AppBottomNavItem.map:
                  return const CatPageHarcMap();
                case AppBottomNavItem.songBook:
                  return const CatPageSongBook();
                case AppBottomNavItem.guidebook:
                  return const CatPageGuidebookDevelopment();
                case AppBottomNavItem.harcThought:
                  return const CatPageHarcThought();
                case AppBottomNavItem.strefaDucha:
                  return const CatPageStrefaDucha();
                default:
                  return const CatPageGuidebookDevelopment();
              }
            }
        ),

        //bottomNavigationBar: AppBottomNavigator(),
      ),
    );
  }

}

