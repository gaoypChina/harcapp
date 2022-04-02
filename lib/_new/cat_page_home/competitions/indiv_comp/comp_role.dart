import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CompRole{
  ADMIN,
  MODERATOR,
  OBSERVER
}

Map<CompRole, String> compRoleToStr = {
  CompRole.ADMIN: 'ADMIN',
  CompRole.MODERATOR: 'MODERATOR',
  CompRole.OBSERVER: 'OBSERVER',
};

Map<String, CompRole> strToCompRole = {
  'ADMIN': CompRole.ADMIN,
  'MODERATOR': CompRole.MODERATOR,
  'OBSERVER': CompRole.OBSERVER,
};

Map<CompRole, IconData> compRoleToIcon = {
  CompRole.ADMIN: MdiIcons.shieldAccount,
  CompRole.MODERATOR: MdiIcons.shieldAccountOutline,
  CompRole.OBSERVER: MdiIcons.accountCircleOutline,
};