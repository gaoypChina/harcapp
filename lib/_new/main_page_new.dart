import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';

import 'cat_page_guide_book/_main.dart';
import 'cat_page_harcthought/_main.dart';
import 'cat_page_home/_main.dart';
import 'cat_page_other/_main.dart';
import 'cat_page_song_book/_main.dart';

class MainPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MainPageState();

}

class MainPageState extends State<MainPage>{

  int selectedIndex;
  Widget page;

  @override
  void initState() {
    selectedIndex = 0;
    page = CatPageHome();

    //post(() => Provider.of<MainProvider>(context, listen: false).statusBarHeight = MediaQuery.of(context).padding.top);

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

              //floatingActionButton: AppFloatingButton(),

              body: Consumer<AppBottomNavigatorProvider>(
                  builder: (context, prov, child) {
                    switch(prov.selectedIndex){
                      //case AppBottomNavigator.HOME:
                      //  return CatPageHome();
                      //case AppBottomNavigator.MAP:
                      //  return CatPageHarcMap();
                      case AppBottomNavigator.SONGBOOK:
                        return CatPageSongBook();
                      case AppBottomNavigator.GUIDEBOOK:
                        return CatPageGuideBook();
                      case AppBottomNavigator.HARCTHOUGHT:
                        return CatPageHarcThought();
                      case AppBottomNavigator.OTHER:
                        return CatPageOther();
                      default:
                        return CatPageHome();
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

  double statusBarHeight;

  void recalculate() => notifyListeners();

}