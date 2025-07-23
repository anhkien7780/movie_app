import 'package:flutter/material.dart';
import 'package:movie_app/networks/movie_services.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../view_models/app_view_model.dart';
import '../widgets/movie_item.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    setState(() {
      _moviesFuture = MovieServices.fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _moviesFuture = MovieServices.fetchRandomMovies();
            });
          },
          child: ListView(
            addAutomaticKeepAlives: false,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 134.5,
                    ),
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
              FutureBuilder(
                future: _moviesFuture,
                builder: (context, snapshot) {
                  final children = <Widget>[];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    children.add(
                      const Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (snapshot.hasError) {
                    children.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Something went wrong\n${snapshot.error}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    final movies = snapshot.data!;
                    children.addAll(
                      List.generate(movies.length, (index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            context.read<AppViewModel>().setSelectedMovieId(
                              movie.id,
                            );
                            Navigator.pushNamed(context, "/movie_detail");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 24,
                              left: 24,
                              right: 24,
                            ),
                            child: MovieItem(
                              title: movie.originalTitle,
                              voteRate: movie.voteAverage.toString(),
                              genre: movie.genres[0],
                              runTime: movie.runTime.toString(),
                              posterPath: movie.posterPath,
                              releaseDate: movie.releaseDate.split("-")[0],
                            ),
                          ),
                        );
                      }),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
