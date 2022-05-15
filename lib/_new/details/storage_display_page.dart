import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:path/path.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class StorageDisplayPage extends StatefulWidget{

  const StorageDisplayPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StorageDisplayPageState();

}

class StorageDisplayPageState extends State<StorageDisplayPage>{

  int get errorFiles{
    Directory dir = Directory(getErrorFolderPath);
    dir.createSync(recursive: true);
    return dir.listSync().length;
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          title: Text('Podgląd pamięci'),
          centerTitle: true,
          floating: true,
        ),

        SliverList(delegate: SliverChildListDelegate([

          const Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_MARG),
            child: TitleShortcutRowWidget(title: 'Śpiewnik', textAlign: TextAlign.start),
          ),

          _Item(
            icon: MdiIcons.folderMusicOutline,
            title: 'plik: <b>${basename(getAlbumFolderLocalPath)}</b>',
            onOpen: () => openDialog(context: context, builder: (context) => JSONFolderDisplayer(getAlbumFolderPath)),
          ),

          _Item(
            icon: MdiIcons.fileMusicOutline,
            title: 'plik: <b>${basename(getOwnLastFileNameFileLocalPath)}</b>',
            onOpen: () => openDialog(context: context, builder: (context) => JSONFileDisplayer(getOwnLastFileNameFilePath)),
          ),

          _Item(
              icon: MdiIcons.fileMusicOutline,
              title: 'plik: <b>${basename(getOwnSongFileLocalPath)}</b>',
              onOpen: () => openDialog(context: context, builder: (context) => JSONFileDisplayer(getOwnSongFilePath))
          ),

          const Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_MARG, top: Dimen.ICON_MARG),
            child: TitleShortcutRowWidget(title: 'Artykuły', textAlign: TextAlign.start),
          ),

          _Item(
              icon: MdiIcons.folderOutline,
              title: 'plik: <b>${basename(getArticleCoresFolderPath)}</b>',
              onOpen: () =>  openDialog(context: context, builder: (context) =>
                  JSONFolderDisplayer(getArticleCoresFolderPath, displayFileName: (fileName) => 'Artykuł: <b>$fileName</b>',))
          ),
          _Item(
              icon: MdiIcons.imageMultipleOutline,
              title: 'plik: <b>${basename(getArticleCoverFolder)}</b>',
              onOpen: () =>  openDialog(context: context, builder: (context) => ImageFolderDisplayer(getArticleCoverFolder))
          ),

          const Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_MARG, top: Dimen.ICON_MARG),
            child: TitleShortcutRowWidget(title: 'Pamięć SP', textAlign: TextAlign.start),
          ),

          _Item(
              icon: MdiIcons.memory,
              title: 'Synchronizacja',
              onOpen: () async {
                await synchronizer.reloadSyncables();
                Map allUnsynced = await synchronizer.allUnsynced();
                await openDialog(
                    context: context,
                    builder: (context) => TextDisplayer('Synchronizacja', 'lastSyncTimeLocal: ${SynchronizerEngine.lastSyncTimeLocal}\n\n${prettyJson(allUnsynced)}')
                );
              }
          ),

          _Item(
              icon: MdiIcons.memory,
              title: 'Synchronizacja (removal mark)',
              onOpen: () async {
                List<FileSystemEntity> files;
                if(Directory(getRemoveSyncReqFolderPath).existsSync())
                  files = Directory(getRemoveSyncReqFolderPath).listSync(recursive: true);
                else
                  files = [];

                String result = '';
                for(FileSystemEntity file in files)
                  result += '${file.path}\n\n';
                await openDialog(
                    context: context,
                    builder: (context) => TextDisplayer('Synchronizacja (removal mark)', result)
                );
              }
          ),

          Padding(
            padding: const EdgeInsets.only(left: Dimen.ICON_MARG, top: Dimen.ICON_MARG),
            child: TitleShortcutRowWidget(
                title: 'Zapisane błędy',
                textAlign: TextAlign.start,
                trailing: IconButton(
                  icon: const Icon(MdiIcons.shareOutline),
                  onPressed: errorFiles==0?null:() async {

                    List<String> filePaths = Directory(getErrorFolderPath).listSync().map((file) => file.path).toList();

                    final Email email = Email(
                      body: 'W załącznikach.',
                      subject: 'Błędy w HarcAppce',
                      recipients: ['harcapp@gmail.com'],
                      attachmentPaths: filePaths,
                      isHTML: false,
                    );
                    await FlutterEmailSender.send(email);
                  },
                )
            ),
          ),

          _Item(
              icon: MdiIcons.folderAlertOutline,
              title: 'plik: <b>${basename(getErrorFolderPath)}</b>',
              trailing: Text('$errorFiles', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: hintEnab_(context))),
              onOpen: () => openDialog(
                  context: context,
                  builder: (context) => FolderDisplayer(
                      getErrorFolderPath,
                      removable: true,
                      onRemoved: () => setState((){}),
                  )
              )
          ),

        ]))
      ],
    ),
  );

}

class _Item extends StatelessWidget{

  final IconData icon;
  final String title;
  final Widget? trailing;
  final void Function()? onOpen;

  const _Item({
    required this.icon,
    required this.title,
    this.trailing,
    this.onOpen
  });

  @override
  Widget build(BuildContext context) => SimpleButton(
      color: cardEnab_(context),
      radius: AppCard.BIG_RADIUS,
      margin: AppCard.normMargin,
      onTap: onOpen,
      child: ListTile(
        leading: Icon(icon),
        title: AppText(title),
        trailing: trailing,
      )
  );

}

class JSONFileDisplayer extends StatelessWidget{

  final String filePath;

  const JSONFileDisplayer(this.filePath, {Key? key}): super(key: key);

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
              child: SelectableText('\n$content'),
            ),
          )
        ],
      ),
    );

  }

}

class FolderDisplayer extends StatefulWidget{

  final String folderPath;
  final String Function(String)? displayFileName;
  final String Function(String)? displayText;
  final String emptyText;
  final bool removable;
  final void Function()? onRemoved;

  const FolderDisplayer(this.folderPath, {this.displayFileName, this.displayText, this.emptyText = '', this.removable = false, this.onRemoved, Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => FolderDisplayerState();

}

class FolderDisplayerState extends State<FolderDisplayer>{

  String get folderPath => widget.folderPath;
  String Function(String)? get displayFileName => widget.displayFileName;
  String Function(String)? get displayText => widget.displayText;
  String get emptyText => widget.emptyText;
  bool get removable => widget.removable;
  void Function()? get onRemoved => widget.onRemoved;

  late List<String> filePaths;

  @override
  void initState() {

    List<String> filePaths = [];
    Directory dir = Directory(folderPath);
    if(!dir.existsSync())
      dir.createSync(recursive: true);
    List<FileSystemEntity> fileEnts =  dir.listSync();
    for(FileSystemEntity entity in fileEnts)
      filePaths.add(entity.path);

    this.filePaths = filePaths;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => AppCard(
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

                String text;
                try {
                  text = readFileAsString(filePaths[index]);
                } on FileNotFoundError{
                  text = emptyText;
                }

                String fileName = basename(filePaths[index]);

                return ExpansionTile(
                    trailing: removable?IconButton(
                      icon: const Icon(MdiIcons.close),
                      onPressed: (){
                        File(filePaths[index]).deleteSync(recursive: true);
                        filePaths.removeAt(index);
                        setState(() {});
                        onRemoved?.call();
                        showAppToast(context, text: 'Usunięto.');
                      },
                    ):null,
                    title: AppText(
                      displayFileName?.call(fileName)??fileName,
                      color: textEnab_(context),
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SelectableText(displayText?.call(text)??text)
                    ]
                );

              }
          ),
        ),
        if(removable)
          SimpleButton.from(
              context: context,
              text: 'Usuń wszystkie',
              icon: MdiIcons.trashCanOutline,
              margin: EdgeInsets.zero,
              onLongPress: (){
                Directory(getErrorFolderPath).deleteSync(recursive: true);
                onRemoved?.call();
                Navigator.pop(context);
                showAppToast(context, text: 'Usunięto wszystkie pliki');
              },
              onTap: (){
                showAppToast(context, text: 'Przytrzymaj, by usunąć wszystkie pliki');
              }
          )
      ],
    ),
  );

}

class JSONFolderDisplayer extends StatelessWidget{

  final String folderPath;
  final String Function(String)? displayFileName;

  const JSONFolderDisplayer(this.folderPath, {this.displayFileName, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return FolderDisplayer(
      folderPath,
      displayFileName: displayFileName,
      displayText: (text) => prettyJson(jsonDecode(text), indent: 4),
      emptyText: '{}',
    );

  }

}

class ImageFolderDisplayer extends StatelessWidget{

  final String folderPath;

  const ImageFolderDisplayer(this.folderPath, {Key? key}): super(key: key);

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

  const TextDisplayer(this.title, this.text, {Key? key}): super(key: key);

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
              child: SelectableText('\n$text'),
            ),
          )
        ],
      ),
    );

  }

}