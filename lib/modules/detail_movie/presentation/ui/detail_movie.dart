import 'package:flutter/material.dart';
import 'package:movie_app/modules/detail_movie/presentation/controller/detail_movie_controller.dart';
import 'package:movie_app/modules/detail_movie/presentation/widgets/genre_button.dart';
import 'package:movie_app/modules/detail_movie/presentation/widgets/movie_background.dart';
import 'package:movie_app/modules/detail_movie/presentation/widgets/text_with_icon.dart';
import 'package:movie_app/modules/detail_movie/presentation/widgets/topics.dart';
import 'package:movie_app/modules/list_movies/presentation/ui/list_movies_page.dart';
import 'package:movie_app/themes/app_colors.dart';
import 'package:movie_app/themes/app_text_styles.dart';
import 'package:movie_app/widgets/error_content.dart';

class DetailMoviePage extends StatefulWidget {
  final int id;

  const DetailMoviePage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  final controller = DetailMovieController();

  @override
  void initState() {
    super.initState();
    controller.loadList(idMovie: widget.id);
  }

  _success() {
    var size = MediaQuery.of(context).size;
    final movie = controller.movie!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 280,
                width: size.width,
                child: MovieBackground(image: movie.backdropUrl),
              ),
              Positioned(
                child: Container(
                  width: size.width,
                  height: 130,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.85),
                          Colors.black.withOpacity(0),
                        ]),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 15),
                  child: _returnPage(onTap: () => Navigator.of(context).pop()),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: AppTextStyles.title,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      TextWithIcon(
                        color: AppColors.yellow,
                        title: movie.voteAverage.toString(),
                        icon: Icons.star,
                      ),
                      TextWithIcon(
                        color: AppColors.green,
                        title: movie.runtime.toString(),
                        icon: Icons.access_time,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(movie.genres.length,
                        (i) => GenreButton(title: movie.genres[i])),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Topics(topic: "Lançamento", content: movie.dateFormat),
                      Topics(
                          topic: "Orçamento",
                          content: "U\$ " + movie.budget.toString()),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: _synopsis(content: movie.overview),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _loading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _error([String messageError = "Filme não encontrado!"]) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ErrorContent(
        messageError: messageError,
        action: () async {
          Navigator.of(context).pop();
        },
        textButton: "Voltar",
      ),
    );
  }

  stateManagement(PageState state) {
    switch (state) {
      case PageState.LOADING:
        return _loading();
      case PageState.ERROR:
        return _error();
      case PageState.SUCCESS:
        return _success();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<PageState>(
            valueListenable: controller.stateNotifier,
            builder: (_, state, __) => stateManagement(state)));
  }

  Widget _synopsis({required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sinopse",
          style: AppTextStyles.subTitle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            content,
            style: AppTextStyles.contentText,
          ),
        )
      ],
    );
  }

  Widget _returnPage({required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios,
        size: 40,
        color: AppColors.primary,
      ),
    );
  }
}
