import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../widgets/movie_item_title.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AppViewModel>();
    final selectedMovie = viewModel.getSelectedMovie();

    return Scaffold(
      backgroundColor: Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: Color(0xff242A32),
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/icons/ic_arrow_left.svg"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/icons/ic_favorite.svg"),
          ),
        ],
        title: const Text(
          "Detail",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: MovieDetailScreenBody(selectedMovie: selectedMovie),
    );
  }
}

class MovieDetailScreenBody extends StatelessWidget {
  final Movie selectedMovie;

  const MovieDetailScreenBody({super.key, required this.selectedMovie});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          SizedBox(
            width: 375,
            height: 210.94,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )
              ),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/${selectedMovie.backdropPath}",
              ),
            ),
          ),
          Positioned(
            right: 11,
            top: 176,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset("assets/icons/ic_star.svg"),
                      Text(
                        selectedMovie.voteAverage.toString(),
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 151,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 100,
                      height: 120,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w342/${selectedMovie.posterPath}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        selectedMovie.originalTitle,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MovieItemTitle(
                        iconUri: "assets/icons/ic_calendar_2.svg",
                        title: selectedMovie.releaseDate.split("-")[0],
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 16,
                        child: VerticalDivider(color: Colors.grey),
                      ),
                      MovieItemTitle(
                        iconUri: "assets/icons/ic_clock_2.svg",
                        title: "${selectedMovie.runTime} Minutes",
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 16,
                        child: VerticalDivider(color: Colors.grey),
                      ),
                      MovieItemTitle(
                        iconUri: "assets/icons/ic_ticket_2.svg",
                        title: selectedMovie.genres[0],
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  selectedMovie.overview,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
