import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/modules/list_movies/presentation/ui/list_movies_page.dart';
import 'package:movie_app/themes/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),() => {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ListMoviesPage()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}

