import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

import '../main_page_new.dart';
import 'layouts.dart';

class StartPage extends StatefulWidget {

  const StartPage();

  @override
  State<StatefulWidget> createState() => StartPageState();

}

class StartPageState extends State<StartPage> {

  StartPageState();

  void initTrans()async{
    Map<String, dynamic> mapEn = await jsonDecode(await readStringFromAssets('assets/locale/en.json'));
    Map<String, dynamic> mapPl = await jsonDecode(await readStringFromAssets('assets/locale/pl.json'));

    print(mapEn);
  }

  bool tapable;

  void wait() async {
    await Future.delayed(Duration(seconds: 2));
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
  Widget build(BuildContext context) {

    return AppScaffold(
        body: InkWell(
          onTap: tapable?(){
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);

            Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackSongBook();

            Navigator.push(context, PageTransition(
                type: PageTransitionType.rippleMiddle,
                duration: Duration(milliseconds: 500),
                child: MainPage()
            ));

          }:null,
          child: DefaultLayout()
      )

    );
  }
}