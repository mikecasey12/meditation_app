import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/widget/most_playing_music_tile.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: MostPlayingMusicTile(
          icon: FontAwesomeIcons.compactDisc,
          subtitle: 'Rain, Flash',
          title: 'Mix',
          trailingTitle: '00:00',
          color: Colors.deepPurple[200]!),
    );
  }
}
