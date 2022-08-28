import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_song_book/add_pers_email_resolver.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_song/song_core.dart';

import '../cat_page_home/competitions/indiv_comp/models/show_rank_data.dart';
import 'song_management/off_song.dart';

class SongContributorsPage extends StatelessWidget{

  const SongContributorsPage({super.key});

  @override
  Widget build(BuildContext context){

    Map<AddPerson, List<Song>> map = {};
    for(OffSong song in OffSong.allOfficial)
      for(AddPerson addPers in song.addPers)
        if(map.containsKey(addPers))
          map[addPers]!.add(song);
        else
          map[addPers] = [song];

    var sortedKeys = map.keys.toList(growable:false)..sort((k1, k2) => map[k2]!.length.compareTo(map[k1]!.length));
    LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys, key: (k) => k, value: (k) => map[k]);

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            title: Text('Ranking dodanych pieśni'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                (context, index) => InkWell(
                  onTap: () => openDialog(
                    context: context,
                    builder: (context) => _SongListDialog(sortedMap.values.toList()[index])
                  ),
                  child: Row(
                    crossAxisAlignment:
                    sortedMap.keys.toList()[index].emailRef==null?
                    CrossAxisAlignment.center:
                    CrossAxisAlignment.center,

                    children: [

                      IndivCompRankIcon(
                        IndivCompProfile(
                            active: true,
                            role: CompRole.OBSERVER,
                            points: null,
                            rank: ShowRankData.fromShowRank(index + 1),
                            completedTasks: []
                        ),
                        activeParticipCnt: null,
                        colors: CommonColorData.get(CommonColorData.omegaColorsKey),
                        size: 42.0,
                      ),

                      const SizedBox(width: Dimen.SIDE_MARG),

                      Expanded(child: AddPersEmailResolver(
                          textSize: Dimen.TEXT_SIZE_BIG,
                          textColor: textEnab_(context)
                      ).build(context, sortedMap.keys.toList()[index])),

                      const SizedBox(width: Dimen.SIDE_MARG),

                      Text(sortedMap.values.toList()[index].length.toString(), style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold))

                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 2*Dimen.SIDE_MARG),
                count: sortedMap.length
            )),
          )

        ],
      ),
    );

  }

}

class _SongListDialog extends StatelessWidget{

  final List<Song>? songs;

  const _SongListDialog(this.songs);

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
                  (context, index) => SongTile(songs![index]),
                  childCount: songs!.length
              ),
            )

          ],
        ),
      ),
    ),
  );

}