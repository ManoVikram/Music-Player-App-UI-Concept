import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './homeScreen/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Concept UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MusicConceptUI(),
    );
  }
}

class MusicConceptUI extends StatelessWidget {
  const MusicConceptUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

void main(List<String> args) {
  runApp(const MyApp());
}
