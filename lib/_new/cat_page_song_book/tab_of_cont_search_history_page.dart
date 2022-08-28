import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/songs_statistics_registrator.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_background_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'song_management/album.dart';

class SearchHistoryPage extends StatefulWidget{

  final void Function(Song, int, SongOpenType)? onSongSelected;

  const SearchHistoryPage({super.key, this.onSongSelected});

  @override
  State<StatefulWidget> createState() => SearchHistoryPageState();

}

class SearchHistoryPageState extends State<SearchHistoryPage>{

  Function(Song, int, SongOpenType)? get onSongSelected => widget.onSongSelected;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: Stack(
      children: [

        if(Album.current.searchHistory.isNotEmpty)
          const Positioned.fill(
            child: TabOfContBackgroundIcon(),
          ),

        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              backgroundColor: background_(context),
              title: const Text('Historia wyszukiwania'),
              centerTitle: true,
              elevation: 0,
              floating: true,
              actions: [

                if(Album.current.searchHistory.isNotEmpty)
                  AppButton(
                    icon: const Icon(MdiIcons.trashCanOutline),
                    onTap: () => showAppToast(context, text: 'Przytrzymaj, by wyczyścić historię wyszukiwania'),
                    onLongPress: (){
                      Album.current.searchHistory = [];
                      showAppToast(context, text: 'Historia wyczyszczona');
                      setState((){});
                    },
                  )

              ],
            ),

            if(Album.current.searchHistory.isEmpty)
              const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: EmptyMessageWidget(
                    icon: MdiIcons.magnify,
                    text: 'W historii wyszukiwania\nalbumu pusto!',
                  ))
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index){
                  Song? song = Song.allMap[Album.current.searchHistory[index]];

                  if(song == null)
                    return ListTile(
                      title: Text('Piosenka nie może zostać załadowana.', style: AppTextStyle()),
                    );

                  return Padding(
                      padding: const EdgeInsets.only(bottom: Dimen.defMarg),
                      child: SongTile(
                        song,
                        onTap: onSongSelected==null?null:(song) => onSongSelected!(
                            song,
                            Album.current.songs.indexOf(song),
                            SongOpenType.history
                        ),
                        trailing: IconButton(
                          icon: const Icon(MdiIcons.close),
                          onPressed: (){
                            Album.current.removeFromSeachHistory(index);
                            setState((){});
                          },
                        ),
                      )
                  );
                },
                    childCount: Album.current.searchHistory.length
                ),
              ),

          ],
        ),

      ],
    )
  );

}