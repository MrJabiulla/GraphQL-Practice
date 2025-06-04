import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class EpisodeInfo extends HiveObject {
  @HiveField(0)
  final int count;

  EpisodeInfo({required this.count});

  factory EpisodeInfo.fromJson(Map<String, dynamic> json) {
    return EpisodeInfo(count: json['count']);
  }
}