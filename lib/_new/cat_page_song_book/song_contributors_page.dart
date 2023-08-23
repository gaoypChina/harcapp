import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_get_resp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_song_book/add_pers_email_resolver.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_song/song_core.dart';


class SongContributorsPage extends StatefulWidget{

  static const double iconSize = 42.0;

  final void Function(Song)? onSongTap;

  const SongContributorsPage({this.onSongTap, super.key});

  @override
  State<StatefulWidget> createState() => SongContributorsPageState();

}

class SongContributorsPageState extends State<SongContributorsPage>{

  void Function(Song)? get onSongTap => widget.onSongTap;

  late Map<AddPerson, List<Song<SongGetResp>>> searchedData;
  late Map<AddPerson, int> persRank;
  late List<AddPerson> allPeople;

  @override
  void initState() {
    searchedData = Map.of(Song.addPersRanking);
    allPeople = Song.addPersRanking.keys.toList(growable: false);
    persRank = {};
    for(int i=0; i<allPeople.length; i++)
      persRank[allPeople[i]] = i + 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Ranking dodanych pieśni'),
          centerTitle: true,
          floating: true,
        ),

        FloatingContainer.child(
          child: SearchField(
            hint: 'Szukaj osoby',
            onChanged: (text){
              if(text.isEmpty){
                setState(() => searchedData = Map.of(Song.addPersRanking));
                return;
              }

              text = remPolChars(remSpecChars(text));

              searchedData.clear();

              for(AddPerson data in allPeople)
                if ((remPolChars(remSpecChars(AddPersEmailResolver.name(data)??''))).toLowerCase().contains(text))
                  searchedData[data] = Song.addPersRanking[data]!;

              setState(() {});
            },
          ),
          height: SearchField.height
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG/2),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => InkWell(
                borderRadius: BorderRadius.circular(AppCard.defRadius),
                onTap: () => openDialog(
                    context: context,
                    builder: (context) => _SongListDialog(
                        searchedData.values.toList()[index],
                        onSongTap: (song){
                          Navigator.pop(context);
                          onSongTap?.call(song);
                        }
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG/2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Align(
                        alignment: Alignment.topCenter,
                        child: IndivCompRankIcon(

                          IndivCompProfile.empty(rank: persRank[searchedData.keys.toList()[index]]),
                          activeParticipCnt: null,
                          colors: CommonColorData.get(CommonColorData.omegaAlbumColorsKey),
                          size: SongContributorsPage.iconSize,
                        ),
                      ),

                      const SizedBox(width: Dimen.SIDE_MARG),

                      Expanded(child: Container(
                          alignment: Alignment.centerLeft,
                          constraints: const BoxConstraints(minHeight: SongContributorsPage.iconSize),
                          child: AddPersEmailResolver(
                              textSize: Dimen.TEXT_SIZE_BIG,
                              textColor: textEnab_(context),
                              showSongCount: false
                          ).build(
                            context,
                            searchedData.keys.toList()[index],
                          )
                      )),

                      const SizedBox(width: Dimen.SIDE_MARG),

                      SizedBox(
                          height: SongContributorsPage.iconSize,
                          child: Center(
                            child: Text(
                                searchedData.values.toList()[index].length.toString(),
                                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold)
                            ),
                          )
                      )

                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: searchedData.length
          )),
        )

      ],
    ),
  );

}

class _SongListDialog extends StatelessWidget{

  final List<Song>? songs;
  final void Function(Song)? onSongTap;

  const _SongListDialog(this.songs, {this.onSongTap});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        color: background_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        clipBehavior: Clip.hardEdge,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            const SliverAppBar(
              title: Text('Dodane piosenki'),
              centerTitle: true,
              floating: true,
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => SongTile(
                    songs![index],
                    onTap: onSongTap
                  ),
                  childCount: songs!.length
              ),
            )

          ],
        ),
      ),
    ),
  );

}