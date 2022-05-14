import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/storage.dart';

import '../../module_statistics_registrator.dart';
import 'add_okrzyk_page.dart';
import 'okrzyki_list_widget.dart';
import 'common.dart';
import 'data.dart';
import 'okrzyk.dart';

class OkrzykiFragment extends StatefulWidget {

  const OkrzykiFragment({Key? key}) : super(key: key);

  @override
  State createState() => OkrzykiFragmentState();

}

class OkrzykiFragmentState extends State<OkrzykiFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.okrzyki;

  int? loadingProgress;

  List<Sound> sounds = [];
  List<Okrzyk> unofficialOkrzyki = [];

  @override
  void initState() {
    loadingProgress = 0;
    load();
    super.initState();
  }

  void load()async{
    await Sound.initAll(onProgress: (progress) => setState(() => loadingProgress = progress));
    setState(() => loadingProgress = -1);

    await setUnofficialOkrzyki();
  }

  Future<void> setUnofficialOkrzyki() async {
    Directory dir = Directory(getOkrzykiFolderPath);
    if(!dir.existsSync()) return;
    List<FileSystemEntity> files = dir.listSync(recursive: false);
    List<Okrzyk> unofficialOkrzyki = [];

    for(FileSystemEntity entity in files)
      unofficialOkrzyki.add(
          Okrzyk.decode(
              readFileAsString(entity.path),
              false
          )
      );

    setState(() => this.unofficialOkrzyki = unofficialOkrzyki);
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
        body:
        loadingProgress != -1?
        Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: loadingProgress!/Sound.ITEM_COUNT,
            ),
            Expanded(
              child: Center(child: CircularProgressIndicator()),
            )
          ],
        ):
        DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text('Okrzyki'),
                centerTitle: true,
                backgroundColor: background_(context),
                actions: <Widget>[
                  if(loadingProgress == -1)
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddOkrzykPage(
                                  onSaved: () => setUnofficialOkrzyki(),
                                )
                            )
                        );
                      },
                    ),
                ],
                bottom: TabBar(
                  tabs: const [
                    Tab(text: 'Ogólne'),
                    Tab(text: 'Posiłkowe'),
                    Tab(text: 'Własne'),
                  ],
                  indicator: AppTabBarIncdicator(context: context),
                ),
              )
            ],
            body: TabBarView(
              children: [
                OkrzykiListWidget(this, OKRZYKI_OGOLNE),
                OkrzykiListWidget(this, OKRZYKI_POSILKOWE),
                OkrzykiListWidget(this, unofficialOkrzyki)
              ],
            ),
          ),
        )
    );
  }

}