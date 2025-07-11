import 'package:flutter/material.dart';

class SVGImage extends StatelessWidget {
  final String imageUri;

  const SVGImage({super.key, required this.imageUri});

  @override
  Widget build(BuildContext context) => Container(
    width: 101.19,
    height: 120,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
    child: Image.asset(imageUri, fit: BoxFit.fill),
  );
}