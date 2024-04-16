import 'package:flutter/material.dart';

void main() {
  runApp(MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlbumArtwork(),
              SizedBox(height: 20),
              SongTitle(),
              SizedBox(height: 20),
              SongProgressBar(),
              SizedBox(height: 20),
              PlayControls(),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: DeveloperInfo(),
          ),
        ],
      ),
    );
  }
}

class AlbumArtwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          Icons.album,
          size: 150,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SongTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Song Title - Artist Name',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SongProgressBar extends StatefulWidget {
  @override
  _SongProgressBarState createState() => _SongProgressBarState();
}

class _SongProgressBarState extends State<SongProgressBar> {
  double _progressValue = 0.5; // Initial progress value

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _progressValue,
      onChanged: (double value) {
        setState(() {
          _progressValue = value;
        });
      },
      activeColor: Colors.blue,
      inactiveColor: Colors.grey,
    );
  }
}

class PlayControls extends StatefulWidget {
  @override
  _PlayControlsState createState() => _PlayControlsState();
}

class _PlayControlsState extends State<PlayControls> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.skip_previous, color: Colors.white, size: 36),
          onPressed: () {
            // Handle previous song
          },
        ),
        SizedBox(width: 20),
        IconButton(
          icon: _isPlaying
              ? Icon(Icons.pause, color: Colors.white, size: 36)
              : Icon(Icons.play_arrow, color: Colors.white, size: 36),
          onPressed: () {
            setState(() {
              _isPlaying = !_isPlaying;
            });
            // Handle play/pause
          },
        ),
        SizedBox(width: 20),
        IconButton(
          icon: Icon(Icons.skip_next, color: Colors.white, size: 36),
          onPressed: () {
            // Handle next song
          },
        ),
      ],
    );
  }
}

class DeveloperInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'This Project is Developed by\nRAHGUL M S (URK23CS7016)',
        style: TextStyle(
          fontFamily: 'Nunito',
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
