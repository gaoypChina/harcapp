import 'package:harcapp/_common_classes/sha_pref.dart';

enum AlbumName{
  album,
  wolumin,
  grajdziupla,
  skladanka,
  didzejka
}

AlbumName? get albumName => stringToAlbumName(ShaPref.getString(ShaPref.SHA_PREF_SPIEWNIK_ALBUM_NAME, albumNameToString(AlbumName.album)));
set albumName(AlbumName? name) => ShaPref.setString(ShaPref.SHA_PREF_SPIEWNIK_ALBUM_NAME, albumNameToString(name));

String albumNameToString(AlbumName? name){
  switch (name) {
    case AlbumName.album: return 'Album';
    case AlbumName.wolumin: return 'Wolumin';
    case AlbumName.grajdziupla: return 'Grajdziupla';
    case AlbumName.skladanka: return 'Składanka';
    case AlbumName.didzejka: return 'Didżejka';
    default: return '#Błąd!';
  }
}
AlbumName? stringToAlbumName(String name){
  switch (name) {
    case 'Album': return AlbumName.album;
    case 'Wolumin': return AlbumName.wolumin;
    case 'Grajdziupla': return AlbumName.grajdziupla;
    case 'Składanka': return AlbumName.skladanka;
    case 'Didżejka': return AlbumName.didzejka;
    default: return null;
  }
}

String get Nowy_ {
  switch (albumName) {
    case AlbumName.album: return 'Nowy';
    case AlbumName.wolumin: return 'Nowy';
    case AlbumName.grajdziupla: return 'Nowa';
    case AlbumName.skladanka: return 'Nowa';
    case AlbumName.didzejka: return 'Nowa';
    default: return '#Błąd!';
  }
}
String get Nowy_album_ {
  switch (albumName) {
    case AlbumName.album: return 'Nowy album';
    case AlbumName.wolumin: return 'Nowy wolumin';
    case AlbumName.grajdziupla: return 'Nowa grajdziupla';
    case AlbumName.skladanka: return 'Nowa składanka';
    case AlbumName.didzejka: return 'Nowa didżejka';
    default: return '#Błąd!';
  }
}
String get Otwarty_album_ {
  switch (albumName) {
    case AlbumName.album: return 'OTWARTY ALBUM';
    case AlbumName.wolumin: return 'OTWARTY WOLUMIN';
    case AlbumName.grajdziupla: return 'OTWARTA GRAJDZIUPLA';
    case AlbumName.skladanka: return 'OTWARTA SKŁADANKA';
    case AlbumName.didzejka: return 'OTWARTA DIDŻEJKA';
    default: return '#Błąd!';
  }
}
String get Zmien_album_ {
  switch (albumName) {
    case AlbumName.album: return 'Zmień album';
    case AlbumName.wolumin: return 'Zmień wolumin';
    case AlbumName.grajdziupla: return 'Zmień grajdziuplę';
    case AlbumName.skladanka: return 'Zmień składankę';
    case AlbumName.didzejka: return 'Zmień didżejkę';
    default: return '#Błąd!';
  }
}
String get album_ {
  switch (albumName) {
    case AlbumName.album: return 'album';
    case AlbumName.wolumin: return 'wolumin';
    case AlbumName.grajdziupla: return 'grajdziupla';
    case AlbumName.skladanka: return 'składanka';
    case AlbumName.didzejka: return 'didżejka';
    default: return '#Błąd!';
  }
}
String get Album_ => albumNameToString(albumName);
String get Albumy_ {
  switch (albumName) {
    case AlbumName.album: return 'Albumy';
    case AlbumName.wolumin: return 'Woluminy';
    case AlbumName.grajdziupla: return 'Grajdziuple';
    case AlbumName.skladanka: return 'Składanki';
    case AlbumName.didzejka: return 'Didżejki';
    default: return '#Błąd!';
  }
}
String get albumy_ {
  switch (albumName) {
    case AlbumName.album: return 'albumy';
    case AlbumName.wolumin: return 'woluminy';
    case AlbumName.grajdziupla: return 'grajdziuple';
    case AlbumName.skladanka: return 'składanki';
    case AlbumName.didzejka: return 'didżejki';
    default: return '#Błąd!';
  }
}
String get albumu_ {
  switch (albumName) {
    case AlbumName.album: return 'albumu';
    case AlbumName.wolumin: return 'woluminu';
    case AlbumName.grajdziupla: return 'grajdziupli';
    case AlbumName.skladanka: return 'składanki';
    case AlbumName.didzejka: return 'didżejki';
    default: return '#Błąd!';
  }
}
String get albumow_ {
  switch (albumName) {
    case AlbumName.album: return 'albumów';
    case AlbumName.wolumin: return 'woluminów';
    case AlbumName.grajdziupla: return 'grajdziupli';
    case AlbumName.skladanka: return 'składanek';
    case AlbumName.didzejka: return 'didżejek';
    default: return '#Błąd!';
  }
}
String get albumie_ {
  switch (albumName) {
    case AlbumName.album:
      return 'albumie';
    case AlbumName.wolumin:
      return 'woluminie';
    case AlbumName.grajdziupla:
      return 'grajdziupli';
    case AlbumName.skladanka:
      return 'składance';
    case AlbumName.didzejka:
      return 'didżejce';
    default: return '#Błąd!';
  }
}
String get tym_albumie_ {
  switch (albumName) {
    case AlbumName.album:
      return 'tym albumie';
    case AlbumName.wolumin:
      return 'tym woluminie';
    case AlbumName.grajdziupla:
      return 'tej grajdziupli';
    case AlbumName.skladanka:
      return 'tej składance';
    case AlbumName.didzejka:
      return 'tej didżejce';
    default: return '#Błąd!';
  }
}