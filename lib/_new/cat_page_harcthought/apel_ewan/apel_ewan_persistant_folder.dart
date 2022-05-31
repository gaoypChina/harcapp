import 'apel_ewan_folder.dart';

class ApelEwanPersistentFolder extends ApelEwanFolder{

  @override
  int get count => apelEwans.length;

  @override
  final String name;

  @override
  final String iconKey;

  @override
  final String colorsKey;

  const ApelEwanPersistentFolder({
    required super.id,
    required super.apelEwans,
    required super.apelEwanNotes,
    required this.name,
    required this.iconKey,
    required this.colorsKey,
  });

  @override
  bool get isEmpty => apelEwans.isEmpty;
  
  @override
  bool operator == (Object other) =>
      other is ApelEwanPersistentFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;

}