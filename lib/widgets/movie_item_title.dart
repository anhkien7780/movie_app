import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieItemTitle extends StatelessWidget {
  final String iconUri;
  final String title;
  final Color? color;

  const MovieItemTitle({
    super.key,
    required this.iconUri,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Row(
    spacing: 4,
    children: [
      SvgPicture.asset(iconUri),
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: color ?? Color(0xffEEEEEE),
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}