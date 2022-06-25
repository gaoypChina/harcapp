import '../common/short_read.dart';

class Wiersz extends ShortRead{

  final String author;

  const Wiersz({
    required super.title,
    required this.author,
    required super.titleColor,
    required super.fileName,
    required super.graphicalResource,
    super.soundResource,
    super.readingVoice,
  });

}