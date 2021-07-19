import 'package:flutter/material.dart';
import 'package:movie_app/themes/app_colors.dart';
import 'package:movie_app/themes/app_text_styles.dart';

class GenreButton extends StatelessWidget {
  final String title;

  const GenreButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Text(
            title,
            style: AppTextStyles.contentText,
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
