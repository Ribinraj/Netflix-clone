import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix clone',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(
            
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            primarySwatch: Colors.blue,

          scaffoldBackgroundColor:backgroundcolor,
         
          fontFamily: GoogleFonts.montserrat().fontFamily ,
          textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white),bodyMedium: TextStyle(color: Colors.white))),
          
      home:  ScreenMainPage(),
    );
  }
}
 