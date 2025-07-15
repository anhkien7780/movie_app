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
      body: MovieDetailScreenBody(),
    );
  }
}

class MovieDetailScreenBody extends StatefulWidget {
  const MovieDetailScreenBody({super.key});

  @override
  State<MovieDetailScreenBody> createState() => _MovieDetailScreenBodyState();
}

class _MovieDetailScreenBodyState extends State<MovieDetailScreenBody> {
  late Future<Movie> _movieFuture;

  @override
  void initState() {
    super.initState();
    int movieId = context.read<AppViewModel>().selectedMovieId;
    _movieFuture = context.read<AppViewModel>().fetchMovie(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _movieFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        if (!snapshot.hasData) {
          return Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
            child: Text("No data"),
          );
        }
        final movie = snapshot.data!;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                height: 211,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                    fit: BoxFit.fitWidth,
                  ),
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
                          movie.voteAverage.toString(),
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
                          "https://image.tmdb.org/t/p/w342/${movie.posterPath}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          movie.originalTitle,
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
                          title: movie.releaseDate.split("-")[0],
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 16,
                          child: VerticalDivider(color: Colors.grey),
                        ),
                        MovieItemTitle(
                          iconUri: "assets/icons/ic_clock_2.svg",
                          title: "${movie.runTime} Minutes",
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 16,
                          child: VerticalDivider(color: Colors.grey),
                        ),
                        MovieItemTitle(
                          iconUri: "assets/icons/ic_ticket_2.svg",
                          title: movie.genres[0],
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    movie.overview,
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
        );
      },
    );
  }
}
