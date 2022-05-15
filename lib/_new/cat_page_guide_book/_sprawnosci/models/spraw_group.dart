import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';

class SprawGroupData{

  final String? id;
  final String? title;
  final String? description;

  final List<SprawFamilyData>? familyData;

  SprawGroupData({this.id, this.title, this.description, this.familyData});

  SprawGroup build(SprawBook sprawBook){

    SprawGroup group = SprawGroup(this, sprawBook, null);

    List<SprawFamily> families = [];
    for(int i=0; i<familyData!.length; i++)
      families.add(familyData![i].build(group));

    group.families = families;

    return group;
  }

}

class SprawGroup{

  SprawGroupData data;

  String? get id => data.id;
  String? get title => data.title;
  String? get description => data.description;

  SprawBook sprawBook;
  List<SprawFamily>? families;

  List<Spraw> get allSpraws{
    List<Spraw> result = [];
    for(SprawFamily family in families!)
      result.addAll(family.spraws!);
    return result;
  }

  SprawGroup(this.data, this.sprawBook, this.families);


}