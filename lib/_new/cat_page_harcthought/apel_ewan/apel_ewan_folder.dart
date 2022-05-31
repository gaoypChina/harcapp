import 'package:harcapp/_common_widgets/folder_widget/folder.dart';

import 'apel_ewan.dart';

abstract class ApelEwanFolder extends Folder{

  final String id;
  final List<ApelEwan> apelEwans;
  final Map<String, String> apelEwanNotes;

  const ApelEwanFolder({
    required this.id,
    required this.apelEwans,
    required this.apelEwanNotes
  });

  bool get isEmpty;

  @override
  bool operator == (Object other) =>
      other is ApelEwanFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;

}