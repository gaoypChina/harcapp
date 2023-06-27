import 'package:harcapp/_new/api/_api.dart';

enum Sex{
  male, female,
}

Map<Sex, bool> sexToBool = {
  Sex.male: true,
  Sex.female: false,
};

Map<bool, Sex> boolToSex = {
  true: Sex.male,
  false: Sex.female,
};

Map<Sex, String> sexToString = {
  Sex.male: 'Male',
  Sex.female: 'Female',
};

Map<String, Sex> strToSex = {
  'Male': Sex.male,
  'Female': Sex.female,
};

class UserData{

  final String key;
  final String name;
  final bool verified;
  final bool shadow;
  final Sex sex;

  bool get isMale => sex == Sex.male;

  const UserData({
    required this.key,
    required this.name,
    required this.verified,
    required this.shadow,
    required this.sex,
  });

  static UserData fromRespMap(Map respMap, {String? key}) => UserData(
    key: key??respMap['_key']??(throw InvalidResponseError('_key')),
    name: respMap['name']??(throw InvalidResponseError('name')),
    verified: respMap['verified']??false,
    shadow: respMap['shadow']??(throw InvalidResponseError('shadow')),
    sex: strToSex[respMap['sex']]??(throw InvalidResponseError('sex')),
    //nick: nick,
  );

  Map toJsonMap() => {
    '_key': key,
    'name': name,
    'verified': verified,
    'shadow': shadow,
    'sex': sexToString[sex]
  };

}

class UserDataNick extends UserData{

  final String nick;

  const UserDataNick({
    required super.key,
    required super.name,
    required super.verified,
    required super.shadow,
    required super.sex,
    required this.nick,
  });

  static UserDataNick fromRespMap(Map respMap, String nick, {String? key}){
    UserData userData = UserData.fromRespMap(respMap, key: key);
    return UserDataNick(
        key: userData.key,
        name: userData.name,
        verified: userData.verified,
        shadow: userData.shadow,
        sex: userData.sex,
        nick: nick
    );
  }


  static const String _paramKey = '_key';
  static const String _paramName = 'name';
  static const String _paramVerified = 'verified';
  static const String _paramShadow = 'shadow';
  static const String _paramSex = 'sex';
  static const String _paramNick = 'nick';

  Map<String, dynamic> toJsonMap() => {
    _paramKey: key,
    _paramName: name,
    _paramVerified: verified,
    _paramShadow: shadow,
    _paramSex: sexToString[sex],
    _paramNick: nick
  };

  @override
  int get hashCode => key.hashCode + name.hashCode + verified.hashCode + shadow.hashCode + sex.hashCode + nick.hashCode;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

}