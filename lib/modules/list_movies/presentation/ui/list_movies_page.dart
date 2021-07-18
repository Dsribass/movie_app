import 'package:flutter/material.dart';
import 'package:movie_app/modules/list_movies/presentation/controller/list_movies_controller.dart';
import 'package:movie_app/modules/list_movies/presentation/widgets/card_movie_widget.dart';
import 'package:movie_app/modules/list_movies/presentation/widgets/error_button.dart';
import 'package:movie_app/themes/app_colors.dart';
import 'package:movie_app/themes/app_images.dart';
import 'package:movie_app/themes/app_text_styles.dart';

class ListMoviesPage extends StatefulWidget {
  const ListMoviesPage({Key? key}) : super(key: key);

  @override
  _ListMoviesPageState createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  final controller = ListMoviesController();

  _success() {
    return ListView(
      padding: EdgeInsets.only(top: 30, left: 15, right: 15),
      children: [
        Wrap(
          spacing: 13,
          runSpacing: 15,
          children: [
            CardMovie(
              imageUrl:
                  "https://image.tmdb.org/t/p/w200/rPdtLWNsZmAtoZl9PK7S2wE3qiS.jpg",
              title: "Viuva Negra",
              context: context,
              onTap: () {
                print("Clicou");
              },
            ),
          ],
        ),
      ],
    );
  }

  _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _error(String messageError) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              messageError,
              style: AppTextStyles.messageError,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            ErrorButton(
              textButton: "Tentar Novamente",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(AppImages.logo),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: _success(),
    );
  }
}
