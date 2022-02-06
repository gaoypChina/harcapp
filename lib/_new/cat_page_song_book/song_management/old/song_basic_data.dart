
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:path/path.dart';

class SongBasicData1{
  final String fileName;
  final String title;
  final String author;
  final String performer;
  final String moderator;
  final String youtubeLink;
  final int version;

  final List<String> tags;
  final List<String> tagsSimple;

  final String tagsAsCode;
  final String tagsAsString;

  const SongBasicData1(
      this.fileName,
      this.title,
      this.author,
      this.performer,
      this.moderator,
      this.youtubeLink,
      this.version,

      this.tags,
      this.tagsSimple,

      this.tagsAsCode,
      this.tagsAsString,
    );

  static SongBasicData1 parse(String filePath, String code, {bool official: true}){

    String fileName = basename(filePath);

    List<String> parts = code.split("<");

    List<String> lines = parts[0].split("\n");

    if(lines.length<6)
      throw new Exception("Wystąpił błąd kodowania: " + fileName);

    String title = lines[0];
    int version = int.parse(lines[1]);

    String author = lines[2];
    if (author.length == 0)
      author = '';

    String performer = lines[3];
    if (performer.length == 0)
      performer = '';

    String moderator = lines[4];

    String youtubeLink = null;
    if (lines[5].length != 0)
      youtubeLink = lines[5];

    List<String> tags = lines[6].split(';');
    tags.removeWhere((tag) => tag.length==0);

    List<String> tagsSimple = remPolCharsList(tags);

    String tagsAsCode = lines[6];
    String tagsAsString = lines[6].replaceAll(';', ' ');
    if(tagsAsString.length == 0) tagsAsString = '#';

    return SongBasicData1(
      fileName,
      title,
      author,
      performer,
      moderator,
      youtubeLink,
      official?version:0,

      tags,
      tagsSimple,

      tagsAsCode,
      tagsAsString,
    );
  }
}