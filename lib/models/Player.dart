import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Team.dart';

class Player {
  final String uuid;
  final String firstname;
  final String name;
  final String email;
  final int sex; // 1 = male / 2 = female

  Team team;

  Player(this.uuid, this.firstname, this.name, this.email, this.sex) {
    if (sex != 1 && sex != 2) {
      throw new Exception(
          'Le sexe du personnage peut être soit homme (1) ou femme (2)');
    }
    this.team = Team('My team');
  }
}
