import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';

import '../main_page_new.dart';
import 'layouts.dart';

class StartPage extends StatefulWidget {

  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => StartPageState();

}

class StartPageState extends State<StartPage> {

  StartPageState();

  late bool tapable;

  void wait() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() => tapable = true);
  }

  @override
  void initState() {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    tapable = false;
    wait();

    super.initState();
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
        body: InkWell(
          onTap: tapable?(){
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);

            ColorPackProvider.of(context).colorPack = ColorPackSongBook();

            pushPage(
              context,
              builder: (context) => const MainPage()
            );

          }:null,
          child: const DefaultLayout()
      )
    );

}