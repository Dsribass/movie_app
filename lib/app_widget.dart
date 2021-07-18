import 'package:flutter/material.dart';
import 'package:movie_app/modules/list_movies/presentation/ui/list_movies_page.dart';
import 'package:movie_app/modules/splash/splash_page.dart';
import 'package:movie_app/themes/app_colors.dart';

class AppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies.",
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: AppColors.primary,
      ),
      home: ListMoviesPage(),
    );
  }
}