import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/data.dart';

class ApelEwan{

  final String dirName;
  final String siglum;
  final Map<String, String> subgroupShortTitle;
  final Map<String, String> subgroupTitle;

  const ApelEwan({required this.dirName, required this.siglum, this.subgroupShortTitle = const {}, this.subgroupTitle = const {}});

  String get textFileName => 'assets/apel_ewan/$dirName\$text';
  Future<String?> get text async => await readStringFromAssets(textFileName);
  Future<String?> question(String subgroupSuff) async => await readStringFromAssets(questionsFileName(subgroupSuff));
  Future<String?> comment(String subgroupSuff) async => await readStringFromAssets(commentFileName(subgroupSuff));

  String questionsFileName(String subgroupSuffix){
    if(subgroupSuffix == ogolneApelEwansSuffix)
      return 'assets/apel_ewan/$dirName\$questions';
    else
      return 'assets/apel_ewan/$dirName\$questions_$subgroupSuffix';
  }
  String commentFileName(String subgroup){
    if(subgroup == ogolneApelEwansSuffix)
      return 'assets/apel_ewan/$dirName\$comment';
    else
      return 'assets/apel_ewan/$dirName\$comment_$subgroup';
  }

}