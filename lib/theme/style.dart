import 'package:flutter/material.dart';

class MainTheme {
  ThemeData get theme => ThemeData(
        primaryColor: Colors.blue[400],
        accentColor: Colors.yellowAccent[500],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.yellow[500],
          textTheme: ButtonTextTheme.primary,
        ),
      );
}
