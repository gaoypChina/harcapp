import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';

class NameProvider extends ChangeNotifier{

  late TextEditingController nameController;

  NameProvider({Community? community}){
    nameController = TextEditingController(text: community?.name??'');
  }

}

class IconKeyProvider extends ChangeNotifier{

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