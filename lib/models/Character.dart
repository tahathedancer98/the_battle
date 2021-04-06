import 'package:the_battle/models/Skill.dart';

class Character {
  final String uuid, name;
  bool selected = false;
  bool autoSelected = false;
  String image = "";
  Skill strength, speed, cleverness, intelligence;

  Character(this.uuid, this.name, this.strength, this.speed, this.cleverness,
      this.intelligence);

  String imagePath() {
    return 'assets/characters/character-' + this.uuid + '.png';
  }
}
