import 'package:flutter/material.dart';
import 'package:blue_hacks_kuwento/splash_screen.dart';
import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int index = 0;
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alamat ng Pinya'),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/alam1_alamat.mp4',
            ),
            looping: true,
          ),
          FadeAnimatedTextKit(
            duration: Duration(milliseconds: 20000),
            text: [
              textChooser(index)],
            textStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
		  BottomNavigationBar(
              onTap: (int index) {
			  refresh(context, '/TestScreen');
			  },
              items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios),
              title: Text('Previous'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios),
              title: Text('Next'),
            ),
          ]
          )
        ],
      ),
    );
    }

	  String textChooser(int i) {
      if (i == 0) {
        return 'Mahal na mahal ni Aling Rosa ang kanyang anak na si Pina.  Inaalagaan niya itong mabuti at hindi niya pinagagawa sa bahay upang hindi mapagod.';
      } else if (i == 1) {
        return 'Isang araw ay nagkasakit si Aling Rosa.  Mahinang-mahina siya at hindi na makabangon sa higaan.  Nagmakaawa siya sa anak na magluto ng pagkain upang hindi sila magutom na mag-ina.';
      } else {
        return 'Isang araw, sa isang sulok ng kanilang bakuran ay nakita niya ang isang halaman na ang bunga ay tulad ng isang ulo na maraming mata.';
      }
    }

    String animChooser(int i) {
    if (i == 0) {
      return
    }
    }
    void refresh(BuildContext c, String route) {
      dispose();
      Navigator.of(c).pushNamed(route);
    }
  }

class ChewieListItem extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 9 / 16,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: widget.looping,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}