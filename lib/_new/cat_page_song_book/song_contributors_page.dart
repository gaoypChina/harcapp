import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_song_book/add_pers_email_resolver.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_song/song_core.dart';

import 'song_management/off_song.dart';

class SongContributorsPage extends StatelessWidget{

  const SongContributorsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    Map<AddPerson, int> map = {};
    for(OffSong song in OffSong.allOfficial){
      if(song.addPers == null)
        continue;

      for(AddPerson addPers in song.addPers)
        if(map.containsKey(addPers))
          map[addPers] += 1;
        else
          map[addPers] = 1;
    }

    var sortedKeys = map.keys.toList(growable:false)..sort((k1, k2) => map[k2].compareTo(map[k1]));
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
                (context, index) => Row(
                  crossAxisAlignment:
                  sortedMap.keys.toList()[index].emailRef==null?
                  CrossAxisAlignment.center:
                  CrossAxisAlignment.center,

                  children: [

                    IndivCompRankIcon(
                      IndivCompProfile(
                          active: null,
                          role: null,
                          points: null,
                          showRank: index + 1
                      ),
                      activeParticipCnt: null,
                      colors: CommonColorData.ALL[CommonColorData.OMEGA_COLORS_KEY],
                      size: 42.0,
                    ),

                    const SizedBox(width: Dimen.SIDE_MARG),

                    Expanded(child: AddPersEmailResolver(
                        textSize: Dimen.TEXT_SIZE_BIG,
                        textColor: textEnab_(context)
                    ).build(context, sortedMap.keys.toList()[index])),

                    const SizedBox(width: Dimen.SIDE_MARG),

                    Text(sortedMap.values.toList()[index].toString(), style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold))

                  ],
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