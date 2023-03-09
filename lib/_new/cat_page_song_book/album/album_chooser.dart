import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/dimen.dart';

import 'album_widget_small.dart';
import 'album_editor_page/new_album_button.dart';

class AlbumChooser extends StatefulWidget{

  final Song song;
  final Function(SelectableAlbum album)? onSelectionChanged;
  final Function(OwnAlbum album)? onNewAlbumCreated;

  const AlbumChooser(this.song, {this.onSelectionChanged, this.onNewAlbumCreated, super.key});

  @override
  State<StatefulWidget> createState() => AlbumChooserState();

}

class AlbumChooserState extends State<AlbumChooser>{

  Song get song => widget.song;
  Function(SelectableAlbum album)? get onSelectionChanged => widget.onSelectionChanged;
  Function(OwnAlbum album)? get onNewAlbumCreated => widget.onNewAlbumCreated;

  @override
  Widget build(BuildContext context) {

    List<SelectableAlbum> albums = [];
    albums.add(ToLearnAlbum.loaded);
    albums.addAll(OwnAlbum.all);

    return Column(
      children: [

        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: Dimen.ICON_MARG),
          itemBuilder: (context, index) => AlbumWidgetSmall(
            albums[index],
            trailing: Checkbox(
                value: albums[index].songs.contains(song),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                activeColor: textEnab_(context),
                checkColor: background_(context),
                onChanged: (value){
                  setState(() {
                    if(value!) albums[index].addSong(song);
                    else albums[index].removeSong(song);
                  });
                  // TODO: use here syncParams: [Album.paramOffSongs, Album.paramOwnSongs].
                  albums[index].save();
                  onSelectionChanged?.call(albums[index]);
                }
            ),
          ),
          itemCount: albums.length,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 2*Dimen.ICON_MARG),
          child: NewAlbumButton(onNewCreated: onNewAlbumCreated),
        )

      ],
    );
  }

}