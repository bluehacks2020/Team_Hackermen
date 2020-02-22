import 'package:flutter/material.dart';
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
          //"/MenuScreen": (BuildContext context) => new MenuScreen()  
          }
          );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override 
    void initState(){
      super.initState();
      //Timer(Duration(seconds: 3),()=>Navigator.of(context).pushNamed(name));

    }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children:<Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 200.0,
                        height: 100.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "kuwento",style: TextStyle(
                                  color: Colors.white,
                                  fontSize:24.0,
                                  fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                    Text("Kuwento Loading",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0, 
                      fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}