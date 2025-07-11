import 'package:flutter/material.dart';
import 'package:movie_app/widgets/svg_image.dart';

import 'movie_item_title.dart';

class MovieItem extends StatelessWidget {
  final String posterPath;
  final String title;
  final String voteRate;
  final String genre;
  final String playTime;
  final String releaseYear;

  const MovieItem({
    super.key,
    required this.title,
    required this.voteRate,
    required this.genre,
    required this.playTime,
    required this.posterPath,
    required this.releaseYear,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 120,
      child: Row(
        spacing: 12.78,
        children: [
          SVGImage(imageUri: posterPath),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 14,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Column(
                  spacing: 4,
                  children: [
                    MovieItemTitle(
                      iconUri:
                          "/Users/admin/Desktop/flutters/movie_app/assets/icons/ic_star.svg",
                      title: voteRate,
                      color: Colors.orange,
                    ),
                    MovieItemTitle(
                      iconUri:
                          "/Users/admin/Desktop/flutters/movie_app/assets/icons/ic_ticket_1.svg",
                      title: genre,
                    ),
                    MovieItemTitle(
                      iconUri:
                          "/Users/admin/Desktop/flutters/movie_app/assets/icons/ic_calendar_1.svg",
                      title: releaseYear,
                    ),
                    MovieItemTitle(
                      iconUri:
                          "/Users/admin/Desktop/flutters/movie_app/assets/icons/ic_clock_1.svg",
                      title: playTime,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}