import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core_own_song/providers.dart';
import 'package:harcapp_core_own_song/song_raw.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../sync/syncable.dart';
import '_main.dart';

class SaveSongButton extends StatefulWidget{

  final EditType editType;

  final List<OwnAlbum>? albums;
  final Function(Song song, EditType editType)? onSaved;

  const SaveSongButton(this.editType, {this.albums, this.onSaved, super.key});

  @override
  State<StatefulWidget> createState() => SaveSongButtonState();

}

class SaveSongButtonState extends State<SaveSongButton>{

  List<OwnAlbum>? get albums => widget.albums;
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

        CurrentItemProvider currentItemProv = CurrentItemProvider.of(context);

        if(currentItemProv.titleController.text.isEmpty)
          showAppToast(context, text: 'Podaj tytuł piosenki.');
        else{

          showAppToast(context, text: 'Zapisywanie...');

          setState(() => isSaving = true);

          await Future.delayed(const Duration(milliseconds: 300));

          SongRaw songRaw = currentItemProv.song;

          String code = jsonEncode(songRaw.toMap(withLclId: false));

          if(code.length > OwnSong.codeMaxLength){
            if(mounted) setState(() => isSaving = false);
            if(mounted) showAppToast(context, text: 'Piosenka za długa.');
            return;
          }

          OwnSong? song;
          try{
            song = await OwnSong.create(code: code, lclId: songRaw.lclId);
            if(song == null){
              if(mounted) showAppToast(context, text: 'Błąd kodowania piosenki!');
              return;
            }
          }catch(e){
            if(mounted) setState(() => isSaving = false);
            if(mounted) showAppToast(context, text: 'Błąd kodowania nazwy piosenki!');
            return;
          }

          if(widget.editType == EditType.editOwn){
            OwnSong remSong = OwnSong.allOwnMap[song.lclId]!;
            OwnSong.removeFromAll(remSong);
          }

          OwnSong.addToAll(song);
          for (OwnAlbum album in albums!)
            album.addSong(song);

          song.setAllSyncState(SyncableParamSingleMixin.stateNotSynced);
          synchronizer.post();

          if(mounted) Navigator.pop(context);

          onSaved?.call(song, widget.editType);

        }
      },
    );
  }
}