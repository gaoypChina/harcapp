import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp/values/rank_instr.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../comp_role.dart';
import '../models/indiv_comp_particip.dart';

class ParticipHeaderWidget extends StatelessWidget{

  final String name;
  final Org? org;
  final String? hufiec;
  final String? druzyna;
  final RankHarc? rankHarc;
  final RankInstr? rankInstr;

  final bool verified;
  final bool shadow;
  final CompRole role;
  final dynamic heroTag;

  const ParticipHeaderWidget(
      this.name,
      this.org,
      this.hufiec,
      this.druzyna,
      this.rankHarc,
      this.rankInstr,

      this.verified,
      this.shadow,
      this.role,
      { this.heroTag,
        super.key
      });

  static ParticipHeaderWidget fromParticip(
    IndivCompParticip particip,
    { dynamic heroTag,
    }) => ParticipHeaderWidget(
      particip.name,
      particip.org,
      particip.hufiec,
      particip.druzyna,
      particip.rankHarc,
      particip.rankInstr,
      particip.verified,
      particip.shadow,
      particip.profile.role,
    );

  @override
  Widget build(BuildContext context) => AccountHeaderWidget(
    name,
    org,
    hufiec,
    druzyna,
    rankHarc,
    rankInstr,
    verified: verified,
    shadow: shadow,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(compRoleToIcon(role), color: iconDisab_(context))
      ],
    ),
  );

}