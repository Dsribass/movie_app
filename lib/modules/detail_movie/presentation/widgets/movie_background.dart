import 'package:flutter/material.dart';

class MovieBackground extends StatelessWidget {
  final String image;
  const MovieBackground({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
        image,
        alignment: Alignment.center,
        fit: BoxFit.cover, errorBuilder: (BuildContext context,
        Object exception, StackTrace? stackTrace) {
      return Icon(
        Icons.movie,
        color: Colors.white,
        size: 80,
      );
    });;
  }
}
