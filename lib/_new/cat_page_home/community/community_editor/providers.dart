import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
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

class ContactProvider extends ChangeNotifier{

  static ContactProvider of(BuildContext context) => Provider.of<ContactProvider>(context, listen: false);

  late CommonContactData _contact;
  CommonContactData get contact => _contact;

  List<String> get email => _contact.email;
  set email(List<String> value){
    _contact.email = value;
    notifyListeners();
  }

  List<String> get phone => _contact.phone;
  set phone(List<String> value){
    _contact.phone = value;
    notifyListeners();
  }

  List<String> get website => _contact.website;
  set website(List<String> value){
    _contact.website = value;
    notifyListeners();
  }

  String? get other => _contact.other;
  set other(String? value){
    _contact.other = value;
    notifyListeners();
  }

  ContactProvider({Community? community}){
    _contact = community?.contact?.copy()??CommonContactData.empty();
  }

}