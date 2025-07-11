import 'package:flutter/material.dart';

import '../widgets/movie_item.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      body: SafeArea(
        child: ListView(
          addAutomaticKeepAlives: false,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 134.5),
                  child: Text(
                    "Movies",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Color(0xffECECEC),
                    ),
                  ),
                ),
              ),
            ),
            ...List.generate(10, (index) {
              return Padding(
                padding: EdgeInsets.only(top: 24, right: 24, left: 24),
                child: MovieItem(
                  posterPath:
                      "/Users/admin/Desktop/flutters/movie_app/sample_image.png",
                  title: 'Spiderman',
                  voteRate: '9.5',
                  genre: 'Action',
                  playTime: '134 minutes',
                  releaseYear: '2019',
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
