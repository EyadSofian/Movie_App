import 'package:flutter/material.dart';
import 'package:movies_app/pages/splash/splasg_screen.dart';
import 'package:movies_app/pages/home/home_view.dart';
import 'package:movies_app/pages/search/search_view.dart';
void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

