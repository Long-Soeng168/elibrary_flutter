import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyAudioPlay extends StatefulWidget {
  const MyAudioPlay({super.key});

  @override
  State<MyAudioPlay> createState() => _MyAudioPlayState();
}

class _MyAudioPlayState extends State<MyAudioPlay> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  bool isLoading = false;

  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    listenToDuration();
  }

  void listenToDuration() {
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        totalDuration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        currentDuration = newPosition;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        currentDuration = totalDuration; // Ensure the position is set to end
      });
    });

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isLoading = state == PlayerState.playing && !isPlaying;
      });
    });
  }

  void seek(Duration position) async {
    try {
      await player.seek(position);
    } catch (e) {
      print('Error seeking audio: $e');
    }
  }

  Future<void> toggleAudio(String url) async {
    try {
      if (isPlaying) {
        await player.pause();
      } else {
        setState(() {
          isLoading = true;
        });
        await player.play(UrlSource(url));
      }
      setState(() {
        isPlaying = !isPlaying;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error playing audio: $e');
    }
  }

  @override
  void dispose() {
    player.dispose(); // Dispose the player to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sliderValue = currentDuration.inSeconds.toDouble();
    double sliderMin = 0.0;
    double sliderMax = totalDuration.inSeconds.toDouble();

    // Clamp sliderValue to be within the range of sliderMin and sliderMax
    sliderValue = sliderValue.clamp(sliderMin, sliderMax);

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.229),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Slider
          Slider(
            min: sliderMin,
            max: sliderMax,
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                currentDuration = Duration(seconds: value.toInt());
              });
              seek(Duration(seconds: value.toInt()));
            },
          ),
          // Duration Display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(currentDuration)),
                Text(formatDuration(totalDuration)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Play/Pause Button
          isLoading
              ? CircularProgressIndicator()
              : ElevatedButton.icon(
                  onPressed: () {
                    toggleAudio('https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.mp3');
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  label: Text(isPlaying ? 'Pause' : 'Play'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
