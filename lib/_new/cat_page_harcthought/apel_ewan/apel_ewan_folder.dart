import 'package:harcapp/_common_widgets/folder_widget/folder.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_own_folder.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_persistant_folder.dart';

import 'apel_ewan.dart';

abstract class ApelEwanFolder extends Folder{

  static List<ApelEwanFolder> get all{
    List<ApelEwanFolder> result = [];
    result.addAll(ApelEwanPersistentFolder.all);
    result.addAll(ApelEwanOwnFolder.all);
    return result;
  }

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