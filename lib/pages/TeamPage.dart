import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Player.dart';
import 'package:the_battle/models/Team.dart';
import 'package:the_battle/pages/AllCharactersPage.dart';
import 'package:the_battle/widgets/MyNavigatorBar.dart';
import 'package:the_battle/widgets/TeamCharacterDetail.dart';

class TeamPage extends StatefulWidget {
  TeamPage({Key key, this.player, this.onValidateTeam}) : super(key: key);

  static const String routeName = "/team";
  final Player player;
  final Function onValidateTeam;

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  _TeamPageState();
  static const int routeIndex = 1;

  void _onIndexChange(int index) {
    Navigator.pushNamed(
      context,
      AllCharactersPage.routeName,
    );
  }

  // Ne fonctionne que si après l'ajout du personnage à l'équipe on a changé de page puis que l'on est revenu sur TeamPage
  // Pourquoi ???
  void _onDeletedCharacter(Character character) {
    setState(() {
      this.widget.player.team.remove(character);
      character.selected = false;
    });
    _showSnackbar(character.name + " supprimé", Colors.white, Colors.red);
  }

  void _showSnackbar(String message, Color textColor, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  Widget _validateButton() {
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
      return RaisedButton(
        color: Colors.green,
        child: Text(
          'Valider',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        onPressed: widget.onValidateTeam,
      );
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    // Récupère le character passant en argument de la route
    // Si il existe alors on l'ajoute à l'équipe avec la méthode add
    try {
      final Character character = ModalRoute.of(context).settings.arguments;

      if (character != null) {
        setState(() {
          if (this.widget.player.team.add(character)) {
            character.selected = true;
          }
        });
      }
    } catch (e) {
      print(e);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Team',
            style: TextStyle(fontFamily: 'Knewave', fontSize: 50),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: _validateButton(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.player.team.characters.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Character character =
                        widget.player.team.characters[index];

                    return TeamCharacterDetail(
                      character: character,
                      player: widget.player,
                      onDelete: _onDeletedCharacter,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: MyNavigatorBar(
          selectedIndex: routeIndex,
          onIndexChange: _onIndexChange,
        ));
  }
}
