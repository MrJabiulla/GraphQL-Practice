import 'package:flutter/material.dart';
import '../../../core/models/character.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.image, width: 50, height: 50),
      title: Text(character.name),
      subtitle: Text('${character.species} | ${character.gender} | ${character.status}'),
    );
  }
}