import 'package:flutter/material.dart';

class MyNavigatorBar extends StatelessWidget {
  const MyNavigatorBar({Key key, this.selectedIndex, this.onIndexChange})
      : super(key: key);
  final Function onIndexChange;
  final int selectedIndex;

  void _onTapped(int index) {
    if (index != this.selectedIndex) {
      this.onIndexChange(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Characters"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Team"),
      ],
      selectedItemColor: Colors.deepOrange[700],
      onTap: _onTapped,
      currentIndex: this.selectedIndex,
    );
  }
}
