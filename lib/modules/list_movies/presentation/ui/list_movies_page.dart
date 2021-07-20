import 'package:flutter/material.dart';
import 'package:movie_app/modules/detail_movie/presentation/ui/detail_movie.dart';
import 'package:movie_app/modules/list_movies/presentation/controller/list_movies_controller.dart';
import 'package:movie_app/modules/list_movies/presentation/widgets/card_movie_widget.dart';
import 'package:movie_app/themes/app_images.dart';
import 'package:movie_app/widgets/error_content.dart';

class ListMoviesPage extends StatefulWidget {
  const ListMoviesPage({Key? key}) : super(key: key);

  @override
  _ListMoviesPageState createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  final controller = ListMoviesController();

  _success() {
    return ListView(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      children: [
        Wrap(
          spacing: 13,
          runSpacing: 15,
          children: controller.movies
              .map((movie) =>
              CardMovie(
                imageUrl: movie.posterUrl,
                title: movie.title,
                context: context,
                onTap: () {
                  var route = MaterialPageRoute(
                    builder: (context) => new DetailMoviePage(
                        id: movie.id));
                  Navigator.of(context).pushReplacement(route);
                },
              ))
              .toList(),
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

  _error([String messageError = "Falha ao carregar conteúdo..."]) {
    return ErrorContent(
      messageError: messageError,
      textButton: "Tentar Novamente",
      action: () async {
        controller.loadList();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller.loadList();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(AppImages.logo),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: ValueListenableBuilder<PageState>(
          valueListenable: controller.stateNotifier,
          builder: (_, state, __) => stateManagement(state)),
    );
  }
}
