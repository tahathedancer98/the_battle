import 'package:flutter/material.dart';
import 'package:the_battle/models/Player.dart';
import 'package:the_battle/pages/AllCharactersPage.dart';
import 'package:the_battle/pages/TeamPage.dart';
import 'package:the_battle/pages/TeamCustomPage.dart';

class TheBattleApp extends StatefulWidget {
  const TheBattleApp({Key key}) : super(key: key);

  @override
  _TheBattleAppState createState() => _TheBattleAppState();
}

class _TheBattleAppState extends State<TheBattleApp> {
  final Player _player =
      Player("uuid", "Jean", "Neymar", "Jean.neymar@gmal.com", 1);

  String _title = "The battle App";

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  void _onValidateTeam() {
    setState(() {
      this._player.team.validated = true;
    });
  }

  Widget _checkRoute(context, String route) {
    if (_player.team.validated) {
      return TeamCustomPage();
    } else {
      switch (route) {
        case '/':
          return AllCharactersPage(
            title: this._title,
            player: this._player,
          );
        case '/team':
          return TeamPage(
            player: this._player,
            onValidateTeam: _onValidateTeam,
          );
        default:
          return AllCharactersPage(
            title: this._title,
            player: this._player,
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THE BATTLE',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AllCharactersPage.routeName: (context) =>
            _checkRoute(context, AllCharactersPage.routeName),
        TeamPage.routeName: (context) =>
            _checkRoute(context, TeamPage.routeName),
        TeamCustomPage.routeName: (context) =>
            _checkRoute(context, TeamCustomPage.routeName),
      },
    );
  }
}
