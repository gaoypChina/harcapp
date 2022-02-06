import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_page/participant_list_page_templ.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';

class ParticipantListPage extends StatelessWidget{

  final IndivComp comp;

  const ParticipantListPage(this.comp);

  @override
  Widget build(BuildContext context) {

    return ParticipantListPageTempl(
      comp: comp,
      itemBuilder: (context, particip) => ParticipWidget(
          userKey: particip.key,
          name: particip.name,
          active: particip.profile.active,
          role: particip.profile.role,
          anythingSelected: false,
          heroTag: particip
      ),
    );

  }

}
