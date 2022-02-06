import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';

class UserData{

  final String key;
  final String name;
  final Sex sex;

  bool get isMale => sex == Sex.male;

  const UserData({
    @required this.key,
    @required this.name,
    @required this.sex,
  });

  static UserData fromMap(Map map, {String key}) => UserData(
    key: key??map['_key']??(throw InvalidResponseError('_key')),
    name: map['name']??(throw InvalidResponseError('name')),
    sex: strToSex[map['sex']]??(throw InvalidResponseError('sex')),
    //nick: nick,
  );

}

class UserDataNick extends UserData{

  final String nick;

  const UserDataNick({
    @required String key,
    @required String name,
    @required Sex sex,
    @required this.nick,
  }):super(
    key: key,
    name: name,
    sex: sex,
  );

  static UserDataNick fromMap(Map map, String nick, {String key}){
    UserData userData = UserData.fromMap(map, key: key);
    return UserDataNick(
        key: userData.key,
        name: userData.name,
        sex: userData.sex,
        nick: nick
    );
  }

}