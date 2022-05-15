import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core_own_song/providers.dart';
import 'package:harcapp_core_own_song/song_raw.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../sync/syncable_new.dart';
import 'own_song_page.dart';

class SaveSongButton extends StatefulWidget{

  final EditType editType;

  final List<Album>? albums;
  final Function(Song song, EditType editType)? onSaved;

  const SaveSongButton(this.editType, {this.albums, this.onSaved, Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => SaveSongButtonState();

}

class SaveSongButtonState extends State<SaveSongButton>{

  List<Album>? get albums => widget.albums;
  EditType get editType => widget.editType;
  Function(Song song, EditType editType)? get onSaved => widget.onSaved;

  late bool isSaving;

  @override
  void initState() {
    isSaving = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return IconButton(
      icon: const Icon(MdiIcons.check),
      onPressed: isSaving?null:()async{

        if(Provider.of<TitleCtrlProvider>(context, listen: false).controller!.text.isEmpty)
          showAppToast(context, text: 'Podaj tytuł piosenki.');
        else{

          showAppToast(context, text: 'Zapisywanie...');

          setState(() => isSaving = true);

          await Future.delayed(const Duration(milliseconds: 300));

          SongRaw songRaw = Provider.of<CurrentItemProvider>(context, listen: false).song;

          String code = jsonEncode(songRaw.toMap(withFileName: false));

          if(code.length > OwnSong.codeMaxLength){
            setState(() => isSaving = false);
            showAppToast(context, text: 'Piosenka za długa.');
            return;
          }

          OwnSong song;
          try{
            song = OwnSong.saveOwnSong(code, lclId: songRaw.fileName);
          }catch(e){
            setState(() => isSaving = false);
            showAppToast(context, text: 'Błąd kodowania nazwy piosenki!');
            return;
          }

          if(widget.editType == EditType.editOwn){
            OwnSong remSong = OwnSong.allOwnMap[song.fileName]!;
            OwnSong.removeOwn(remSong);
          }

          OwnSong.addOwn(song);
          for (Album album in albums!)
            album.addSong(song);

          song.setAllSyncState(SyncableParamSingle_.stateNotSynced);
          synchronizer.post();

          Navigator.pop(context);

          onSaved?.call(song, widget.editType);

        }
      },
    );
  }
}