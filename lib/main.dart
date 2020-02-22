import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(BuildContext context){
    return MaterialApp(
          theme :ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
          debugShowCheckedModeBanner: false,
          home: MenuScreen(),
          );
  }
}

/*class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
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
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.home,
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Kuwento",style: TextStyle(
                                  color: Colors.white,
                                  fontSize:24.0,
                                  fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
*/
class MenuScreen extends StatefulWidget{
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xFF2196F3),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: (){},
                ),
                Container(
                  width: 325.0,
                  child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        color: Colors.white,
                        onPressed: (){},

                      )
                    ]
                  )
                )
              ]
            )
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[
                Text('Kuwento',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
              ]
            )
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.00,
                    child: ListView(
                      children: [
                        _MenuButtons('assets/checked.png', 'Mga Kuwento', 'Pick a story from our library.'),
                        _MenuButtons('assets/downlaod.png', 'Diksyonaryo', 'Learn the definitions of words!'),
                        _MenuButtons('assets/film.png', 'Wakas', 'Exit the Application.'),
                        _MenuButtons('assets/checked.png', 'Settings', 'Pick a story from our library.'),
                        _MenuButtons('assets/checked.png', 'Gabay', 'Pick a story from our library.'),
                        _MenuButtons('assets/checked.png', 'Larawan', 'Pick a story from our library.'),
                        _MenuButtons('assets/checked.png', 'Stories', 'Pick a story from our library.'),
                      ]
                    )
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}

Widget _MenuButtons(String iconPath, String buttonName, String subtext)
{
  return Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: InkWell(
      onTap: (){

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Hero(
                  tag: iconPath,
                  child: Image(
                    image: AssetImage(iconPath),
                    fit: BoxFit.cover,
                    height:75.0,
                    width: 75.0
                  )
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(buttonName,
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.grey
                    )
                    )
                  ]
                )
              ]
            )
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.black,
            onPressed: (){}
          )
        ]
      )
    )
  );
}