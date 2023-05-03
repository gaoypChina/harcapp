import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CircleRole{
  ADMIN,
  EDITOR,
  OBSERVER
}

int circleRoleToLoadingOrder(CircleRole role){
  // Smaller is higher
  switch(role){
    case CircleRole.ADMIN: return 1;
    case CircleRole.EDITOR: return 2;
    case CircleRole.OBSERVER: return 3;
  }
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