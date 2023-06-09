import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  final Function switchViewFn;
  final int currentIndex;
  const BottomNavigation(
      {super.key, required this.switchViewFn, required this.currentIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var isDark = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(left: 35, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width * 0.6,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.deepPurple[100],
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.switchViewFn(0);
                  },
                  child: Container(
                    height: size.height * 0.075,
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                        color: widget.currentIndex == 0
                            ? isDark
                                ? Colors.grey[600]
                                : Colors.deepPurple[200]
                            : null,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.house,
                        size: size.height * 0.03,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.switchViewFn(1);
                  },
                  child: Container(
                    height: size.height * 0.075,
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                        color: widget.currentIndex == 1
                            ? isDark
                                ? Colors.grey[600]
                                : Colors.deepPurple[200]
                            : null,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.compactDisc,
                        size: size.height * 0.03,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.switchViewFn(2);
                  },
                  child: Container(
                    height: size.height * 0.075,
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                        color: widget.currentIndex == 2
                            ? isDark
                                ? Colors.grey[600]
                                : Colors.deepPurple[200]
                            : null,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.chartLine,
                        size: size.height * 0.03,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              isDark = !isDark;
              setState(() {
                context.read<ThemeManager>().darkMode(isDark);
              });
            },
            child: Container(
              height: size.height * 0.1,
              width: size.width * 0.2,
              decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.deepPurple[100],
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Center(
                  child: FaIcon(
                isDark ? FontAwesomeIcons.sun : FontAwesomeIcons.solidMoon,
                size: size.height * 0.03,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
