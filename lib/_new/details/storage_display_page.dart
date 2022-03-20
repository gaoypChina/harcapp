import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:path/path.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class StorageDisplayPage extends StatelessWidget{

  const StorageDisplayPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          title: Text('Podgląd pamięci'),
          centerTitle: true,
        ),

        SliverList(delegate: SliverChildListDelegate([

          const Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_MARG),
            child: TitleShortcutRowWidget(title: 'Śpiewnik', textAlign: TextAlign.start),
          ),

          _Item(
            icon: MdiIcons.folderMusicOutline,
            title: 'plik: <b>${basename(getAlbumFolderLocalPath)}</b>',
            onOpen: () => openDialog(context: context, builder: (context) =>
                JSONFolderDisplayer(getAlbumFolderPath)),
          ),

          _Item(
            icon: MdiIcons.fileMusicOutline,
            title: 'plik: <b>${basename(getOwnLastFileNameFileLocalPath)}</b>',
            onOpen: () => openDialog(context: context, builder: (context) =>
                JSONFileDisplayer(getOwnLastFileNameFilePath)),
          ),

          _Item(
              icon: MdiIcons.fileMusicOutline,
              title: 'plik: <b>${basename(getOwnSongFileLocalPath)}</b>',
              onOpen: () => openDialog(context: context, builder: (context) =>
                  JSONFileDisplayer(getOwnSongFilePath))
          ),


          const Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_MARG, top: Dimen.ICON_MARG),
            child: TitleShortcutRowWidget(title: 'Artykuły', textAlign: TextAlign.start),
          ),

          _Item(
              icon: MdiIcons.folderOutline,
              title: 'plik: <b>${basename(getArticleCoresFolderPath)}</b>',
              onOpen: () =>  openDialog(context: context, builder: (context) =>
                  JSONFolderDisplayer(getArticleCoresFolderPath))
          ),
          _Item(
              icon: MdiIcons.imageMultipleOutline,
              title: 'plik: <b>${basename(getArticleCoverFolder)}</b>',
              onOpen: () =>  openDialog(context: context, builder: (context) =>
                  ImageFolderDisplayer(getArticleCoverFolder))
          ),

          const Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_MARG, top: Dimen.ICON_MARG),
            child: TitleShortcutRowWidget(title: 'Pamięć SP', textAlign: TextAlign.start),
          ),

          _Item(
              icon: MdiIcons.imageMultipleOutline,
              title: 'Synchronizacja',
              onOpen: () async {
                await synchronizer.reloadSyncables();
                Map allUnsynced = await synchronizer.allUnsynced();
                await openDialog(
                    context: context,
                    builder: (context) => TextDisplayer('Synchronizacja', 'lastSyncTimeLocal: ${SynchronizerEngine.lastSyncTimeLocal}\n\n' + prettyJson(allUnsynced))
                );
              }
          ),

        ]))
      ],
    ),
  );

}

class _Item extends StatelessWidget{

  final IconData icon;
  final String title;
  final void Function() onOpen;

  const _Item({
    @required this.icon,
    @required this.title,
    this.onOpen
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
        elevation: AppCard.bigElevation,
        radius: AppCard.BIG_RADIUS,
        margin: AppCard.normMargin,
        onTap: onOpen,
        child: ListTile(
          leading: Icon(icon),
          title: AppText(title),
        )
    );
  }

}

class JSONFileDisplayer extends StatelessWidget{

  final String filePath;

  const JSONFileDisplayer(this.filePath, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    String jsonText;
    try {
      jsonText = readFileAsString(filePath);
    } on FileNotFoundError{
      jsonText = '{}';
    }

    String content;
    try{
      content = prettyJson(jsonDecode(jsonText), indent: 4);
    } on Exception{
      content = jsonText;
    }

    return AppCard(
      padding: EdgeInsets.zero,
      margin: AppCard.normMargin,
      radius: AppCard.BIG_RADIUS,
      color: background_(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: background_(context),
            iconTheme: IconThemeData(color: iconEnab_(context)),
            title: Text(basename(filePath), style: AppTextStyle(color: textEnab_(context))),
            centerTitle: true,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              physics: const BouncingScrollPhysics(),
              child: SelectableText('\n'+ content),
            ),
          )
        ],
      ),
    );

  }

}

class JSONFolderDisplayer extends StatelessWidget{

  final String folderPath;

  const JSONFolderDisplayer(this.folderPath, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> filePaths = [];
    Directory dir = Directory(folderPath);
    if(!dir.existsSync())
      dir.createSync(recursive: true);
    List<FileSystemEntity> fileEnts =  dir.listSync();
    for(FileSystemEntity entity in fileEnts)
      filePaths.add(entity.path);

    return AppCard(
      color: background_(context),
      radius: AppCard.BIG_RADIUS,
      padding: EdgeInsets.zero,
      margin: AppCard.normMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: background_(context),
            iconTheme: IconThemeData(color: iconEnab_(context)),
            title: Text(basename(folderPath), style: AppTextStyle(color: textEnab_(context))),
            centerTitle: true,
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                physics: const BouncingScrollPhysics(),
                itemCount: filePaths.length,
                itemBuilder: (context, index){

                  String jsonText;
                  try {
                    jsonText = readFileAsString(filePaths[index]);
                  } on FileNotFoundError{
                    jsonText = '{}';
                  }

                  return ExpansionTile(
                      title: Text(
                          'Album ID: ' + basename(filePaths[index]),
                          style: AppTextStyle(
                              color: textEnab_(context),
                              fontWeight: weight.halfBold
                          )
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SelectableText(
                            '\n'+ prettyJson(jsonDecode(jsonText), indent: 4)
                        ),
                      ]
                  );

                }
            ),
          )
        ],
      ),
    );

  }

}

class ImageFolderDisplayer extends StatelessWidget{

  final String folderPath;

  const ImageFolderDisplayer(this.folderPath, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> filePaths = [];
    Directory dir = Directory(folderPath);
    if(!dir.existsSync())
      dir.createSync(recursive: true);
    List<FileSystemEntity> fileEnts =  dir.listSync();
    for(FileSystemEntity entity in fileEnts)
      filePaths.add(entity.path);

    return AppCard(
      color: background_(context),
      radius: AppCard.BIG_RADIUS,
      padding: EdgeInsets.zero,
      margin: AppCard.normMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: background_(context),
            iconTheme: IconThemeData(color: iconEnab_(context)),
            title: Text(basename(folderPath), style: AppTextStyle(color: textEnab_(context))),
            centerTitle: true,
          ),
          Expanded(
            child:
            GridView.builder(
              itemCount: filePaths.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'IMG@$index',
                      child: AppCard(
                        radius: AppCard.DEF_RADIUS,
                        color: Colors.transparent,
                        padding: EdgeInsets.zero,
                        margin: AppCard.normMargin,
                        onTap: () => openDialog(
                            context: context,
                            builder: (context) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: 'IMG@$index',
                                  child: AppCard(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.zero,
                                    child: Image(
                                      image: FileImage(File(filePaths[index])),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Hero(
                                    tag: 'FILE_NAME@$index',
                                    child: AppCard(
                                      margin: AppCard.normMargin,
                                      child: Text(basename(filePaths[index])),
                                    )
                                )
                              ],
                            )
                        ),
                        child: Image(
                          image: FileImage(File(filePaths[index])),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),

                  Hero(
                    tag: 'FILE_NAME@$index',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(basename(filePaths[index])),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

}

class TextDisplayer extends StatelessWidget{

  final String title;
  final String text;

  const TextDisplayer(this.title, this.text, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppCard(
      padding: EdgeInsets.zero,
      margin: AppCard.normMargin,
      radius: AppCard.BIG_RADIUS,
      color: background_(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
              elevation: 0,
              backgroundColor: background_(context),
              iconTheme: IconThemeData(color: iconEnab_(context)),
              title: Text(title, style: AppTextStyle(color: textEnab_(context))),
              centerTitle: true,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              physics: const BouncingScrollPhysics(),
              child: SelectableText('\n'+ text),
            ),
          )
        ],
      ),
    );

  }

}