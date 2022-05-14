import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_song_book/song_loader.dart';
import 'package:harcapp/_new/details/storage_display_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_song_book/radio_button_group.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/main_page_new.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'app_settings.dart';
import 'common.dart';

class PartSettings extends StatefulWidget{

  const PartSettings({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => PartSettingsState();

}

class PartSettingsState extends State<PartSettings>{

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        ListTile(
          title: Text('Motyw aplikacji', style: AppTextStyle(fontWeight: weight.halfBold)),
        ),

        ListTile(
          title: Text(
              'Jasny', 
              style: AppTextStyle(
                fontWeight: AppSettings.theme == AppTheme.light?weight.halfBold:weight.normal,
                color: AppSettings.theme == AppTheme.light?textEnab_(context):hintEnab_(context)
              )
          ),
          onTap: (){
            AppSettings.theme = AppTheme.light;
            Provider.of<ThemeProvider>(context, listen: false).setThemeMode(AppTheme.light);
            Provider.of<ColorPackProvider>(context, listen: false).notify();
          },
        ),

        ListTile(
          title: Text(
              'Ciemny',
              style: AppTextStyle(
                  fontWeight: AppSettings.theme == AppTheme.dark?weight.halfBold:weight.normal,
                  color: AppSettings.theme == AppTheme.dark?textEnab_(context):hintEnab_(context)
              )
          ),
          onTap: (){
            AppSettings.theme = AppTheme.dark;
            Provider.of<ThemeProvider>(context, listen: false).setThemeMode(AppTheme.dark);
            Provider.of<ColorPackProvider>(context, listen: false).notify();
          },
        ),

        ListTile(
          title: Text(
              'Auto',
              style: AppTextStyle(
                  fontWeight: AppSettings.theme == AppTheme.auto?weight.halfBold:weight.normal,
                  color: AppSettings.theme == AppTheme.auto?textEnab_(context):hintEnab_(context)
              )
          ),
          trailing: AnimatedOpacity(
            opacity: AppSettings.theme == AppTheme.auto?1:0,
            duration: const Duration(milliseconds: 300),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SimpleButton(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  onTap:
                  AppSettings.theme == AppTheme.auto?
                  () async {
                    TimeOfDay? time = await showTimePicker(
                      helpText: 'WSCHÓD SŁOŃCA',
                      initialTime: AppSettings.sunriseTime,
                      context: context,
                    );
                    if(time!=null) setState(() => AppSettings.sunriseTime = time);
                    Provider.of<ThemeProvider>(context, listen: false).setThemeMode(AppTheme.auto);
                    Provider.of<ColorPackProvider>(context, listen: false).notify();
                  }:null,
                  child: Row(
                    children: [
                      Icon(MdiIcons.weatherSunsetUp, color: textEnab_(context)),
                      const SizedBox(width: Dimen.ICON_MARG),
                      Text(
                        AppSettings.sunriseTime.format(context),
                        style: AppTextStyle(color: textEnab_(context)),
                      ),
                    ],
                  ),
                ),

                Theme(
                  data: Theme.of(context),
                  child: SimpleButton(
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    onTap:
                    AppSettings.theme == AppTheme.auto?
                        ()async {
                      TimeOfDay? time = await showTimePicker(
                        helpText: 'ZACHÓD SŁOŃCA',
                        initialTime: AppSettings.sunsetTime,
                        context: context,
                      );
                      if(time!=null) setState(() => AppSettings.sunsetTime = time);
                      Provider.of<ThemeProvider>(context, listen: false).setThemeMode(AppTheme.auto);
                      Provider.of<ColorPackProvider>(context, listen: false).notify();
                    }:null,
                    child: Row(
                      children: [
                        Icon(MdiIcons.weatherSunsetDown, color: textEnab_(context)),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text(
                          AppSettings.sunsetTime.format(context),
                          style: AppTextStyle(color: textEnab_(context)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: (){
            AppSettings.theme = AppTheme.auto;
            Provider.of<ThemeProvider>(context, listen: false).setThemeMode(AppTheme.auto);
            Provider.of<ColorPackProvider>(context, listen: false).notify();
          },
        ),

        Stack(
          children: [

            const ListTile(),

            if(AppSettings.theme == AppTheme.auto && AppSettings.devMode)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: Dimen.SIDE_MARG),
                  child: _ThemeTimeCounter(),
                ),
              ),

          ],
        ),

        if(Platform.isAndroid)
          SwitchListTile(
            title: Text('Tryb pełnoekranowy', style: AppTextStyle(fontWeight: weight.halfBold)),
            value: AppSettings.fullscreen,
            onChanged: (value) {
              AppSettings.fullscreen = value;
              setState(() {});
              Provider.of<ColorPackProvider>(context, listen: false).notify();
              Provider.of<MainProvider>(context, listen: false).recalculate();
            },
          ),

        SwitchListTile(
            isThreeLine: true,
            title: Text('Funkcje analityczne', style: AppTextStyle(fontWeight: weight.halfBold)),
            subtitle: Text('Pokaż dodatkowe informacje potrzebne przy rozwiązywaniu błędów.', style: AppTextStyle()),
            value: AppSettings.devMode,
            onChanged: (selected){
              AppSettings.devMode = selected;
              setState((){});
            }
        ),

        if(AppSettings.devMode)
          ListTile(
              title: Text('Podgląd pamięci', style: AppTextStyle(fontWeight: weight.halfBold)),
              trailing: const Icon(MdiIcons.arrowRight),
              onTap: () => pushPage(
                  context,
                  builder: (context) => const StorageDisplayPage()
              ),
          ),

        SimpleButton.from(
            textColor: background_(context),
            margin: const EdgeInsets.all(Dimen.LIST_TILE_LEADING_MARGIN_VAL),
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
  );
}

class _ButtonFactoryResetYes extends StatefulWidget{

  final PrimitiveWrapperListenable<bool> yesPressed;
  const _ButtonFactoryResetYes(this.yesPressed);

  @override
  State<StatefulWidget> createState() => _ButtonFactoryResetYesState();

}

class _ButtonFactoryResetYesState extends State<_ButtonFactoryResetYes>{

  SingleComputerListener? songLoaderListener;

  @override
  void initState() {

    songLoaderListener = SingleComputerListener<String>(
        onEnd: (String err, bool forceFinished)async{

          songLoader.removeListener(songLoaderListener as SingleComputerListener<String>);
          await factoryResetLocal(context);
          await AccountData.forgetAccount();
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

    songLoader.removeListener(songLoaderListener as SingleComputerListener<String>);

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

        songLoader.addListener(songLoaderListener as SingleComputerListener<String>);

        await songLoader.run();
      },
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
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
      await Future.delayed(const Duration(seconds: 1));
    }

  }

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int secsTillChange = AppSettings.secsTillThemeChange;

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
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
    );
  }

}