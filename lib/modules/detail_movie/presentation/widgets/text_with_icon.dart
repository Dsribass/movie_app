import 'package:flutter/material.dart';
import 'package:movie_app/themes/app_text_styles.dart';

class TextWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const TextWithIcon({Key? key, required this.title, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(
                  icon,
                  size: 21.5,
                  color: color,
                ),
              ),
            ),
            TextSpan(text: title, style: AppTextStyles.regular),
          ],
        ),
      ),
    );
  }
}
