import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MostPlayingMusicTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailingTitle;
  final IconData icon;
  final Color color;
  final Color textColor;
  final bool isDark;
  const MostPlayingMusicTile(
      {super.key,
      required this.icon,
      required this.subtitle,
      required this.title,
      required this.trailingTitle,
      required this.color,
      required this.isDark,
      this.textColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      tileColor: isDark ? Colors.grey[850] : Colors.deepPurple[50],
      contentPadding:
          const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      leading: Container(
        height: size.height * 0.06,
        width: size.width * 0.12,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: FaIcon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: textColor),
      ),
      trailing: Text(
        trailingTitle,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
