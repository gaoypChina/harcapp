
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../common_youtube.dart';

class YoutubeCard extends StatefulWidget{

  final Song song;
  final Function(int autoplay, bool random)? onSkipped;
  final Function(int autoplay, bool random)? onEnded;

  const YoutubeCard(this.song, {required this.onSkipped, this.onEnded, super.key});

  @override
  State<StatefulWidget> createState() => YoutubeCardState();
}

class YoutubeCardState extends State<YoutubeCard>{

  Song get song => widget.song;

  late YoutubePlayerController _controller;

  bool get random => ShaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_YT_RANDOM, false);
  set random(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_YT_RANDOM, value);

  int get autoplay => ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_YT_AUTOPLAY, 0);
  set autoplay(int value) => ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_YT_AUTOPLAY, value);

  @override
  void initState() {

    String link = song.youtubeLink??'';
    if(!link.startsWith('http'))
      link = 'https://$link';

    String id = YoutubePlayer.convertUrlToId(link)??'';
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(id)??'',
      flags: const YoutubePlayerFlags(enableCaption: false),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCard(
          radius: AppCard.bigRadius,
          elevation: AppCard.bigElevation,
          padding: EdgeInsets.zero,
          margin: AppCard.normMargin,
          child: Column(
            children: [

              YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onEnded: (_) => widget.onEnded==null?null:widget.onEnded!(autoplay, random)
              ),

              Row(
                children: [
                  IconButton(
                    icon: Icon(
                        autoplay==PLAY_ONE?MdiIcons.repeatOff:(
                            autoplay==PLAY_REPEAT?MdiIcons.repeatOnce
                                :MdiIcons.repeat),
                        color: iconEnab_(context)
                    ),
                    onPressed: (){

                      switch(autoplay){
                        case PLAY_ONE: autoplay = PLAY_CONTINUE; break;
                        case PLAY_CONTINUE: autoplay = PLAY_REPEAT; break;
                        case PLAY_REPEAT: autoplay = PLAY_ONE; break;
                      }
                      setState((){});
                    },
                  ),
                  IconButton(
                    icon: Icon(
                        random?MdiIcons.shuffle:MdiIcons.shuffleDisabled,
                        color: autoplay==PLAY_CONTINUE?iconEnab_(context):iconDisab_(context)
                    ),
                    onPressed: () => setState(() => random = !random),
                  ),

                  Expanded(child: Container()),

                  IconButton(
                    icon: Icon(
                        MdiIcons.skipNext,
                        color: autoplay==PLAY_ONE?iconDisab_(context):iconEnab_(context)
                    ),
                    onPressed: autoplay==PLAY_ONE?null:() => widget.onSkipped?.call(autoplay, random),
                  )
                ],
              ),
            ],
          )
        )
      ],
    );
  }
}