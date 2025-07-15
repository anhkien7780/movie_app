import 'package:flutter/material.dart';
import 'package:movie_app/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/movie_item.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AppViewModel>();
    final movies = viewModel.movies;
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
            if(movies.isEmpty) Center(child: CircularProgressIndicator()),
            if(movies.isNotEmpty)
            ...List.generate(movies.length, (index) {
              return Padding(
                padding: EdgeInsets.only(top: 24, right: 24, left: 24),
                child: GestureDetector(
                  onTap: () {
                    viewModel.setSelectedMovie(movies[index]);
                    Navigator.pushNamed(context, "/movie_detail");
                  },
                  child: MovieItem(
                    posterPath:
                        movies[index].posterPath,
                    title: movies[index].originalTitle,
                    voteRate: movies[index].voteAverage.toString(),
                    genre: movies[index].genres[0],
                    runTime: "${movies[index].runTime.toString().split("-")[0]} minutes",
                    releaseDate: movies[index].releaseDate,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
