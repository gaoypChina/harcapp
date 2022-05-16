import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_particip/participant_list_page_templ.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';

class ParticipantListPage extends StatelessWidget{

  final IndivComp comp;

  const ParticipantListPage(this.comp, {super.key});

  @override
  Widget build(BuildContext context) => ParticipantListPageTempl(
    comp: comp,
    sortByPoints: false,
    itemBuilder: (context, particip) => ParticipTile(
        userKey: particip.key,
        name: particip.name,
        shadow: particip.shadow,
        active: particip.profile.active,
        role: particip.profile.role,
        anythingSelected: false,
        heroTag: particip
    ),
  );

}
