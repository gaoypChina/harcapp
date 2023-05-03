import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum TropRole{
  OWNER,
  REGULAR,
  OBSERVER
}

int tropRoleToLoadingOrder(TropRole tropRole){
  // Smaller is higher
  switch(tropRole){
    case TropRole.OWNER: return 1;
    case TropRole.REGULAR: return 2;
    case TropRole.OBSERVER: return 3;
  }
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