import 'package:flutter/material.dart';
import 'package:movie_app/themes/app_text_styles.dart';

import 'error_button.dart';

class ErrorContent extends StatelessWidget {
  final String messageError;
  final action;
  final String textButton;

  const ErrorContent(
      {Key? key,
      required this.action,
      required this.messageError,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              textButton: textButton,
              onPressed: action,
            ),
          ],
        ),
      ),
    );
  }
}
