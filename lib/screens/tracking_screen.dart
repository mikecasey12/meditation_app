import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final Uri _url = Uri.parse('https://github.com/mikecasey12');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.watch<ThemeManager>().isDark;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Info Screen',
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
                              FontAwesomeIcons.github,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Michael Ikebude',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Mobile Dev',
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
                        color: Colors.grey[900],
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
                              FontAwesomeIcons.rss,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Michael Ikebude',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          'Fullstack Dev',
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
          Expanded(
              child: Center(
            child: MaterialButton(
                onPressed: () {
                  _launchUrl();
                },
                color: isDark ? Colors.deepPurple : Colors.black87,
                padding: const EdgeInsets.all(25),
                child: const Text(
                  'Connect with Me',
                  style: TextStyle(color: Colors.white),
                )),
          ))
        ]),
      ),
    );
  }
}
