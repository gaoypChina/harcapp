class ApelEwan{

  final String dirName;
  final String siglum;

  const ApelEwan({this.dirName, this.siglum});

  String get textFileName => 'assets/apel_ewan/$dirName\$text';
  String get questionsFileName => 'assets/apel_ewan/$dirName\$questions';

}