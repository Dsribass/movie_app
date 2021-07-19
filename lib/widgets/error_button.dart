import 'package:flutter/material.dart';
import 'package:movie_app/themes/app_text_styles.dart';

class ErrorButton extends StatelessWidget {
  final onPressed;
  final textButton;

  const ErrorButton(
      {Key? key, required this.onPressed, required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        Icons.refresh,
        size: 25,
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.red)))),
      label: Text(
        textButton,
        style: AppTextStyles.textButton,
      ),
      onPressed: onPressed,
    );
  }
}
