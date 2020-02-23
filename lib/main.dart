import 'package:flutter/material.dart';
import 'package:blue_hacks_kuwento/splash_screen.dart';
import 'package:blue_hacks_kuwento/menu_screen.dart';
import 'package:blue_hacks_kuwento/test_screen.dart';
import 'dart:async';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(BuildContext context){
    return MaterialApp(
        theme :ThemeData(
            primaryColor: Colors.lightGreenAccent,
            accentColor: Colors.yellowAccent),
            debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          "/MenuScreen": (BuildContext context) => new MenuScreen(),
          "/TestScreen": (BuildContext context) => new TestScreen()
        }
    );
  }
}


