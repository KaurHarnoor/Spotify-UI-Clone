import 'package:flutter/material.dart';
import '../data/data.dart';

class TrackModel extends ChangeNotifier {
  Song? currentTrack;

  void setTrack(Song song) {
    currentTrack = song;
    notifyListeners();
  }
}
