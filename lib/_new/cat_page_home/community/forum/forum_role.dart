import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum ForumRole{
  ADMIN,
  EDITOR,
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