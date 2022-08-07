import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum ForumRole{
  ADMIN,
  MODERATOR,
  OBSERVER
}

Map<ForumRole, String> forumRoleToStr = {
  ForumRole.ADMIN: 'ADMIN',
  ForumRole.MODERATOR: 'MODERATOR',
  ForumRole.OBSERVER: 'OBSERVER',
};

Map<String, ForumRole> strToForumRole = {
  'ADMIN': ForumRole.ADMIN,
  'MODERATOR': ForumRole.MODERATOR,
  'OBSERVER': ForumRole.OBSERVER,
};

Map<ForumRole, IconData> forumRoleToIcon = {
  ForumRole.ADMIN: MdiIcons.shieldAccount,
  ForumRole.MODERATOR: MdiIcons.shieldAccountOutline,
  ForumRole.OBSERVER: MdiIcons.accountCircleOutline,
};