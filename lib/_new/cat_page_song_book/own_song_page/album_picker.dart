import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/album/album_widget_small.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import '_main.dart';

class AlbumPart extends StatefulWidget{

  final OwnSongPageState parent;
  List<Album>? get albums => parent.albums;

  const AlbumPart(this.parent, {super.key});

  @override
  State<StatefulWidget> createState() => AlbumPartState();

}

class AlbumPartState extends State<AlbumPart>{

  List<Album>? get albums => widget.albums;

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<Album.allOwn.length; i++){
      Album album = Album.allOwn[i];

      children.add(
          AlbumWidgetSmall(
            album,
            showSongCount: false,
            selected: false,
            trailing: Checkbox(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                value: albums!.contains(album),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                activeColor: textEnab_(context),
                checkColor: background_(context),
                onChanged: (bool? value) => setState(() => value!? albums!.add(album) : albums!.remove(album))
            ),
          )
      );

      if(i < Album.allOwn.length-1)
        children.add(const SizedBox(height: Dimen.ICON_MARG));

    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
          child: TitleShortcutRowWidget(
            title: Albumy_,
            //icon: MdiIcons.bookmarkPlusOutline,
            textAlign: TextAlign.start,
            trailing: SizedBox(
              width: 2*Dimen.ICON_FOOTPRINT,
              height: Dimen.ICON_FOOTPRINT,
              child: Center(
                child: Text(
                  '(${albums!.length})',
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                    fontWeight: weight.bold
                  ),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children
          ),
        )



      ],
    );
  }

}

class AlbumPicker extends StatefulWidget{

  final void Function()? onChanged;

  const AlbumPicker({this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() => AlbumPickerState();

}

class AlbumPickerState extends State<AlbumPicker>{

  late List<Album> ownAlbums;

  late List<Album> albums;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: ownAlbums.map<Widget>((album) => AlbumWidgetSmall(
        album,
        showSongCount: false,
        trailing: Switch(
          value: albums.contains(album),
          onChanged: (value){
            setState(() => value? albums.add(album) : albums.remove(album));
          },
        ),
      )).toList(),
    );
  }

}