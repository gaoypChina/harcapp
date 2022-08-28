import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CommunityRole{
  ADMIN,
  REGULAR
}

Map<CommunityRole, String> communityRoleToStr = {
  CommunityRole.ADMIN: 'ADMIN',
  CommunityRole.REGULAR: 'REGULAR',
};

Map<String, CommunityRole> strToCommunityRole = {
  'ADMIN': CommunityRole.ADMIN,
  'REGULAR': CommunityRole.REGULAR,
};

Map<CommunityRole, IconData> communityRoleToIcon = {
  CommunityRole.ADMIN: MdiIcons.shieldAccount,
  CommunityRole.REGULAR: MdiIcons.accountCircleOutline,
};