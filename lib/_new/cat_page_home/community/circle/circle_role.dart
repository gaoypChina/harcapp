import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CircleRole{
  ADMIN,
  EDITOR,
  OBSERVER
}

Map<CircleRole, String> circleRoleToStr = {
  CircleRole.ADMIN: 'ADMIN',
  CircleRole.EDITOR: 'EDITOR',
  CircleRole.OBSERVER: 'OBSERVER',
};

Map<String, CircleRole> strToCircleRole = {
  'ADMIN': CircleRole.ADMIN,
  'EDITOR': CircleRole.EDITOR,
  'OBSERVER': CircleRole.OBSERVER,
};

Map<CircleRole, IconData> circleRoleToIcon = {
  CircleRole.ADMIN: MdiIcons.shieldAccount,
  CircleRole.EDITOR: MdiIcons.shieldAccountOutline,
  CircleRole.OBSERVER: MdiIcons.accountCircleOutline,
};