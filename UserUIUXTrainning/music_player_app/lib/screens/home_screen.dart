import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/helpers/helpers.dart';
import 'package:music_player_app/models/audioplayer_model.dart';
import 'package:music_player_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Background(),
        Column(
          children: const [
            CustomAppBarWidget(),
            _ImagenDiscoYContructor(),
            TituloPlay(),
            Expanded(child: Lyrics())
          ],
        ),
      ],
    ));
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                Color(0xff33333e),
                Color(0xff201e28),
              ])),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: ListWheelScrollView(
          itemExtent: 50,
          diameterRatio: 1.5,
          physics: const BouncingScrollPhysics(),
          children: getLyrics()
              .map((e) => Text(
                    e,
                    style: const TextStyle(fontSize: 20, color: Colors.white60),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class TituloPlay extends StatefulWidget {
  const TituloPlay({
    Key? key,
  }) : super(key: key);

  @override
  State<TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController animationController;

  final assetAudioPlayer = AssetsAudioPlayer();

  void open() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);

    //! assetAudioPlayer.open('assets/Breaking-Benjamin-Far-Away.mp3');
    assetAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'),
        autoStart: true, showNotification: true);

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      //! audioPlayerModel.songDuration = playingAudio.duration;
      audioPlayerModel.songDuration =
          playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      margin: const EdgeInsetsDirectional.only(top: 40),
      child: Row(
        children: [
          Column(
            children: const [
              Text(
                'Far Away',
                style: TextStyle(fontSize: 30, color: Colors.white60),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(fontSize: 15, color: Colors.white30),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              onPressed: () {
                final audioPlayerModel =
                    Provider.of<AudioPlayerModel>(context, listen: false);
                if (isPlaying) {
                  animationController.reverse();
                  isPlaying = false;
                  audioPlayerModel.animationController.stop();
                } else {
                  animationController.forward();
                  isPlaying = true;
                  audioPlayerModel.animationController.repeat();
                }
                if (firstTime) {
                  open();
                  firstTime = false;
                } else {
                  assetAudioPlayer.playOrPause();
                }
                // isPlaying
                //     ? animationController.reverse()
                //     : animationController.forward();
                // isPlaying = !isPlaying;
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: animationController,
              ))
        ],
      ),
    );
  }
}

class _ImagenDiscoYContructor extends StatelessWidget {
  const _ImagenDiscoYContructor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 100),
      child: Row(
        children: const [ImagenDisco(), SongProgressBar()],
      ),
    );
  }
}

class SongProgressBar extends StatelessWidget {
  const SongProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final porcentaje = audioPlayerModel.porcentaje;


    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            audioPlayerModel.songTotalDuration,
            style: TextStyle(color: Colors.white.withOpacity(0.4)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                Container(
                  width: 5,
                  height: 230,
                  color: Colors.white30,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 5,
                    height: 230 * porcentaje,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
          Text(
            audioPlayerModel.songCurrent,
            style: TextStyle(color: Colors.white.withOpacity(0.4)),
          ),
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  const ImagenDisco({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: Colors.grey.withOpacity(0.4)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
                duration: const Duration(seconds: 10),
                infinite: true,
                manualTrigger: true,
                controller: (controller) =>
                    audioPlayerModel.animationController = controller,
                child: const Image(image: AssetImage('assets/aurora.jpg'))),
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                  color: Colors.black38, shape: BoxShape.circle),
            ),
            Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                  color: Colors.black54, shape: BoxShape.circle),
            )
          ],
        ),
      ),
    );
  }
}
