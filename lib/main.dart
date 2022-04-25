import 'package:flutter/material.dart';

import 'Screens/Loading_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    MyappState();

    return MyappState();
  }
}

class MyappState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Loading_Page(),
    );
  }
}
