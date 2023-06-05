import 'package:harcapp/values/people.dart';

class KonspektAttachment{

    final String name;
    final String? asset;
    final String? url;

    const KonspektAttachment({
      required this.name,
      this.asset,
      this.url
    });

}

class Konspekt{

  final String name;
  final String title;
  final String coverAuthor;
  final Person? author;
  final List<String> aims;
  final String intro;
  final String description;

  final List<KonspektAttachment> attachments;

  String get coverPath => 'assets/konspekty/$name/cover.webp';

  const Konspekt({
    required this.name,
    required this.title,
    required this.coverAuthor,
    this.author,
    required this.intro,
    required this.description,
    required this.aims,

    required this.attachments,
  });

}