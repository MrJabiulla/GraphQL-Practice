import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class LocationInfo extends HiveObject {
  @HiveField(0)
  final int count;

  LocationInfo({required this.count});

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(count: json['count']);
  }
}