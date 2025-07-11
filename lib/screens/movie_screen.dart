import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: Color(0xff242A32),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 327,
              height: 120,
              child: Row(
                children: [
                  Container(
                    width: 101.19,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      "/Users/admin/Desktop/flutters/movie_app/sample_image.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 14,
                      children: [
                        const Text(
                          "Spiderman",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Column(
                          children: [

                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
