import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_home/community/communities_loader.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_loader.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core_song_widget/providers.dart';
import 'package:oktoast/oktoast.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:lifecycle/lifecycle.dart';

import '_common_classes/color_pack.dart';
import '_common_classes/sha_pref.dart';
import '_common_classes/storage.dart';
import '_common_classes/time_settings.dart';
import '_new/app_bottom_navigator.dart';
import '_new/cat_page_guide_book/_sprawnosci/providers.dart';
import '_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import '_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';
import '_new/cat_page_guide_book/szyfry/providers.dart';
import '_new/cat_page_harcthought/apel_ewan/apel_ewan_own_folder.dart';
import '_new/cat_page_harcthought/apel_ewan/providers.dart';
import '_new/cat_page_harcthought/articles/providers.dart';
import '_new/cat_page_home/community/circle/model/announcement.dart';
import '_new/cat_page_home/community/circle/model/circle.dart';
import '_new/cat_page_home/community/community_publishable.dart';
import '_new/cat_page_home/community/forum/model/forum.dart';
import '_new/cat_page_home/community/forum/model/post.dart';
import '_new/cat_page_home/community/model/community.dart';
import '_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import '_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import '_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import '_new/cat_page_guide_book/providers.dart';
import '_new/cat_page_home/providers.dart';
import '_new/cat_page_song_book/song_loader.dart';
import '_new/cat_page_strefa_ducha/providers.dart';
import '_new/cat_page_song_book/providers.dart';
import '_new/cat_page_song_book/settings/song_book_base_settings.dart';
import '_new/details/app_settings.dart';
import '_new/providers.dart';
import '_new/start/_main.dart';
import 'account/account.dart';
import 'account/ms_oauth.dart';
import 'account/statistics.dart';
import 'sync/synchronizer_engine.dart';

AppMode? appMode;
enum AppMode{
  appModeDefault,
  appModeAdwent,
  appModeChristmas,
  appModeWielkiPiatek,
  appModeZmartwychwstanie,
  appModePowstWarsz,
  appModeNiepodleglosc
}

void main() async {

  if(!kDebugMode)
    FlutterError.onError = (FlutterErrorDetails details) async {
      saveStringAsFileToFolder(
          getErrorFolderLocalPath,
          '# Date: ${DateTime.now().toIso8601String()}'
          '\n# System time used: ${await TimeSettings.isTimeAutomatic}'
          '\n# App version: ${(await PackageInfo.fromPlatform()).version}'
          '\n\n${details.exception.toString()}'
          '\n\n${details.stack.toString()}',
          fileName: DateTime.now().toIso8601String());

      throw details.stack!;
    };

  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'pl',
      basePath: 'assets/locale/',
      supportedLocales: ['pl']);

  DateTime.now().isAfter(DateTime(2020, 4, 11, 8)) && DateTime.now().isBefore(DateTime(2020, 4, 20, 1))?
  appMode = AppMode.appModeZmartwychwstanie:
  appMode = AppMode.appModeDefault;

  DateTime.now().isAfter(DateTime(2020, 8, 1, 17)) && DateTime.now().isBefore(DateTime(2020, 8, 8, 23))?
  appMode = AppMode.appModePowstWarsz:
  appMode = AppMode.appModeDefault;

  if(DateTime.now().isAfter(DateTime(2021, 11, 29, 8)) && DateTime.now().isBefore(DateTime(2021, 12, 25, 1)))
    appMode = AppMode.appModeAdwent;
  else if(DateTime.now().isAfter(DateTime(2021, 12, 25, 1)) && DateTime.now().isBefore(DateTime(2022, 1, 4, 0)))
    appMode = AppMode.appModeChristmas;
  else if(DateTime.now().isAfter(DateTime(2022, 11, 10, 0)) && DateTime.now().isBefore(DateTime(2022, 11, 17, 0)))
    appMode = AppMode.appModeNiepodleglosc;
  else
    appMode = AppMode.appModeDefault;

  if(DateTime.now().isAfter(DateTime(2022, 4, 15, 14)) && DateTime.now().isBefore(DateTime(2022, 4, 17, 4)))
    appMode = AppMode.appModeWielkiPiatek;
  else if(DateTime.now().isAfter(DateTime(2022, 4, 17, 4)) && DateTime.now().isBefore(DateTime(2022, 4, 24, 0)))
    appMode = AppMode.appModeZmartwychwstanie;

  await ShaPref.init();
  await initPaths();
  await AccountData.init();

  ApelEwanOwnFolder.loadAllOwnFolders();

  runApp(LocalizedApp(delegate, OKToast(child: HarcAppSongBook(
      MultiProvider(
          providers: [

            ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
            ChangeNotifierProvider(create: (context) => OrgProvider()),
            ChangeNotifierProvider(create: (context){
              AppBottomNavigatorProvider prov = AppBottomNavigatorProvider();
              prov.init(prov);
              return prov;
            }),

            ChangeNotifierProvider(create: (context) => ThemeProvider(AppSettings.theme, onChangedListener: () {
              showAppToast(context, text: AppSettings.isDark?'Słońce już...\n...zeszło z gór...': 'Nowy dzień wstaje');
            })),
            ChangeNotifierProvider(create: (context){

              ColorPack _selColorPack;

              switch(appMode){
                case AppMode.appModeDefault: _selColorPack = const ColorPackStartDefault(); break;
                case AppMode.appModeAdwent: _selColorPack = const ColorPackStartAdwent(); break;
                case AppMode.appModeChristmas: _selColorPack = const ColorPackStartChristmas(); break;
                case AppMode.appModeZmartwychwstanie: _selColorPack = const ColorPackStartDefault(); break;
                case AppMode.appModePowstWarsz: _selColorPack = const ColorPackStartDefault(); break;
                default: _selColorPack = const ColorPackStartDefault(); break;
              }

              return ColorPackProvider(
                  initColorPack: _selColorPack,
                  isDark: () => AppSettings.isDark,
                  colorPackDark: const ColorPackBlack()
              );

            }),

            ChangeNotifierProvider(create: (context) => HomePartProvider()),

            ChangeNotifierProvider(create: (context) => LoginProvider()),

            ChangeNotifierProvider(create: (context) => DrawerProvider()),
            ChangeNotifierProvider(create: (context) => FloatingButtonProvider()),

            //COMMUNITIES
            ChangeNotifierProvider(create: (context) => CommunityProvider()),
            ChangeNotifierProvider(create: (context) => CommunityListProvider()),
            ChangeNotifierProvider(create: (context) => CommunityManagersProvider()),

            ChangeNotifierProvider(create: (context) => CommunityPublishableListProvider()),

            //CIRCLES
            ChangeNotifierProvider(create: (context) => CircleMembersProvider()),
            ChangeNotifierProvider(create: (context) => CircleProvider()),
            ChangeNotifierProvider(create: (context) => CircleListProvider()),
            ChangeNotifierProvider(create: (context) => AnnouncementProvider()),
            ChangeNotifierProvider(create: (context) => AnnouncementListProvider()),
            ChangeNotifierProvider(create: (context) => BindedIndivCompsProvider()),

            //FORUM
            ChangeNotifierProvider(create: (context) => ForumProvider()),
            ChangeNotifierProvider(create: (context) => ForumListProvider()),
            ChangeNotifierProvider(create: (context) => ForumManagersProvider()),
            ChangeNotifierProvider(create: (context) => PostProvider()),
            ChangeNotifierProvider(create: (context) => PostListProvider()),

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

            // ŚPIEWNIK
            ChangeNotifierProvider(create: (context) => AlbumProvider()),

            // SZYFRY
            ChangeNotifierProvider(create: (context) => GaderypolukiProvider()),

            //ARTICLES
            ChangeNotifierProvider(create: (context) => ArticleThemeProvider()),
            ChangeNotifierProvider(create: (context) => BookmarkedArticlesProvider()),
            ChangeNotifierProvider(create: (context) => LikedArticlesProvider()),

            // APEL EWANS
            ChangeNotifierProvider(create: (context) => ApelEwanFolderProvider()),
            ChangeNotifierProvider(create: (context) => ApelEwanAllFoldersProvider()),

            // STREFA DUCHA
            ChangeNotifierProvider(create: (context) => FadeImageProvider()),
            ChangeNotifierProvider(create: (context) => LockProvider()),
            ChangeNotifierProvider(create: (context) => PinProvider()),

          ],
          builder: (context, _) => const App()

      ),
      SongBookBaseSetting())
  )));

}

AppNavigatorObserver appNavigatorObserver = AppNavigatorObserver();
class AppNavigatorObserver extends NavigatorObserver{

  final List<void Function()> _onChangedListener = [];

  void addChangedListener(void Function() listener) =>
    _onChangedListener.add(listener);

  void removeChangedListener(void Function() listener) =>
    _onChangedListener.remove(listener);

  void callNavBarChanged(){

    for(void Function() onChangedListener in _onChangedListener)
      onChangedListener.call();

  }

  @protected
  @override
  void didPop(Route route, Route? previousRoute) {

    for(void Function() onChangedListener in _onChangedListener)
      onChangedListener.call();

    super.didPop(route, previousRoute);
  }

  @protected
  @override
  void didPush(Route route, Route? previousRoute) {

    for(void Function() onChangedListener in _onChangedListener)
      onChangedListener.call();

    super.didPush(route, previousRoute);
  }

  @protected
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {

    for(void Function() onChangedListener in _onChangedListener)
      onChangedListener.call();

    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @protected
  @override
  void didRemove(Route route, Route? previousRoute) {

    for(void Function() onChangedListener in _onChangedListener)
      onChangedListener.call();

    super.didRemove(route, previousRoute);
  }

}

class App extends StatefulWidget {

  static late double statusBarHeight;

  static late List<void Function(Orientation)> _orientationChangedListeners;
  static void addOrientationChangeListener(void Function(Orientation) listener){
    _orientationChangedListeners.add(listener);
  }

  static void removeOrientationChangeListener(void Function(Orientation) listener){
    _orientationChangedListeners.remove(listener);
  }

  static bool get showPatroniteSeasonally{

    DateTime date = DateTime.now();
    return date.day > 5 && date.day < 12;
  }

  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();

}



class AppState extends State<App> with WidgetsBindingObserver {
  
  late StreamSubscription<ConnectivityResult> subscription;

  void convertOldData(){

    if(true)

      // Update Rank task uids
      for(Rank rank in Rank.all){

        Map<String, bool> taskComplMap = ShaPref.getMap<String, bool>(ShaPref.SHA_PREF_RANK_COMPLETED_REQ_MAP_(rank), {});
        Map<String, String> taskNoteMap = ShaPref.getMap<String, String>(ShaPref.SHA_PREF_RANK_REQ_NOTES_MAP_(rank), {});

        Map<String, bool?> newTaskComplMap = {};
        Map<String, String?> newTaskNoteMap = {};

        for(RankCat cat in rank.cats!)
          for(RankGroup group in cat.groups!)
            for(RankTask task in group.tasks!){

              if(taskComplMap.containsKey(task.old_uid))
                newTaskComplMap[task.uid] = taskComplMap[task.old_uid];
              else if(taskComplMap.containsKey(task.uid))
                newTaskComplMap[task.uid] = taskComplMap[task.uid];

              if(taskNoteMap.containsKey(task.old_uid))
                newTaskNoteMap[task.uid] = taskNoteMap[task.old_uid];
              else if(taskNoteMap.containsKey(task.uid))
                newTaskNoteMap[task.uid] = taskNoteMap[task.uid];

            }

        ShaPref.setMap(ShaPref.SHA_PREF_RANK_COMPLETED_REQ_MAP_(rank), newTaskComplMap);
        ShaPref.setMap(ShaPref.SHA_PREF_RANK_REQ_NOTES_MAP_(rank), newTaskNoteMap);
      }

    if(ShaPref.getBool(ShaPref.SHA_PREF_RESET_STATS, true)){
      Statistics.songStats = {};
      Statistics.moduleStats = {};
      ShaPref.setBool(ShaPref.SHA_PREF_RESET_STATS, false);
      logger.d('Stats reset.');
    }

  }

  late LoginListener _loginListener;

  late GlobalKey<NavigatorState> navigatorKey;

  Orientation? orientation;

  @override
  void initState() {

    WidgetsBinding.instance.addObserver(this);
    App._orientationChangedListeners = [];
    
    _loginListener = LoginListener(
        onLogin: (emailConf) async {
          if(!emailConf) return;
          await Statistics.commit();
        },
        onRegistered: () async{
          await Statistics.commit();
          IndivComp.init([], context: mounted?context:null);
          Circle.init([], context: mounted?context:null);
        },
        onEmailConfirmChanged: (emailConf) async {
          if(!emailConf) return;
          await Statistics.commit();
          await indivCompLoader.run();
          await communitiesLoader.run();
        }
    );
    AccountData.addLoginListener(_loginListener);

    subscription = addConnectionListener((hasConnection) async {
      if (!hasConnection) return;

      if(!await synchronizer.isAllSynced())
        await synchronizer.post();

      await Statistics.commit();
    });

    songLoader.run();
    if(AccountData.loggedIn) {
      indivCompLoader.run();
      communitiesLoader.run();
    }

    navigatorKey = GlobalKey<NavigatorState>();
    post(() => ZhpAccAuth.init(navigatorKey));

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    AccountData.removeLoginListener( _loginListener);
    super.dispose();
  }

  @override void didChangeMetrics() {
    //for(void Function() listener in App._orientationChangedListeners)
    //  listener.call();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (BuildContext context, AsyncSnapshot<ConnectivityResult> snapShot) =>
          OrientationBuilder(
            builder: (context, orientation) {

              if(this.orientation == null)
                this.orientation = orientation;
              else if(this.orientation != orientation) {
                this.orientation = orientation;
                for (void Function(Orientation) listener in App._orientationChangedListeners)
                  post(() => listener.call(orientation));
              }

              return Consumer2<ThemeProvider, ColorPackProvider>(
                builder: (context, themeProv, colorPackProv, child){

                  if(AppSettings.fullscreen)
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
                  else
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                    statusBarColor: colorPackProv.colorPack.appBar, // status bar color
                  ));

                  return MaterialApp(
                    navigatorKey: navigatorKey,
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
                    navigatorObservers: [
                      appNavigatorObserver,
                      defaultLifecycleObserver
                    ],
                  );

                },
              );
            }
          )
  );

}

class ThemeProvider extends ChangeNotifier{

  Timer? _themeTimer;

  void Function()? _onChangedListener;

  ThemeProvider(AppTheme theme, {void Function()? onChangedListener}){
    setThemeMode(theme);
    _onChangedListener = onChangedListener;
  }

  @override
  void dispose() {
    _themeTimer?.cancel();
    super.dispose();
  }

  void _startThemeTimer(){
    int toChange = AppSettings.secsTillThemeChange;
    if(_themeTimer != null) _themeTimer!.cancel();

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