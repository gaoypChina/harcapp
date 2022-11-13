class CommonContactData{

  List<String> email;
  List<String> phone;
  List<String> website;
  String? other;

  CommonContactData({
    required this.email,
    required this.phone,
    required this.website,
    required this.other,
  });

  static CommonContactData fromMap(Map map) => CommonContactData(
      email: (map['email'] as List?)?.cast<String>()??[],
      phone: (map['phone'] as List?)?.cast<String>()??[],
      website: (map['website'] as List?)?.cast<String>()??[],
      other: map['other']
  );

  Map toMap() => {
    if(email.isNotEmpty) 'email': email,
    if(phone.isNotEmpty) 'phone': phone,
    if(website.isNotEmpty) 'website': website,
    if(other != null) 'other': other,
  };

  Map toUpdateMap(CommonContactData? oldContact){
    if(oldContact == null)
      return toMap();

    return {
      if(email != oldContact.email) 'email': email,
      if(phone != oldContact.phone) 'phone': phone,
      if(website != oldContact.website) 'website': website,
      if(other != oldContact.other) 'other': other,
    };
  }

  static CommonContactData empty() => CommonContactData(
      email: [],
      phone: [],
      website: [],
      other: null
  );

  CommonContactData copy() => CommonContactData(
      email: List.of(email),
      phone: List.of(phone),
      website: List.of(website),
      other: other
  );

  @override
  bool operator ==(Object other) =>
      other is CommonContactData &&
          email == other.email &&
          phone == other.phone &&
          website == other.website &&
          other == other;

  @override
  int get hashCode => email.hashCode + phone.hashCode + website.hashCode + other.hashCode;

}