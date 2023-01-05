import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../main.dart';
import 'app_drawer.dart';

class AppBottomNavigatorProvider extends ChangeNotifier{

  static const initIndex = AppBottomNavItem.guidebook;

  static late AppBottomNavigatorProvider _prov;

  static AppBottomNavigatorProvider of(BuildContext context) =>
      Provider.of<AppBottomNavigatorProvider>(context, listen: false);

  late List<void Function(int)> _listeners;

  late AppBottomNavItem _selectedIndex;
  AppBottomNavItem get selectedIndex => _selectedIndex;
  set selectedIndex(AppBottomNavItem value){
    _selectedIndex = value;
    notifyListeners();
  }

  Color? _background;
  Color? get background => _background;
  set background(value){
    _background = value;
    notifyListeners();
  }

  AppBottomNavigatorProvider(){
    _listeners = [];
    _selectedIndex = initIndex;
    _background = null;
  }

  void init(AppBottomNavigatorProvider prov) => _prov = prov;

  static void addOnSelectedListener(void Function(int) listener) =>
      _prov._listeners.add(listener);

  static void removeOnSelectedListener(void Function(int) listener) =>
      _prov._listeners.remove(listener);

  void notify() => notifyListeners();

}

enum AppBottomNavItem{
  home,
  map,
  songBook,
  guidebook,
  harcThought,
  strefaDucha
}

class AppBottomNavigator extends StatelessWidget{

  static const heroTag = 'AppBottomNavigator';

  final Color? background;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;

  const AppBottomNavigator({this.background, this.selectedItemColor, this.unselectedItemColor, this.elevation, super.key});

  static int bottomNavBarToIndex(AppBottomNavItem item){

    // This has to return all values from 0..n;

    if(account)
      switch(item){
        case AppBottomNavItem.home: return 0;
        case AppBottomNavItem.map: return 1;
        case AppBottomNavItem.songBook: return 2;
        case AppBottomNavItem.guidebook: return 3;
        case AppBottomNavItem.harcThought: return 4;
        case AppBottomNavItem.strefaDucha: return 5;
      }
    else
      switch(item){
        case AppBottomNavItem.songBook: return 0;
        case AppBottomNavItem.guidebook: return 1;
        case AppBottomNavItem.harcThought: return 2;
        case AppBottomNavItem.strefaDucha: return 3;
      }

    return 1;
  }

  static AppBottomNavItem indexToBottomNavBarItem(int index){

    // This has to accept as an argument all values from 0..n;

    if(account)
      switch(index){
        case 0: return AppBottomNavItem.home;
        case 1: return AppBottomNavItem.map;
        case 2: return AppBottomNavItem.songBook;
        case 3: return AppBottomNavItem.guidebook;
        case 4: return AppBottomNavItem.harcThought;
        case 5: return AppBottomNavItem.strefaDucha;
        default: return AppBottomNavItem.guidebook;
      }
    else
      switch(index){
        case 0: return AppBottomNavItem.songBook;
        case 1: return AppBottomNavItem.guidebook;
        case 2: return AppBottomNavItem.harcThought;
        case 3: return AppBottomNavItem.strefaDucha;
        default: return AppBottomNavItem.guidebook;
      }
  }

  @override
  Widget build(BuildContext context) => Hero(
    tag: heroTag,
    child: PhysicalModel(
      elevation: elevation??AppCard.bigElevation,
      color: Colors.transparent,
      child: Consumer<AppBottomNavigatorProvider>(
          builder: (context, prov, child) => BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: selectedItemColor??iconEnab_(context),
            selectedIconTheme: IconThemeData(color: selectedItemColor??iconEnab_(context)),
            unselectedIconTheme: IconThemeData(color: unselectedItemColor??iconDisab_(context)),
            showUnselectedLabels: false,
            currentIndex: bottomNavBarToIndex(prov.selectedIndex),
            onTap: (index){
              prov.selectedIndex = indexToBottomNavBarItem(index);
              for(void Function(int) listener in prov._listeners)
                listener(index);

              appNavigatorObserver.callNavBarChanged();
            },
            items: [

              if(account)
                BottomNavigationBarItem(
                    backgroundColor: prov.background??background??background_(context),
                    icon: const Icon(MdiIcons.accountCircleOutline),
                    //activeIcon: Icon(MdiIcons.accountCircle),
                    label: 'Skromny ja'
                ),

              if(account)
                BottomNavigationBarItem(
                    backgroundColor: background??background_(context),
                    icon: const Icon(MdiIcons.mapLegend),
                    //activeIcon: Icon(MdiIcons.map),
                    label: 'Harc mapa'
                ),

              BottomNavigationBarItem(
                  backgroundColor: prov.background??background??background_(context),
                  icon: const Icon(MdiIcons.music),
                  label: 'Śpiewnik'
              ),
              BottomNavigationBarItem(
                  backgroundColor: prov.background??background??background_(context),
                  icon: const Icon(MdiIcons.notebookOutline),
                  //activeIcon: Icon(MdiIcons.notebook),
                  label: 'Poradnik'
              ),
              BottomNavigationBarItem(
                  backgroundColor: prov.background??background??background_(context),
                  icon: const Icon(MdiIcons.lightbulbOutline),
                  //activeIcon: Icon(MdiIcons.lightbulb),
                  label: 'Harc myśl'
              ),
              BottomNavigationBarItem(
                  backgroundColor: prov.background??background??background_(context),
                  icon: const Icon(MdiIcons.candle),
                  label: 'Strefa ducha'
              )
            ],

          )

      ),
    ),
  );

}