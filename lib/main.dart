import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/pick_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      home: PickScreen(),
    );
  }
}
