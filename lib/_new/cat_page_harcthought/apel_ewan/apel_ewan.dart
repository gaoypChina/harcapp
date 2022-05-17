class ApelEwan{

  final String dirName;
  final String siglum;
  final String title;

  const ApelEwan({required this.dirName, required this.siglum, required this.title});

  String get textFileName => 'assets/apel_ewan/$dirName\$text';
  String get questionsFileName => 'assets/apel_ewan/$dirName\$questions';

}