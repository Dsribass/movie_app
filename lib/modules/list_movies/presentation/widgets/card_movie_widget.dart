import 'package:flutter/material.dart';
import 'package:movie_app/themes/app_colors.dart';
import 'package:movie_app/themes/app_text_styles.dart';

class CardMovie extends StatelessWidget {
  final String imageUrl;
  final String title;
  final BuildContext context;
  final onTap;

  const CardMovie(
      {Key? key,
      this.imageUrl = '',
      required this.title,
      required this.context,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.44,
          child: Column(
            children: [
              Container(
                color: AppColors.primary,
                height: 270,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Icon(
                      Icons.movie,
                      color: Colors.white,
                      size: 80,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  child: Text(
                    title,
                    style: AppTextStyles.subTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
