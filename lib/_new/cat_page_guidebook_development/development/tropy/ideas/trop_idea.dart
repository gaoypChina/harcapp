import '../model/trop.dart';

class TropIdea{

  final String name;
  final TropCategory category;
  final String intro;

  final String plan;
  final String todo;
  final String summary;

  const TropIdea({
    required this.name,
    required this.category,
    required this.intro,

    required this.plan,
    required this.todo,
    required this.summary,
  });

}