import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/screens/homescreen.dart';
import 'package:meditation_app/screens/sleep_music_screen.dart';
import 'package:meditation_app/screens/tracking_screen.dart';
import 'package:meditation_app/widget/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _screenList = const [
    HomeScreen(),
    SleepMusicScreen(),
    TrackingScreen(),
  ];

  void switchViewFn(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: _screenList[currentIndex],
        floatingActionButton: BottomNavigation(
          currentIndex: currentIndex,
          switchViewFn: switchViewFn,
        ));
  }
}
