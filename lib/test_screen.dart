import 'package:flutter/material.dart';
import 'package:blue_hacks_kuwento/splash_screen.dart';
import 'dart:async';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>{
	@override
  	Widget build(BuildContext context){
    	return new Scaffold(
      		body: Stack(
        	fit: StackFit.expand,
        	children:<Widget>[
          		Container(
            		decoration: BoxDecoration(color: Color.fromARGB(255,238,227,157),),
          		),
        	]
    		)
    	);
	}
}

