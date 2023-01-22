import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/sound_player_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

class SongAudioPlayerWidget extends StatefulWidget{

  final Song song;
  final EdgeInsets padding;

  const SongAudioPlayerWidget(this.song, {this.padding = EdgeInsets.zero, super.key});

  @override
  State<StatefulWidget> createState() => SongAudioPlayerWidgetState();

}

class SongAudioPlayerWidgetState extends State<SongAudioPlayerWidget>{

  Song get song => widget.song;
  EdgeInsets get padding => widget.padding;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: SoundPlayerWidget.height + padding.vertical,
    child: PageView.builder(
        itemCount: song.audios.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: padding,
          child: Material(
              clipBehavior: Clip.hardEdge,
              color: cardEnab_(context),
              elevation: AppCard.bigElevation,
              borderRadius: BorderRadius.circular(AppCard.bigRadius),
              child: SoundPlayerWidget(
                source: song.audios[index].url,
                name: song.audios[index].performer,
                isWeb: true,
              )
          ),
        )
    ),
  );

}