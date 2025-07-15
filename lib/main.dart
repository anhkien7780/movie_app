
import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => MovieDetailScreen(),
        "/movie_detail": (BuildContext context) => MovieDetailScreen(),
      },
    );
  }
}
