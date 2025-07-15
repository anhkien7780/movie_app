import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/movie_item_title.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: Color(0xff242A32),
        titleSpacing: 24,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/ic_arrow_left.svg"),
              ),
            ),
            const Text(
              "Detail",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/ic_favorite.svg"),
            ),
          ],
        ),
      ),
      body: MovieDetailScreenBody(),
    );
  }
}

class MovieDetailScreenBody extends StatelessWidget {
  const MovieDetailScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          SizedBox(
            width: 375,
            height: 210.94,
            child: Image.asset(
              "/Users/admin/Desktop/flutters/movie_app/sample_backdrop_image.png",
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
                  width: 54,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_star.svg"),
                      Text(
                        "9.5",
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
                    SizedBox(
                      width: 100,
                      height: 120,
                      child: Image.asset(
                        "/Users/admin/Desktop/flutters/movie_app/sample_image.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Spiderman No Way Home",
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
                        title: "2021",
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 16,
                        child: VerticalDivider(color: Colors.grey),
                      ),
                      MovieItemTitle(
                        iconUri: "assets/icons/ic_clock_2.svg",
                        title: "148 Minutes",
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 16,
                        child: VerticalDivider(color: Colors.grey),
                      ),
                      MovieItemTitle(
                        iconUri: "assets/icons/ic_ticket_2.svg",
                        title: "Action",
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
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
