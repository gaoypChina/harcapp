import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';

class UserData{

  final String key;
  final String name;
  final bool shadow;
  final Sex sex;

  bool get isMale => sex == Sex.male;

  const UserData({
    @required this.key,
    @required this.name,
    @required this.shadow,
    @required this.sex,
  });

  static UserData fromMap(Map map, {String key}) => UserData(
    key: key??map['_key']??(throw InvalidResponseError('_key')),
    name: map['name']??(throw InvalidResponseError('name')),
    shadow: map['shadow']??(throw InvalidResponseError('shadow')),
    sex: strToSex[map['sex']]??(throw InvalidResponseError('sex')),
    //nick: nick,
  );

}

class UserDataNick extends UserData{

  final String nick;

  const UserDataNick({
    @required String key,
    @required String name,
    @required bool shadow,
    @required Sex sex,
    @required this.nick,
  }):super(
    key: key,
    name: name,
    shadow: shadow,
    sex: sex,
  );

  static UserDataNick fromMap(Map map, String nick, {String key}){
    UserData userData = UserData.fromMap(map, key: key);
    return UserDataNick(
        key: userData.key,
        name: userData.name,
        shadow: userData.shadow,
        sex: userData.sex,
        nick: nick
    );
  }


  static const String _paramKey = '_key';
  static const String _paramName = 'name';
  static const String _paramSex = 'sex';
  static const String _paramNick = 'nick';

  Map<String, dynamic> toJsonMap() => {
    _paramKey: key,
    _paramName: name,
    _paramSex: sexToString[sex],
    _paramNick: nick
  };

}