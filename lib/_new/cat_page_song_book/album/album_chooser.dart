import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'album_widget_small.dart';
import 'new_album/new_album_button.dart';

class AlbumChooser extends StatefulWidget{

  final Song? song;
  final Function(Album album)? onSelectionChanged;
  final Function(Album album)? onNewAlbumCreated;

  const AlbumChooser(this.song, {this.onSelectionChanged, this.onNewAlbumCreated, super.key});

  @override
  State<StatefulWidget> createState() => AlbumChooserState();

}

class AlbumChooserState extends State<AlbumChooser>{

  Song? get song => widget.song;
  Function(Album album)? get onSelectionChanged => widget.onSelectionChanged;
  Function(Album album)? get onNewAlbumCreated => widget.onNewAlbumCreated;

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<Album.allOwn.length; i++){

      Album album = Album.allOwn[i];
      children.add(
          AlbumWidgetSmall(
            album,
            //selected: false,
            trailing: Checkbox(
                value: album.songs.contains(song),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                activeColor: textEnab_(context),
                checkColor: background_(context),
                onChanged: (value){
                  setState(() {
                    if(value!) album.addSong(song);
                    else album.removeSong(song);
                  });
                  // TODO: use here syncParams: [Album.paramOffSongs, Album.paramOwnSongs].
                  album.save();
                  if(onSelectionChanged!=null)
                    onSelectionChanged?.call(album);
                }
            ),
          )
      );
      if(i < Album.allOwn.length - 1)
        children.add(const SizedBox(height: Dimen.ICON_MARG));

    }


    return Column(
      children: [

        Column(children: children),

        if(Album.allOwn.isEmpty)
          _NoAlbumsWidget(),

        Padding(
          padding: const EdgeInsets.only(top: 2*Dimen.ICON_MARG),
          child: NewAlbumButton(onNewCreated: onNewAlbumCreated),
        )

      ],
    );
  }

}


class _NoAlbumsWidget extends StatelessWidget{



  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: Dimen.ICON_MARG),
          Icon(MdiIcons.bookmarkOffOutline, color: hintEnab_(context)),
          const SizedBox(width: Dimen.ICON_MARG),
          Text(
            'Brak $albumow_',
            style: AppTextStyle(
              color: hintEnab_(context),
              fontWeight: weight.halfBold,
              fontSize: Dimen.TEXT_SIZE_BIG
            )
          ),
          const SizedBox(width: Dimen.ICON_FOOTPRINT),

        ],
      )
  );

}