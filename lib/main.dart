import 'package:flutter/material.dart';
import 'package:meditation_app/theme/theme.dart';
import 'package:meditation_app/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: context.watch<ThemeManager>().themeMode,
        darkTheme: darkTheme,
        theme: lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
