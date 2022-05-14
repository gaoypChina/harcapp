
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../common_youtube.dart';

class YoutubeCard extends StatefulWidget{

  Song? song;
  Function(int autoplay, bool random) onSkipped;
  Function(int autoplay, bool random)? onEnded;

  YoutubeCard(this.song, {required this.onSkipped, this.onEnded});

  @override
  State<StatefulWidget> createState() => YoutubeCardState();
}

class YoutubeCardState extends State<YoutubeCard>{

  Song? get song => widget.song;

  late YoutubePlayerController _controller;

  bool get random => shaPref!.getBool(ShaPref.SHA_PREF_SPIEWNIK_YT_RANDOM, false);
  set random(bool value) => shaPref!.setBool(ShaPref.SHA_PREF_SPIEWNIK_YT_RANDOM, value);

  int get autoplay => shaPref!.getInt(ShaPref.SHA_PREF_SPIEWNIK_YT_AUTOPLAY, 0)!;
  set autoplay(int value) => shaPref!.setInt(ShaPref.SHA_PREF_SPIEWNIK_YT_AUTOPLAY, value);

  @override
  void initState() {

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(song!.youtubeLink)!,
      flags: YoutubePlayerFlags(enableCaption: false),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCard(
          radius: AppCard.BIG_RADIUS,
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
                    onPressed: autoplay==PLAY_ONE?null:() => widget.onSkipped==null?null:widget.onSkipped(autoplay, random),
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