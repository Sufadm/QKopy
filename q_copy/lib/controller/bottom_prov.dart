import 'package:flutter/material.dart';
import 'package:q_copy/view/nav_bar.dart/message_screen.dart';
import 'package:q_copy/view/nav_bar.dart/profile.dart';
import 'package:q_copy/view/screens/dashboard_screen.dart';

class BottomNavState extends ChangeNotifier {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  int get selectedIndex => _selectedIndex;
  List<Widget> get widgetOptions => _widgetOptions;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
