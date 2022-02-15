import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core_song_widget/providers.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '_common_classes/color_pack.dart';
import '_common_classes/sha_pref.dart';
import '_common_classes/storage.dart';
import '_common_widgets/app_toast.dart';
import '_new/api/statistics.dart';
import '_new/app_bottom_navigator.dart';
import '_new/cat_page_guide_book/_sprawnosci/providers.dart';
import '_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import '_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';
import '_new/cat_page_guide_book/szyfry/providers.dart';
import '_new/cat_page_harcthought/articles/providers.dart';
import '_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import '_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import '_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import '_new/cat_page_home/providers.dart';
import '_new/cat_page_other/strefa_ducha/providers.dart';
import '_new/cat_page_song_book/providers.dart';
import '_new/cat_page_song_book/settings_page.dart';
import '_new/details/part_settings.dart';
import '_new/main_page_new.dart';
import '_new/providers.dart';
import '_new/start/_main.dart';
import 'account/account.dart';
import 'sync/synchronizer_engine.dart';

AppMode appMode;

void main() async {

  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'pl',
      basePath: 'assets/locale/',
      supportedLocales: ['pl']);

  DateTime.now().isAfter(DateTime(2020, 4, 11, 8)) && DateTime.now().isBefore(DateTime(2020, 4, 20, 1))?
  appMode = AppMode.APP_MODE_ZMARTWYCHWSTANIE:
  appMode = AppMode.APP_MODE_DEFAULT;

  DateTime.now().isAfter(DateTime(2020, 8, 1, 17)) && DateTime.now().isBefore(DateTime(2020, 8, 8, 23))?
  appMode = AppMode.APP_MODE_POWST_WARSZ:
  appMode = AppMode.APP_MODE_DEFAULT;

  if(DateTime.now().isAfter(DateTime(2021, 11, 29, 8)) && DateTime.now().isBefore(DateTime(2021, 12, 25, 1)))
    appMode = AppMode.APP_MODE_ADWENT;
  else if(DateTime.now().isAfter(DateTime(2021, 12, 25, 1)) && DateTime.now().isBefore(DateTime(2022, 1, 4, 0)))
    appMode = AppMode.APP_MODE_CHRISTMAS;
  else if(DateTime.now().isAfter(DateTime(2022, 11, 10, 0)) && DateTime.now().isBefore(DateTime(2022, 11, 17, 0)))
    appMode = AppMode.APP_MODE_NIEPODLEGLOSC;
  else
    appMode = AppMode.APP_MODE_DEFAULT;

  runApp(LocalizedApp(delegate, const OKToast(child: App())));

}

enum AppMode{
  APP_MODE_DEFAULT,
  APP_MODE_ADWENT,
  APP_MODE_CHRISTMAS,
  APP_MODE_ZMARTWYCHWSTANIE,
  APP_MODE_POWST_WARSZ,
  APP_MODE_NIEPODLEGLOSC
}

class App extends StatefulWidget {

  static bool get devMode => shaPref.getBool(ShaPref.SHA_PREF_SETTINGS_APP_DEV_MODE, false);
  static set devMode(value) => shaPref.setBool(ShaPref.SHA_PREF_SETTINGS_APP_DEV_MODE, value);

  static bool get showPatroniteSeasonally{

    DateTime date = DateTime.now();
    return date.day > 5 && date.day < 12;
  }

  const App();

  @override
  State<StatefulWidget> createState() => AppState();

}

class AppState extends State<App> {

  StreamSubscription<ConnectivityResult> subscription;

  Future<void> initShaPref() async {
    await ShaPref.init();
    setState((){});
  }

  ColorPack _slctColorPack;

  @override
  void initState() {

    switch(appMode){
      case AppMode.APP_MODE_DEFAULT: _slctColorPack = const ColorPackStartDefault(); break;
      case AppMode.APP_MODE_ADWENT: _slctColorPack = const ColorPackStartAdwent(); break;
      case AppMode.APP_MODE_CHRISTMAS: _slctColorPack = const ColorPackStartChristmas(); break;
      case AppMode.APP_MODE_ZMARTWYCHWSTANIE: _slctColorPack = const ColorPackStartDefault(); break;
      case AppMode.APP_MODE_POWST_WARSZ: _slctColorPack = const ColorPackStartDefault(); break;
      default: _slctColorPack = const ColorPackStartDefault(); break;
    }

    initShaPref().then((value) {

      // Update rankTaskUids
      if(true)
        for(Rank rank in Rank.all){

          Map<String, bool> taskComplMap = shaPref.getMap<String, bool>(ShaPref.SHA_PREF_RANK_COMPLETED_REQ_MAP_(rank), {});
          Map<String, String> taskNoteMap = shaPref.getMap<String, String>(ShaPref.SHA_PREF_RANK_REQ_NOTES_MAP_(rank), {});

          Map<String, bool> newTaskComplMap = {};
          Map<String, String> newTaskNoteMap = {};

          for(RankCat cat in rank.cats)
            for(RankGroup group in cat.groups)
              for(RankTask task in group.tasks){

                if(taskComplMap.containsKey(task.old_uid))
                  newTaskComplMap[task.uid] = taskComplMap[task.old_uid];
                else if(taskComplMap.containsKey(task.uid))
                  newTaskComplMap[task.uid] = taskComplMap[task.uid];

                if(taskNoteMap.containsKey(task.old_uid))
                  newTaskNoteMap[task.uid] = taskNoteMap[task.old_uid];
                else if(taskNoteMap.containsKey(task.uid))
                  newTaskNoteMap[task.uid] = taskNoteMap[task.uid];

              }

          shaPref.setMap(ShaPref.SHA_PREF_RANK_COMPLETED_REQ_MAP_(rank), newTaskComplMap);
          shaPref.setMap(ShaPref.SHA_PREF_RANK_REQ_NOTES_MAP_(rank), newTaskNoteMap);

        }

      subscription = addConnectionListener((hasConnection) async {
        if (!hasConnection) return;

        if(!await synchronizer.isAllSynced())
          await synchronizer.post();

        ApiStatistics.postObservations(
          onSuccess: (){
            // TODO: Dodać jakąś formę sprawdzenia, czy staty już zostały wysłane.
          },
          onError: (){}
        );

      });
    });
    AccSecData.init();



    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(shaPref==null) return Container();

    return  MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),

        ChangeNotifierProvider(create: (context){
          AppBottomNavigatorProvider prov = AppBottomNavigatorProvider();
          prov.init(prov);
          return prov;
        }),

        ChangeNotifierProvider(create: (context) => ThemeProvider(Settings.theme, onChangedListener: () {
          showAppToast(context, text: Settings.isDark?'Słońce już...\n...zeszło z gór...': 'Nowy dzień wstaje');
        })),
        ChangeNotifierProvider(create: (context) => ColorPackProvider(
            initColorPack: _slctColorPack,
            isDark: () => Settings.isDark,
            colorPackDark: const ColorPackBlack()
        )),
        ChangeNotifierProvider(create: (context) => MainProvider()),

        ChangeNotifierProvider(create: (context) => LoginProvider()),

        ChangeNotifierProvider(create: (context) => DrawerProvider()),
        ChangeNotifierProvider(create: (context) => FloatingButtonProvider()),

        //INDIVIDUAL COMPETITION
        ChangeNotifierProvider(create: (context) => IndivCompParticipsProvider()),
        ChangeNotifierProvider(create: (context) => ComplTasksProvider()),
        ChangeNotifierProvider(create: (context) => IndivCompProvider()),
        ChangeNotifierProvider(create: (context) => IndivCompListProvider()),

        // STOPNIE
        ChangeNotifierProvider(create: (context) => RankProv()),

        // SPRAWNOŚCI
        ChangeNotifierProvider(create: (context) => SprawSavedListProv()),
        ChangeNotifierProvider(create: (context) => SprawInProgressListProv()),
        ChangeNotifierProvider(create: (context) => SprawCompletedListProv()),
        ChangeNotifierProvider(create: (context) => CurrentSprawGroupProvider()),

        // SPIEWNIK,
        ChangeNotifierProvider(create: (context) => ShowChordsProvider(SongBookBaseSetting())),
        ChangeNotifierProvider(create: (context) => ChordsDrawTypeProvider(SongBookBaseSetting())),
        ChangeNotifierProvider(create: (context) => ChordsDrawShowProvider(SongBookBaseSetting())),
        ChangeNotifierProvider(create: (context) => AlbumProvider()),

        // SZYFRY
        ChangeNotifierProvider(create: (context) => GaderypolukiProvider()),

        //ARTICLES
        ChangeNotifierProvider(create: (context) => ArticleThemeProvider()),
        ChangeNotifierProvider(create: (context) => BookmarkedArticlesProvider()),
        ChangeNotifierProvider(create: (context) => LikedArticlesProvider()),

        // STREFA DUCHA
        ChangeNotifierProvider(create: (context) => ItemsProvider()),
        ChangeNotifierProvider(create: (context) => FadeImageProvider()),
        ChangeNotifierProvider(create: (context) => LockProvider()),
        ChangeNotifierProvider(create: (context) => PinProvider()),

      ],
      builder: (context, _) => StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (BuildContext context, AsyncSnapshot<ConnectivityResult> snapShot) =>
              Consumer2<ThemeProvider, ColorPackProvider>(
                builder: (context, themeProv, colorPackProv, child){

                  if(Settings.checkFullScreen)
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
                  else
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                    statusBarColor: colorPackProv.colorPack.appBar, // status bar color
                  ));

                  return Material(
                    child: MaterialApp(
                      title: 'HarcApp',
                      theme: colorPackProv.colorPack.themeData,

                      home: const StartPage(),
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: const [
                        Locale('pl'),
                      ],
                      locale: const Locale('pl'),
                    ),
                  );

                },
              )
      ),

    );

  }

}

class ThemeProvider extends ChangeNotifier{

  Timer _themeTimer;

  void Function() _onChangedListener;

  ThemeProvider(AppTheme theme, {void Function() onChangedListener}){
    setThemeMode(theme);
    this._onChangedListener = onChangedListener;
  }

  @override
  void dispose() {
    _themeTimer?.cancel();
    super.dispose();
  }

  void _startThemeTimer(){
    int toChange = Settings.secsTillThemeChange;
    if(_themeTimer != null) _themeTimer.cancel();

    _themeTimer = Timer(Duration(seconds: toChange), (){
      notifyListeners();
      _onChangedListener?.call();
    });

  }

  void setThemeMode(AppTheme theme){
    if(theme == AppTheme.auto){
      _startThemeTimer();
    } else{
      _themeTimer?.cancel();
      _themeTimer = null;
    }
  }
}