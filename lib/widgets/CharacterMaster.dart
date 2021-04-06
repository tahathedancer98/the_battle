import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/widgets/CharacterPreview.dart';

class CharacterMaster extends StatefulWidget {
  const CharacterMaster({Key key, this.characters, this.onSelected})
      : super(key: key);

  final List<Character> characters;
  final Function onSelected;

  @override
  _CharacterMasterState createState() => _CharacterMasterState();
}

class _CharacterMasterState extends State<CharacterMaster> {
  Character _selectedCharacter;

  bool _isVisited(Character character) {
    return _selectedCharacter == character;
  }

  void _onCharacterSelect(Character character) {
    setState(() {
      _selectedCharacter = character;
    });
    widget.onSelected(character);
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.characters.length,
        itemBuilder: (BuildContext context, int index) {
          final Character character = widget.characters[index];

          return CharacterPreview(
            character: character,
            onSelected: _onCharacterSelect,
            visited: _isVisited(character),
          );
        },
      ),
    );
  }
}
