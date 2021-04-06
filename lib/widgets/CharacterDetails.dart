import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Player.dart';
import 'package:the_battle/models/Team.dart';

class CharacterDetails extends StatefulWidget {
  const CharacterDetails(
      {Key key, this.character, this.player, this.onCharacterAdded})
      : super(key: key);

  final Character character;
  final Player player;
  final Function onCharacterAdded;

  @override
  _CharacterDetailsState createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  void _onPressed() {
    widget.onCharacterAdded(widget.character);
  }

  Widget _addToTeam() {
    if (widget.player.team.validated) {
      return Container(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Équipe déjà validée !!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ));
    }
    if (widget.player.team.characters.length == Team.maxCharacterPerTeam) {
      return Container(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Équipe pleine !!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ));
    }
    return RaisedButton(
      onPressed: _onPressed,
      color: Colors.green,
      child: Text("Ajouter à l'équipe"),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.red[100],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      widget.character.name,
                      style: TextStyle(
                          fontFamily: 'Knewave',
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Image(
                      image: AssetImage(widget.character.imagePath()),
                      width: 50,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.character.strength.kind +
                              " : " +
                              widget.character.strength.value.toString(),
                          style: TextStyle(
                              fontFamily: 'Knewave',
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.character.speed.kind +
                              " : " +
                              widget.character.speed.value.toString(),
                          style: TextStyle(
                              fontFamily: 'Knewave',
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.character.cleverness.kind +
                              " : " +
                              widget.character.cleverness.value.toString(),
                          style: TextStyle(
                              fontFamily: 'Knewave',
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.character.intelligence.kind +
                              " : " +
                              widget.character.intelligence.value.toString(),
                          style: TextStyle(
                              fontFamily: 'Knewave',
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_addToTeam()],
            )
          ],
        ));
  }
}
