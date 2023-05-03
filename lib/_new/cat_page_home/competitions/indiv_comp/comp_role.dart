import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CompRole{
  ADMIN,
  MODERATOR,
  OBSERVER
}

int compRoleToLoadingOrder(CompRole role){
  // Smaller is higher
  switch(role){
    case CompRole.ADMIN: return 1;
    case CompRole.MODERATOR: return 2;
    case CompRole.OBSERVER: return 3;
  }
}

String compRoleToStr(CompRole role){
  switch(role){
    case CompRole.ADMIN: return 'ADMIN';
    case CompRole.MODERATOR: return 'MODERATOR';
    case CompRole.OBSERVER: return 'OBSERVER';
  }
}

Map<String, CompRole> strToCompRole = {
  'ADMIN': CompRole.ADMIN,
  'MODERATOR': CompRole.MODERATOR,
  'OBSERVER': CompRole.OBSERVER,
};

IconData compRoleToIcon(CompRole role){
  switch(role){
    case CompRole.ADMIN: return MdiIcons.shieldAccount;
    case CompRole.MODERATOR: return MdiIcons.shieldAccountOutline;
    case CompRole.OBSERVER: return MdiIcons.accountCircleOutline;
  }
}