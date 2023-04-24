import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum TropRole{
  OWNER,
  REGULAR,
  OBSERVER
}

Map<TropRole, String> tropRoleToStr = {
  TropRole.OWNER: 'OWNER',
  TropRole.REGULAR: 'REGULAR',
  TropRole.OBSERVER: 'OBSERVER',
};

Map<String, TropRole> strToTropRole = {
  'OWNER': TropRole.OWNER,
  'REGULAR': TropRole.REGULAR,
  'OBSERVER': TropRole.OBSERVER,
};

Map<TropRole, IconData> tropRoleToIcon = {
  TropRole.OWNER: MdiIcons.shieldAccount,
  TropRole.REGULAR: MdiIcons.accountCircleOutline,
  TropRole.OBSERVER: MdiIcons.accountEyeOutline,
};