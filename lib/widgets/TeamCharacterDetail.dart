import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';
import 'package:the_battle/models/Player.dart';


class TeamCharacterDetail extends StatefulWidget {
  TeamCharacterDetail({Key key, this.character, this.player, this.onDelete})
      : super(key: key);

  final Character character;
  final Player player;
  final Function onDelete;

  @override
  _TeamCharacterDetailState createState() => _TeamCharacterDetailState();
}

class _TeamCharacterDetailState extends State<TeamCharacterDetail> {
  Color _getColor() {
    if (widget.character.autoSelected)
      return Colors.grey[600];
    else
      return Colors.green[800];
  }

  Widget _getButton() {
    if (widget.character.autoSelected || widget.player.team.validated) {
      return Icon(Icons.lock);
    } else {
      return IconButton(icon: Icon(Icons.remove_circle), onPressed: _onPressed);
    }
  }

  void _onPressed() {
    widget.onDelete(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      color: _getColor(),
      child: ListTile(
        leading: Image(
          image: AssetImage(widget.character.imagePath()),
          width: 200,
        ),
        title: Text(
          widget.character.name,
          style: TextStyle(
              fontFamily: 'Knewave', fontSize: 20, color: Colors.white),
        ),
        trailing: _getButton(),
      ),
    ));
  }
}
