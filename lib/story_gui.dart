import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class story_gui extends StatefulWidget {
  @override
  _storyGUIState createState() => _storyGUIState();
}

class _storyGUIState extends State<story_gui> {
  VideoPlayerController _controller;
  String screenText = "";
  String screenSubText = "";
  Timer timer;
  int pos = 0;
  List<String> screenTextList = ["Text1", "Text2", "Text3"];
  List<String> screenSubTextList = [
    "I was 9 years old. I love Shrek so much, I bought all his merchandise.",
    "Never gonna give you up, never gonna let you down. Never gonna run around and desert you.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer viverra orci eu justo ornare volutpat. Suspendisse varius condimentum tortor ut egestas. Nulla laoreet eleifend diam nec condimentum. Pellentesque placerat dolor sed gravida fermentum."
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video1.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    Timer.periodic(Duration(seconds: 15), (Timer t) {
      setState(() {
        screenText = screenTextList[pos];
        screenSubText = screenSubTextList[pos];
        pos++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  child: Text(
                    screenText,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  child: Text(
                    screenSubText,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text("PLAY/PAUSE"),
                    onPressed: () {},
                    color: Colors.amber,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.grey,
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
