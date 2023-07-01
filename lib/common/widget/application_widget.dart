import 'package:flutter/material.dart';

Widget buildPage(int indexWidget) {
  List<Widget> _widgetApp = [
    Center(child: Text("Homepage")),
    Center(child: Text("SearchPage")),
    Center(child: Text("CoursePage")),
    Center(child: Text("ChatPage")),
    Center(child: Text("ProfilePage")),
  ];

  return _widgetApp[indexWidget];
}
