import 'package:blue_hacks_kuwento/test_screen3.dart';
import 'package:flutter/material.dart';
import 'package:blue_hacks_kuwento/splash_screen.dart';
import 'package:blue_hacks_kuwento/menu_screen.dart';
import 'package:blue_hacks_kuwento/test_screen.dart';
import 'package:blue_hacks_kuwento/test_screen2.dart';
import 'package:blue_hacks_kuwento/test_screen3.dart';
import 'dart:async';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(BuildContext context){
    return MaterialApp(
        theme :ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          "/MenuScreen": (BuildContext context) => new MenuScreen(),
          "/TestScreen": (BuildContext context) => new TestScreen(),
          "/TestScreen2": (BuildContext context) => new TestScreen2(),
          "/TestScreen3": (BuildContext context) => new TestScreen3()
        }
    );
  }
}


