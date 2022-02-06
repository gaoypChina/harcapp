import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_song_book/song_loader.dart';
import 'package:harcapp/_new/details/storage_display_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_song_book/radio_button_group.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/main_page_new.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'common.dart';

class PartSettings extends StatefulWidget{

  static const bool SETTINGS_BACK = false;
  static const bool SETTINGS_OPEN_DRAWER = true;

  const PartSettings();

  @override
  State<StatefulWidget> createState() => PartSettingsState();

}

class PartSettingsState extends State<PartSettings>{

  PrimitiveWrapper<bool> backOpenDrawer;

  @override
  void initState()
  {
    backOpenDrawer = PrimitiveWrapper(Settings.checkBackOpenDrawer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: part_margin, right: part_margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: Dimen.ICON_MARG),

            TitleShortcutRowWidget(
              title: 'Motyw aplikacji',
              leading: SizedBox(width: Dimen.ICON_MARG),
              textAlign: TextAlign.start,
              trailing: SizedBox(
                width: Dimen.ICON_FOOTPRINT,
                child: Icon(MdiIcons.paletteOutline, color: hintEnab_(context)),
              ),
              iconColor: iconDisab_(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimen.DEF_MARG, right: Dimen.DEF_MARG),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: RadioButtonGroup<AppTheme>(
                      initID: Settings.theme,
                      buttonIcons: [
                        MdiIcons.weatherSunny,
                        MdiIcons.weatherNight,
                        MdiIcons.themeLightDark
                      ],
                      buttonNames: [
                        'Jasny',
                        'Ciemny',
                        'Auto',
                      ],
                      buttonIDs: [
                        AppTheme.light,
                        AppTheme.dark,
                        AppTheme.auto,
                      ],
                      onChanged: (AppTheme value){
                        Settings.theme = value;
                        Provider.of<ThemeProvider>(context, listen: false).setThemeMode(value);
                        Provider.of<ColorPackProvider>(context, listen: false).notify();
                      },
                    ),
                  ),

                  AnimatedOpacity(
                      opacity: Settings.theme == AppTheme.auto?1:0,
                      duration: Duration(milliseconds: 300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SimpleButton(
                          padding: EdgeInsets.all(Dimen.ICON_MARG),
                          onTap:
                          Settings.theme == AppTheme.auto?
                          ()async {
                            TimeOfDay time = await showTimePicker(
                              helpText: 'WSCHÓD SŁOŃCA',
                              initialTime: Settings.sunriseTime,
                              context: context,
                            );
                            if(time!=null) setState(() => Settings.sunriseTime = time);
                            Provider.of<ThemeProvider>(context, listen: false).setThemeMode(AppTheme.auto);
                            Provider.of<ColorPackProvider>(context, listen: false).notify();
                          }:null,
                          child: Row(
                            children: [
                              Icon(MdiIcons.weatherSunsetUp, color: textEnab_(context)),
                              SizedBox(width: Dimen.ICON_MARG),
                              Text(
                                Settings.sunriseTime.format(context),
                                style: AppTextStyle(color: textEnab_(context)),
                              ),
                            ],
                          ),
                        ),

                        Theme(
                          data: Theme.of(context),
                          child: SimpleButton(
                            padding: EdgeInsets.all(Dimen.ICON_MARG),
                            onTap:
                            Settings.theme == AppTheme.auto?
                            ()async {
                              TimeOfDay time = await showTimePicker(
                                helpText: 'ZACHÓD SŁOŃCA',
                                initialTime: Settings.sunsetTime,
                                context: context,
                              );
                              if(time!=null) setState(() => Settings.sunsetTime = time);
                              Provider.of<ThemeProvider>(context, listen: false).setThemeMode(AppTheme.auto);
                              Provider.of<ColorPackProvider>(context, listen: false).notify();
                            }:null,
                            child: Row(
                              children: [
                                Icon(MdiIcons.weatherSunsetDown, color: textEnab_(context)),
                                SizedBox(width: Dimen.ICON_MARG),
                                Text(
                                  Settings.sunsetTime.format(context),
                                  style: AppTextStyle(color: textEnab_(context)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            if(Settings.theme == AppTheme.auto && App.devMode)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: Dimen.SIDE_MARG),
                  child: _ThemeTimeCounter(),
                ),
              ),

            SizedBox(height: SEPARATOR_SMALL),

            if(Platform.isAndroid)
              Row(
                children: [

                  Padding(
                    padding: EdgeInsets.all(Dimen.ICON_MARG),
                    child: Icon(MdiIcons.fullscreen),
                  ),
                  Expanded(child: Text('Tryb pełnoekranowy', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
                  Switch(
                    value: Settings.checkFullScreen,
                    onChanged: (value) {
                      Settings.checkFullScreen = value;
                      setState(() {});
                      Provider.of<ColorPackProvider>(context, listen: false).notify();
                      Provider.of<MainProvider>(context, listen: false).recalculate();
                    },
                  ),
                ],
              ),

            if(Platform.isAndroid)
              SizedBox(height: SEPARATOR_SMALL),

            Row(
              children: [

                Padding(
                  padding: EdgeInsets.all(Dimen.ICON_MARG),
                  child: Icon(MdiIcons.toolboxOutline),
                ),
                Expanded(child: Text('Tryb super-użytkownika', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
                Switch(
                    value: App.devMode,
                    onChanged: (selected){
                      App.devMode = selected;
                      setState((){});
                    }
                ),
              ],
            ),

            SizedBox(height: SEPARATOR_SMALL),

            if(App.devMode)
              Row(
                children: [

                  Padding(
                    padding: EdgeInsets.all(Dimen.ICON_MARG),
                    child: Icon(MdiIcons.memory),
                  ),
                  Expanded(child: Text('Podgląd pamięci', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
                  IconButton(
                    icon: Icon(MdiIcons.arrowRight),
                    onPressed: () => pushPage(
                        context,
                        builder: (context) => StorageDisplayPage()
                    ),
                  )
                ],
              ),


            if(App.devMode)
              SizedBox(height: SEPARATOR_SMALL),

            SimpleButton.from(
                textColor: background_(context),
                color: Colors.red,
                icon: MdiIcons.reloadAlert,
                text: 'Przywróć ustawienia fabryczne',
                onTap: ()async {
                  PrimitiveWrapperListenable<
                      bool> yesPressed = PrimitiveWrapperListenable(false);

                  await showAlertDialog(
                      context,
                      title: 'Ostrożnie...',
                      content: 'Przywrócenie ustawień fabrycznych oznacza, że trwale usunięte zostaną:'
                          '\n'
                          '\n\t• Ulubione grafiki ze Strefy Ducha,'
                          '\n'
                          '\n\t• Piosenki własne,'
                          '\n\t• Oceny piosenek,'
                          '\n\t• Wspomnienia piosenek,'
                          '\n\t• $Albumy_,'
                          '\n\t• Wspomnienia związane z piosenkami,'
                          '\n'
                          '\n\t• Własne okrzyki,'
                          '\n\t• Zaliczone wymagania na stopnie.'
                          '\n'
                          '\nTej operacji nie można cofnąć.'
                          '\nCzy na pewno chcesz kontynuować?',
                      actionBuilder: (context) =>
                      [
                        _ButtonFactoryResetYes(yesPressed),
                        _ButtonFactoryResetNo(yesPressed),
                      ]
                  );
                }
            ),

          ],
        ),
      ),
    );
  }
}

enum AppTheme{
  light,
  dark,
  auto
}
class Settings{
  static bool get checkBackOpenDrawer => shaPref.getBool(ShaPref.SHA_PREF_SETTINGS_APP_BACK_OPEN_DRAWER, false);
  static set checkBackOpenDrawer(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SETTINGS_APP_BACK_OPEN_DRAWER, value);

  static bool get checkFullScreen => shaPref.getBool(ShaPref.SHA_PREF_SETTINGS_APP_FULLSCREEN, false);
  static set checkFullScreen(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SETTINGS_APP_FULLSCREEN, value);

  static TimeOfDay DEF_SUNRISE_TIME = TimeOfDay(hour: 5, minute: 0);
  static TimeOfDay DEF_SUNSET_TIME = TimeOfDay(hour: 20, minute: 00);

  static int _toSecsDT(DateTime time) => time.hour*60*60 + time.minute*60 + time.second;
  static int _toSecsToD(TimeOfDay time) => time.hour*60*60 + time.minute*60;

  static int get secsTillSunrise{
    int now = _toSecsDT(DateTime.now());
    int sunrise = _toSecsToD(sunriseTime);
    if(now < sunrise) return sunrise - now;
    else return 24*60*60 - (now - sunrise);
  }

  static int get secsTillSunset{
    int now = _toSecsDT(DateTime.now());
    int sunset = _toSecsToD(sunsetTime);
    if(now < sunset) return sunset - now;
    else return 24*60*60 - (now - sunset);
  }

  static int get secsTillThemeChange{
    return min(secsTillSunrise, secsTillSunset);
  }

  static TimeOfDay get sunriseTime{
    int hour = shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_H, DEF_SUNRISE_TIME.hour);
    int minute = shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_M, DEF_SUNRISE_TIME.minute);
    return TimeOfDay(hour: hour, minute: minute);
  }
  static set sunriseTime(TimeOfDay value){
    shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_H, value.hour);
    shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_M, value.minute);
  }

  static TimeOfDay get sunsetTime{
    int hour = shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_H, DEF_SUNSET_TIME.hour);
    int minute = shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_M, DEF_SUNSET_TIME.minute);
    return TimeOfDay(hour: hour, minute: minute);
  }
  static set sunsetTime(TimeOfDay value){
    shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_H, value.hour);
    shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_M, value.minute);
  }

  static bool get isAutoDark{
    DateTime now = DateTime.now();
    if(_toSecsDT(now) > _toSecsToD(sunriseTime) && _toSecsDT(now) < _toSecsToD(sunsetTime))
      return false;
    else
      return true;
  }

  static bool get isDark{
    if(theme == AppTheme.light) return false;
    else if (theme == AppTheme.dark) return true;
    else return isAutoDark;
  }

  static const String _themeCodeLight = 'themeLight';
  static const String _themeCodeDark = 'themeDark';
  static const String _themeCodeAuto = 'themeAuto';


  static AppTheme get theme{
    String themeCode = shaPref.getString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeAuto);
    switch(themeCode){
      case _themeCodeLight: return AppTheme.light;
      case _themeCodeDark: return AppTheme.dark;
      case _themeCodeAuto: return AppTheme.auto;
      default: return AppTheme.auto;
    }
  }

  static set theme(AppTheme value){
    switch(value){
      case AppTheme.light: shaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeLight); break;
      case AppTheme.dark: shaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeDark); break;
      case AppTheme.auto: shaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeAuto); break;
      default: shaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeAuto);
    }
  }

}

class _ButtonFactoryResetYes extends StatefulWidget{

  final PrimitiveWrapperListenable<bool> yesPressed;
  const _ButtonFactoryResetYes(this.yesPressed);

  @override
  State<StatefulWidget> createState() => _ButtonFactoryResetYesState();

}

class _ButtonFactoryResetYesState extends State<_ButtonFactoryResetYes>{

  SingleComputerListener songLoaderListener;

  @override
  void initState() {

    songLoaderListener = SingleComputerListener<String>(
        onEnd: (String err, bool forceFinished)async{

          songLoader.removeListener(songLoaderListener);
          await factoryResetLocal(context);
          await AccSecData.forgetAccount();
          Provider.of<LoginProvider>(context, listen: false).notify();
          synchronizer.post();
          Navigator.pop(context);
          Navigator.pop(context);

        }
    );

    super.initState();
  }

  @override
  void dispose() {

    songLoader.removeListener(songLoaderListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      child:
      widget.yesPressed.get()?
      SpinKitThreeBounce(
          color: accent_(context),
          size: Dimen.TEXT_SIZE_BIG
      ):
      Text('Tak', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG,
          fontWeight: weight.halfBold)),
      onTap: ()async{

        setState(() => widget.yesPressed.set(true));

        songLoader.addListener(songLoaderListener);

        await songLoader.run();
      },
      padding: EdgeInsets.all(Dimen.ICON_MARG),
    );
  }

}

class _ThemeTimeCounter extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ThemeTimeCounterState();

}

class _ThemeTimeCounterState extends State<_ThemeTimeCounter>{

  void tick()async {

    while(true){
      if(!mounted)
        return;
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
    }

  }

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int secsTillChange = Settings.secsTillThemeChange;

    String formatSecs(int secs){
      int _hours = (secs / (60*60)).floor();
      int _mins = ((secs / (60)) - _hours*60).floor();
      int _secs = secs - (60*60*_hours + 60*_mins);

      return '${_hours<10?'0':''}$_hours:${_mins<10?'0':''}$_mins:${_secs<10?'0':''}$_secs';

    }

    return AppText(
      '<b>${formatSecs(secsTillChange)}</b> do zmiany motywu',
      color: hintEnab_(context),
    );
  }

}

class _ButtonFactoryResetNo extends StatefulWidget{

  final PrimitiveWrapperListenable<bool> yesPressed;
  const _ButtonFactoryResetNo(this.yesPressed);

  @override
  State<StatefulWidget> createState() => _ButtonFactoryResetNoState();

}

class _ButtonFactoryResetNoState extends State<_ButtonFactoryResetNo>{

  PrimitiveWrapperListenable<bool> get yesPressed => widget.yesPressed;

  @override
  void initState() {
    yesPressed.addListener((bool value) => setState((){}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      child: Text('Nie', style: AppTextStyle(
          fontSize: Dimen.TEXT_SIZE_BIG,
          fontWeight: weight.halfBold,
          color: yesPressed.get()?hintEnab_(context):textEnab_(context)
      )),
      onTap: () => Navigator.pop(context),
      enabled: !yesPressed.get(),
      padding: EdgeInsets.all(Dimen.ICON_MARG),
    );
  }

}