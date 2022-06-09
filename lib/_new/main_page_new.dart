import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';

import 'cat_page_guide_book/_main.dart';
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

  int? selectedIndex;
  Widget? page;

  @override
  void initState() {
    selectedIndex = 0;
    page = const CatPageHome();

    super.initState();
  }

  EdgeInsets screenPadding() => MediaQuery.of(context).padding;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Consumer<MainProvider>(
          builder: (context, prov, child){
            post(() => Provider.of<MainProvider>(context, listen: false).statusBarHeight = MediaQuery.of(context).padding.top);
            return Container();
          },
        ),
        Expanded(
          child: WillPopScope(
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
                        return const CatPageGuideBook();
                      case AppBottomNavItem.harcThought:
                        return const CatPageHarcThought();
                      case AppBottomNavItem.strefaDucha:
                        return const CatPageStrefaDucha();
                      default:
                        return const CatPageGuideBook();
                    }
                  }
              ),

              //bottomNavigationBar: AppBottomNavigator(),
            ),
          ),
        )
      ],
    );
  }

}


/*
class AppFloatingButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Consumer<FloatingButtonProvider>(
      builder: (context, prov, child) =>
        prov.show?
        prov.builder(/*context*/):
        Container(),
    );

  }

}
*/

class MainProvider extends ChangeNotifier{

  static MainProvider of(BuildContext context) => Provider.of<MainProvider>(context, listen: false);

  late double statusBarHeight;

  void recalculate() => notifyListeners();

}