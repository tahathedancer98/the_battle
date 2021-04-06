import 'package:flutter/material.dart';

class TeamCustomPage extends StatefulWidget {
  TeamCustomPage({Key key}) : super(key: key);

  static const String routeName = "/team-custom";

  @override
  _TeamCustomPageState createState() => _TeamCustomPageState();
}

class _TeamCustomPageState extends State<TeamCustomPage> {
  _TeamCustomPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom',
          style: TextStyle(fontFamily: 'Knewave', fontSize: 50),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Text('Customiser votre équipe'),
      ),
    );
  }
}
