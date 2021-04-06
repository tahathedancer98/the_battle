import 'package:the_battle/models/Character.dart';
import 'package:the_battle/data/characters.dart' as allCharactersFile;
import 'dart:math';

class Team {
  final String uuid;
  bool validated = false;
  String name = 'My team';
  List<Character> characters;
  static const int maxCharacterPerTeam = 5;
  static List<Character> allCharacters = allCharactersFile.characters;

  Team(this.uuid) {
    characters = List();

    characters.addAll(this._randomAutoSelected());
  }

  List<Character> _randomAutoSelected() {
    Random random = new Random();

    int randomIndex1 = random.nextInt(allCharacters.length);
    int randomIndex2 = random.nextInt(allCharacters.length);

    if (randomIndex1 == randomIndex2) {
      randomIndex2 = randomIndex1 + 1;
      if (randomIndex2 > allCharacters.length) randomIndex2 *= 2;
    }

    Character character1 = allCharacters[randomIndex1];
    Character character2 = allCharacters[randomIndex2];

    character1.autoSelected = true;
    character1.selected = true;
    character2.autoSelected = true;
    character2.selected = true;

    return [character1, character2];
  }

  int indexOf(Character aCharacter) {
    return this.characters.indexOf(aCharacter);
  }

  bool add(Character aCharacter) {
    if (this.characters.length < Team.maxCharacterPerTeam &&
        this.indexOf(aCharacter) == -1) {
      this.characters.insert(0, aCharacter);
      return true;
    }
    return false;
  }

  bool remove(Character aCharacter) {
    if (this.characters.length > 0) {
      int searchedIndex = this.indexOf(aCharacter);

      if (searchedIndex > -1 && !aCharacter.autoSelected) {
        this.characters.removeAt(searchedIndex);
        return true;
      }
    }
    return false;
  }
}
