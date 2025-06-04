import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Character extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String gender;
  @HiveField(3)
  final String species;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.gender,
    required this.species,
    required this.status,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json['id'],
    name: json['name'],
    gender: json['gender'],
    species: json['species'],
    status: json['status'],
    image: json['image'],
  );
}