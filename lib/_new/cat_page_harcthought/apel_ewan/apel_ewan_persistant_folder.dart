import 'apel_ewan_folder.dart';

class ApelEwanPersistentFolder extends ApelEwanFolder{

  @override
  final String name;

  @override
  final String iconKey;

  @override
  final String colorsKey;

  const ApelEwanPersistentFolder({
    required super.id,
    required super.generalApelEwans,
    required super.notedApelEwans,
    required this.name,
    required this.iconKey,
    required this.colorsKey,
  });

  @override
  bool get isEmpty => generalApelEwans.isEmpty && notedApelEwans.isEmpty;
  
  @override
  bool operator == (Object other) =>
      other is ApelEwanPersistentFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;

}