import 'package:flutter/material.dart';
import 'package:the_battle/models/Character.dart';

class CharacterPreview extends StatefulWidget {
  const CharacterPreview(
      {Key key, this.character, this.onSelected, this.visited})
      : super(key: key);

  final Character character;
  final Function onSelected;
  final bool visited;

  @override
  _CharacterPreviewState createState() => _CharacterPreviewState();
}

class _CharacterPreviewState extends State<CharacterPreview> {
  bool _selected = false;

  Color _getColor() {
    if (widget.character.autoSelected) {
      return Colors.grey[600];
    } else if (widget.character.selected) {
      return Colors.green[800];
    } else {
      return (widget.visited) ? Colors.green[300] : Colors.red[400];
    }
  }

  // bool _getEnabled(){
  //   return !(widget.character.autoSelected ||
  //     widget.character.selected);
  // }

  void _onTap() {
    widget.onSelected(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getColor(),
      child: ListTile(
        onTap: () {
          _onTap();
        },
        leading: Image(
          image: AssetImage(widget.character.imagePath()),
          width: 200,
        ),
        title: Text(
          widget.character.name,
          style: TextStyle(
              fontFamily: 'Knewave', fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
