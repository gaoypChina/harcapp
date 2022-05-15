import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_widget_parts/youtube_card.dart';


const int PLAY_ONE = 0;
const int PLAY_REPEAT = 1;
const int PLAY_CONTINUE = 2;

_jumpPlayRandSong(
  BuildContext context,
  //DisplayedSongsProvider prov,
  PageController? controller,
  double top
)async{
  List<Song?> albSongs = List.of(Album.current.songs);
  albSongs.shuffle();

  Song? song;
  late int page;
  for(Song? _s in albSongs)
    if(_s!.youtubeLink!=null) {
      song = _s;
      page = Album.current.songs.indexOf(song);
      break;
    }

  controller!.jumpToPage(page);

  await Future.delayed(const Duration(milliseconds: 300));

  if(song!=null)
    playYoutubeSong(context, controller, song, top);
}

Future<void> _jumpPlayNextSong(
  BuildContext context,
  PageController controller,
  double top,
)async{
  Song? song;
  if(controller.page!.round() < Album.current.songs.length){

    int page = controller.page!.round() + 1;
    song = Album.current.songs[page];

    while(song!.youtubeLink==null && page<Album.current.songs.length-1){
      page++;
      song = Album.current.songs[page];
    }

    await controller.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuad
    );

    //SongWidgetState _songWidget = prov.map[page];

    playYoutubeSong(context, controller, song, top);
  }

}

Future<void> playYoutubeSong(
  BuildContext context,
  //DisplayedSongsProvider prov,
  PageController? controller,
  Song song,
  double top
) async => openDialog(
    context: context,
    builder: (_) {
      bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
      return Stack(
        children: <Widget>[
          Positioned(
            top: isPortrait?top:0,
            left: 0,
            right: 0,
            bottom: isPortrait?null:0,
            child: YoutubeCard(
                song,
                onEnded: (autoplay, random) {
                  Navigator.pop(context);

                  if(autoplay == PLAY_CONTINUE) {
                    if(random) _jumpPlayRandSong(context, controller, top); // post, żeby wcześniej załadował się fragmentState, z którego playNext korzysta.
                    else _jumpPlayNextSong(context, controller!, top);
                  }else if(autoplay == PLAY_REPEAT)
                    playYoutubeSong(context, controller, song, top);

                },
              onSkipped: (autoplay, random) {
                Navigator.pop(context);

                if(autoplay == PLAY_CONTINUE) {
                  if(random) _jumpPlayRandSong(context, controller, top); // post, żeby wcześniej załadował się fragmentState, z którego playNext korzysta.
                  else _jumpPlayNextSong(context, controller!, top);
                }else if(autoplay == PLAY_REPEAT)
                  playYoutubeSong(context, controller, song, top);
              },
            ),
          ),
        ],
      );
    }
);


