import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../main.dart';
import 'app_drawer.dart';

class AppBottomNavigatorProvider extends ChangeNotifier{

  static const initIndex = account?2:1;

  static late AppBottomNavigatorProvider _prov;

  static AppBottomNavigatorProvider of(BuildContext context) =>
      Provider.of<AppBottomNavigatorProvider>(context, listen: false);

  late List<void Function(int)> _listeners;

  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;
  set selectedIndex(value){
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

class AppBottomNavigator extends StatelessWidget{

  static const int HOME = account?0:999;
  //static const int MAP = 1;
  static const int SONGBOOK = account?1:0;
  static const int GUIDEBOOK = account?2:1;
  static const int HARCTHOUGHT = account?3:2;
  static const int STREFA_DUCHA = account?4:3;

  static const heroTag = 'AppBottomNavigator';

  final Color? background;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;

  const AppBottomNavigator({this.background, this.selectedItemColor, this.unselectedItemColor, this.elevation, super.key});

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
            currentIndex: prov.selectedIndex!,
            onTap: (index){
              prov.selectedIndex = index;
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
/*
                BottomNavigationBarItem(
                    backgroundColor: background??background_(context),
                    icon: Icon(MdiIcons.mapLegend),
                    //activeIcon: Icon(MdiIcons.map),
                    label: 'Harc mapa'
                ),
                 */
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