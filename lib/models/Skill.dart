class Skill {
  static const String STRENGTH = "STRENGTH";
  static const String CLEVERNESS = "CLEVERNESS";
  static const String SPEED = "SPEED";
  static const String INTELLIGENCE = "INTELLIGENCE";

  static final List kinds = [STRENGTH, CLEVERNESS, SPEED, INTELLIGENCE];

  String kind;
  int value; //min 0 / max 5

  Skill(String kind, int value) {
    if (kinds.contains(kind)) {
      this.kind = kind;
    }
    else{
      throw new Exception('Cette qualité n\'existe pas ');
    }

    if (value >= 0 && value <= 5) {
      this.value = value;
    }
    else {
      throw new Exception('La valeur doit être comprise entre 0 et 5');
    }
  }
}