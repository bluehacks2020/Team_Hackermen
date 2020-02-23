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
              'Mahal na mahal ni Aling Rosa ang kanyang anak na si Pina.  Inaalagaan niya itong mabuti at hindi niya pinagagawa sa bahay upang hindi mapagod.  Masaya na siyang nagsisilbi sa anak at gumawa ng lahat ng trabaho sa bahay. Si Pina ay lumaki sa layaw dahil sa kagagawan ni Aling Rosa.',
              'Gustuhin man niyang turuan itong gumawa sa bahay at magbago ng ugali ay hindi na niya magawa.  Ayaw nang baguhin ni Pina ang kanyang nakasanayang masarap na buhay.  Kung kaya’t napilitan si Aling Rosa na kahit na matanda na ay siya pa rin ang nagtatrabaho at gumawa ng lahat ng gawain sa bahay.',
              'Isang araw ay nagkasakit si Aling Rosa.  Mahinang-mahina siya at hindi na makabangon sa higaan.  Nagmakaawa siya sa anak na magluto ng pagkain upang hindi sila magutom na mag-ina.'],
            textStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            onTap: () {},
          )
        ],
      ),
    );
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
      padding: const EdgeInsets.all(0.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
