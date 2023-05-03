import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CommunityRole{
  ADMIN,
  REGULAR
}

int communityRoleToLoadingOrder(CommunityRole communityRole){
  // Smaller is higher
  switch(communityRole){
    case CommunityRole.ADMIN: return 1;
    case CommunityRole.REGULAR: return 2;
  }
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