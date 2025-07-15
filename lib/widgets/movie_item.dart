import 'package:flutter/material.dart';

import 'movie_item_title.dart';

class MovieItem extends StatelessWidget {
  final String posterPath;
  final String title;
  final String voteRate;
  final String genre;
  final String runTime;
  final String releaseDate;

  const MovieItem({
    super.key,
    required this.title,
    required this.voteRate,
    required this.genre,
    required this.runTime,
    required this.posterPath,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 120,
      child: Row(
        spacing: 13,
        children: [
          Container(
            width: 101,
            height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.hardEdge,
            child: Image.network("https://image.tmdb.org/t/p/w342/$posterPath", fit: BoxFit.fill),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 14,
              children: [
                Text(
                  maxLines: 1,
                  softWrap: true,
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
                          "assets/icons/ic_star.svg",
                      title: voteRate,
                      color: Colors.orange,
                    ),
                    MovieItemTitle(
                      iconUri:
                          "assets/icons/ic_ticket_1.svg",
                      title: genre,
                    ),
                    MovieItemTitle(
                      iconUri:
                          "assets/icons/ic_calendar_1.svg",
                      title: releaseDate,
                    ),
                    MovieItemTitle(
                      iconUri:
                          "assets/icons/ic_clock_1.svg",
                      title: runTime,
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
