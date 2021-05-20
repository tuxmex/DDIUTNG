import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My application"),
        ),
      )));
}
