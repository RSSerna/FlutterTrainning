import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;
  late AnimationController _animationController;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);

  String get songTotalDuration => printDuration(_songDuration);
  String get songCurrent => printDuration(_current);

  double get porcentaje => _songDuration.inSeconds > 0
      ? _current.inSeconds / _songDuration.inSeconds
      : 0;

  Duration get songDuration => _songDuration;

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  Duration get current => _current;

  set current(Duration value) {
    _current = value;
    notifyListeners();
  }

  AnimationController get animationController => _animationController;

  set animationController(AnimationController value) =>
      _animationController = value;

  bool get isPlaying => _isPlaying;

  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  String printDuration(Duration d) {
    String twoDigits(int n) {
      return n >= 10 ? '$n' : '0$n';
    }
    return '${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}';
  }
}
