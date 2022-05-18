class ApelEwan{

  final String dirName;
  final String siglum;
  final String title;
  final bool comment;

  const ApelEwan({required this.dirName, required this.siglum, required this.title, this.comment = false});

  String get textFileName => 'assets/apel_ewan/$dirName\$text';
  String get questionsFileName => 'assets/apel_ewan/$dirName\$questions';
  String get commentFileName => 'assets/apel_ewan/$dirName\$comment';

}