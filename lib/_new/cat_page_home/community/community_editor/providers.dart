import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:provider/provider.dart';

import '../model/community_category.dart';

class NameProvider extends ChangeNotifier{

  static NameProvider of(BuildContext context) => Provider.of<NameProvider>(context, listen: false);

  late TextEditingController nameController;

  NameProvider({Community? community}){
    nameController = TextEditingController(text: community?.name??'');
  }

}

class IconKeyProvider extends ChangeNotifier{

  static IconKeyProvider of(BuildContext context) => Provider.of<IconKeyProvider>(context, listen: false);

  late String _iconKey;
  String get iconKey => _iconKey;
  set iconKey(String value){
    _iconKey = value;
    notifyListeners();
  }

  IconKeyProvider({Community? community}){
    _iconKey = community?.iconKey??CommonIconData.randomKey;
  }

}

class CategoryProvider extends ChangeNotifier{

  static CategoryProvider of(BuildContext context) => Provider.of<CategoryProvider>(context, listen: false);

  late CommunityCategory _category;
  CommunityCategory get category => _category;
  set category(CommunityCategory value){
    _category = value;
    notifyListeners();
  }

  CategoryProvider({Community? community}){
    _category = community?.category??CommunityCategory.druzyna;
  }

}