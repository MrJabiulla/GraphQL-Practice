import 'package:flutter/material.dart';
import 'app.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(EpisodeInfoAdapter());
  Hive.registerAdapter(LocationInfoAdapter());
  runApp(MyApp());
}