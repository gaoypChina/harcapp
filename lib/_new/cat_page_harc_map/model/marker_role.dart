import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum MarkerRole{
  ADMIN,
  COMMUNITY_MODERATOR
}

Map<MarkerRole, String> markerRoleToStr = {
  MarkerRole.ADMIN: 'ADMIN',
  MarkerRole.COMMUNITY_MODERATOR: 'COMMUNITY_MODERATOR',
};

Map<String, MarkerRole> strToMarkerRole = {
  'ADMIN': MarkerRole.ADMIN,
  'COMMUNITY_MODERATOR': MarkerRole.COMMUNITY_MODERATOR,
};

Map<MarkerRole, IconData> markerRoleToIcon = {
  MarkerRole.ADMIN: MdiIcons.shieldAccount,
  MarkerRole.COMMUNITY_MODERATOR: MdiIcons.accountCircleOutline,
};