import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CircleRole{
  ADMIN,
  MODERATOR,
  OBSERVER
}

Map<CircleRole, String> circleRoleToStr = {
  CircleRole.ADMIN: 'ADMIN',
  CircleRole.MODERATOR: 'MODERATOR',
  CircleRole.OBSERVER: 'OBSERVER',
};

Map<String, CircleRole> strToCircleRole = {
  'ADMIN': CircleRole.ADMIN,
  'MODERATOR': CircleRole.MODERATOR,
  'OBSERVER': CircleRole.OBSERVER,
};

Map<CircleRole, IconData> circleRoleToIcon = {
  CircleRole.ADMIN: MdiIcons.shieldAccount,
  CircleRole.MODERATOR: MdiIcons.shieldAccountOutline,
  CircleRole.OBSERVER: MdiIcons.accountCircleOutline,
};