
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_song_book/album/new_album/providers.dart';
import 'package:harcapp/_common_widgets/check_box.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_controller.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';


class AlbumSongSelector extends StatefulWidget{

  final List<Song> initSongs;
  final Function(List<Song> checkedSongs)? onChanged;

  const AlbumSongSelector(this.initSongs, {this.onChanged, Key? key}):super(key:key);

  @override
  State<StatefulWidget> createState() => AlbumSongSelectorState();

}

class AlbumSongSelectorState extends State<AlbumSongSelector> with AutomaticKeepAliveClientMixin<AlbumSongSelector>{

  @override
  bool get wantKeepAlive => true;

  List<Song> get initSongs => widget.initSongs;
  Function(List<Song> checkedSongs)? get onChanged => widget.onChanged;

  late List<Song> checkedAllSongs;
  late List<Song> checkedDisplSongs;

  bool? allChecked;

  late List<Song> displayedSongs;

  @override
  void initState() {
    checkedAllSongs = List.of(initSongs);
    checkedDisplSongs = List.of(initSongs);

    allChecked = false;
    super.initState();
  }

  void onItemSelectionChanged(bool value, Song song){
    if(value){
      checkedAllSongs.add(song);
      checkedDisplSongs.add(song);
    }else{
      checkedAllSongs.remove(song);
      checkedDisplSongs.remove(song);
    }

    if(checkedDisplSongs.isEmpty) allChecked = false;
    else if(checkedDisplSongs.length == displayedSongs.length) allChecked = true;
    else allChecked = null;
  }

  void onTap(Song song){

    bool wasChecked = checkedAllSongs.contains(song);

    onItemSelectionChanged(!wasChecked, song);
    onChanged?.call(checkedAllSongs);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: TabOfCont(
          controller: TabOfContController(
            Song.all
          ),
          itemLeadingBuilder: (Song song, GlobalKey globalKey) => _ItemTrailing(
            this,
            song,
          ),
          appBar: false,
          onItemTap: (Song song, int index) => onTap(song),
          onSearchComplete: (List<Song> songs, bool Function() stillValid){

            displayedSongs = songs;

            checkedDisplSongs.clear();
            for(Song song in songs)
              if(checkedAllSongs.contains(song))
                checkedDisplSongs.add(song);

            if(displayedSongs.length == checkedDisplSongs.length)
              setState(() => allChecked = true);
            else if(checkedDisplSongs.isEmpty)
              setState(() => allChecked = false);
            else
              setState(() => allChecked = null);

          },
          showAddSongSuggestion: false,
          accentColor: Provider.of<AccentColorProvider>(context, listen: false).avgColor,
      ),
      floatingActionButton: Consumer<AccentColorProvider>(
        builder: (context, prov, child) => FloatingActionButton(
          onPressed: null,
          child: GradientWidget(
            shape: BoxShape.circle,
            colorStart: prov.color1!,
            colorEnd: prov.color2!,
            height: Dimen.FLOATING_BUTTON_SIZE,
            width: Dimen.FLOATING_BUTTON_SIZE,
            child: Theme(
                data: Theme.of(context).copyWith(unselectedWidgetColor: prov.accIconColor),
                child: Checkbox(
                  tristate: true,
                  activeColor: prov.accIconColor,
                  checkColor: prov.avgColor,
                  value: allChecked,
                  onChanged: (value){
                    if(allChecked == true) allChecked = false;
                    else allChecked = true;

                    setState((){});

                    if(allChecked!)
                      for(Song song in displayedSongs) {
                        if (!checkedAllSongs.contains(song)) checkedAllSongs.add(song);
                        if (!checkedDisplSongs.contains(song)) checkedDisplSongs.add(song);
                      }
                    else
                      for(Song song in displayedSongs) {
                        checkedAllSongs.remove(song);
                        checkedDisplSongs.remove(song);
                      }
                    onChanged?.call(checkedAllSongs);
                  },
                )),
          ),
        ),
      )
    );

  }

}

class _ItemTrailing extends StatelessWidget{

  final AlbumSongSelectorState parent;
  final Song song;
  bool get selected => parent.checkedDisplSongs.contains(song);

  const _ItemTrailing(this.parent, this.song);

  @override
  Widget build(BuildContext context) {

    return Consumer<AccentColorProvider>(
        builder: (context, prov, child) => CheckBox(
          activeColor: prov.avgColor,
          unselectedWidgetColor: prov.avgColor,
          value: selected,
          onChanged: (value) => parent.onTap(song),
        )
    );
  }
}