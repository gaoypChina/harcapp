import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';

class SprawFamilyData{

  final String id;
  final String? title;
  final List<String>? tags;
  final String? fragment;
  final String? fragmentAuthor;

  final List<String>? requirements;
  final List<String>? notesForLeaders;

  final List<SprawData> sprawData;

  const SprawFamilyData({
    required this.id,
    this.title,
    this.tags,
    this.fragment,
    this.fragmentAuthor,

    this.requirements,
    this.notesForLeaders,
    required this.sprawData
  });

  SprawFamily build(SprawGroup group){

    SprawFamily family = SprawFamily(this, group, null);

    List<Spraw> spraws = [];
    for(int i=0; i<sprawData.length; i++)
      spraws.add(sprawData[i].build(family));

    family.spraws = spraws;

    return family;
  }

}

class SprawFamily{

  SprawFamilyData data;

  String get id => data.id;
  String? get title => data.title;
  List<String>? get tags => data.tags;
  String? get fragment => data.fragment;
  String? get fragmentAuthor => data.fragmentAuthor;

  List<String>? get requirements => data.requirements;
  List<String>? get notesForLeaders => data.notesForLeaders;

  SprawGroup group;
  List<Spraw>? spraws;

  SprawFamily(this.data, this.group, this.spraws);

}