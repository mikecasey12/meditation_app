import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/models/dummy_data.dart';
import 'package:meditation_app/theme/theme_manager.dart';
import 'package:meditation_app/widget/most_playing_music_tile.dart';
import 'package:meditation_app/widget/scrolling_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<String> _musicType = musicTypeTwo;

  void switchIndexFn(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.watch<ThemeManager>().isDark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Michael'),
        actions: [
          Container(
            height: size.height * 0.06,
            width: size.width * 0.12,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: FaIcon(FontAwesomeIcons.solidBell),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScrollingButton(
                  currentIndex: currentIndex,
                  musicType: _musicType,
                  switchIndexFn: switchIndexFn,
                  backgroundColor:
                      isDark ? Colors.grey[800]! : Colors.deepPurple[100]!,
                  selectedColor:
                      isDark ? Colors.grey[600]! : Colors.deepPurple[200]!),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Featured',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                  height: size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.28,
                        width: size.width * 0.48,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 163, 91, 250),
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.12,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.cloud,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              'Best Insomnia',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Story',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[500]),
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              '32 min',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.28,
                        width: size.width * 0.48,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 200, 228, 155),
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.12,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.handSparkles,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              'Sleep at Ease',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Music',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[500]),
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              '54 min',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Most playing',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              MostPlayingMusicTile(
                icon: FontAwesomeIcons.solidMoon,
                subtitle: 'Music',
                title: 'Deep Sleep',
                trailingTitle: '32 min',
                color: Colors.pink[200]!,
                isDark: isDark,
              ),
              const SizedBox(height: 5),
              MostPlayingMusicTile(
                icon: FontAwesomeIcons.brain,
                subtitle: 'Story',
                title: 'Self healing',
                trailingTitle: '52 min',
                color: Colors.green[200]!,
                isDark: isDark,
              ),
              const SizedBox(height: 5),
              MostPlayingMusicTile(
                icon: FontAwesomeIcons.music,
                subtitle: 'Music',
                title: 'Soothing Music',
                trailingTitle: '40 min',
                color: Colors.orange[200]!,
                isDark: isDark,
              ),
              const SizedBox(height: 5),
              MostPlayingMusicTile(
                icon: FontAwesomeIcons.solidHeart,
                subtitle: 'Hymn',
                title: 'Blessing My Soul with Goodness',
                trailingTitle: '40 min',
                color: Colors.red[200]!,
                isDark: isDark,
              ),
              SizedBox(
                height: size.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
