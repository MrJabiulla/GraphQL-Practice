import 'package:hive/hive.dart';
import '../models/character.dart';

class LocalStorageService {
  static const String characterBoxName = 'characters';

  Future<Box<Character>> openCharacterBox() async {
    return await Hive.openBox<Character>(characterBoxName);
  }

  Future<void> saveCharacters(List<Character> characters) async {
    var box = await openCharacterBox();
    await box.clear();
    for (var character in characters) {
      await box.put(character.id, character);
    }
  }

  Future<List<Character>> getCharacters() async {
    var box = await openCharacterBox();
    return box.values.toList();
  }
}