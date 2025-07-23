import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/screens/movies_screen.dart';
import 'package:movie_app/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

main() => runApp(
  ChangeNotifierProvider(create: (_) => AppViewModel(), child: MyApp()),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => MoviesScreen(),
        "/movie_detail": (BuildContext context) => MovieDetailScreen(),
      },
    );
  }
}
