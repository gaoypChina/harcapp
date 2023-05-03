import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum ForumRole{
  ADMIN,
  EDITOR,
}

int forumRoleToLoadingOrder(ForumRole forumRole){
  // Smaller is higher
  switch(forumRole){
    case ForumRole.ADMIN: return 1;
    case ForumRole.EDITOR: return 2;
  }
}

Map<ForumRole, String> forumRoleToStr = {
  ForumRole.ADMIN: 'ADMIN',
  ForumRole.EDITOR: 'EDITOR',
};

Map<String, ForumRole> strToForumRole = {
  'ADMIN': ForumRole.ADMIN,
  'EDITOR': ForumRole.EDITOR,
};

Map<ForumRole, IconData> forumRoleToIcon = {
  ForumRole.ADMIN: MdiIcons.shieldAccount,
  ForumRole.EDITOR: MdiIcons.shieldAccountOutline,
};