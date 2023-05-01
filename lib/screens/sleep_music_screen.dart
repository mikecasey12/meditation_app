import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/models/dummy_data.dart';
import 'package:meditation_app/models/multi_tile_model.dart';
import 'package:meditation_app/theme/theme_manager.dart';

import 'package:meditation_app/widget/most_playing_music_tile.dart';
import 'package:meditation_app/widget/scrolling_button.dart';
import 'package:provider/provider.dart';

class SleepMusicScreen extends StatefulWidget {
  const SleepMusicScreen({super.key});

  @override
  State<SleepMusicScreen> createState() => _SleepMusicScreenState();
}

class _SleepMusicScreenState extends State<SleepMusicScreen> {
  int currentIndex = 0;
  final List<MultiTileModel> _multiTileData = multiTileData;
  List optionsSelected = [];
  final List<String> _musicType = musicType;

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
        title: const Text('Sounds'),
        actions: [
          Container(
            height: size.height * 0.06,
            width: size.width * 0.12,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: FaIcon(FontAwesomeIcons.magnifyingGlass),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Sound scenes',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
                height: size.height * 0.22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.22,
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
                                FontAwesomeIcons.water,
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
                            'Waves, wind, seagulls',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.22,
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
                                FontAwesomeIcons.tree,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Forest',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Bird, rain, tree, cave',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 15),
            ScrollingButton(
              currentIndex: currentIndex,
              musicType: _musicType,
              switchIndexFn: switchIndexFn,
              selectedColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: size.width * 0.25,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1),
                itemBuilder: (context, index) {
                  bool isSelected = optionsSelected.contains(index);
                  return GestureDetector(
                    onTap: () {
                      if (optionsSelected.contains(index)) {
                        setState(() {
                          optionsSelected.remove(index);
                        });
                      } else {
                        setState(() {
                          optionsSelected.add(index);
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(
                                  width: 1.5, color: Colors.deepPurpleAccent)
                              : null,
                          color: isDark
                              ? Colors.grey[800]
                              : Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            _multiTileData[index].icon,
                            color: isSelected ? Colors.deepPurpleAccent : null,
                          ),
                          Text(_multiTileData[index].title)
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _multiTileData.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(children: [
        Positioned(
          bottom: size.height * 0.12,
          left: size.width * 0.15,
          right: size.width * 0.15,
          child: Container(
            height: size.height * 0.12,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // backgroundBlendMode: BlendMode.hardLight,
            ),
          ).blurred(
              blur: 2.5,
              blurColor: Colors.deepPurple[300]!,
              overlay: MostPlayingMusicTile(
                icon: FontAwesomeIcons.compactDisc,
                subtitle: 'Rain, Flash',
                title: 'Mix',
                trailingTitle: '00:00',
                color: Colors.deepPurple[100]!,
                isDark: isDark,
                textColor: Colors.white70,
              ),
              borderRadius: BorderRadius.circular(25)),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
