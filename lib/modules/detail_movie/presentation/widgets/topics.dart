import 'package:flutter/material.dart';
import 'package:movie_app/themes/app_text_styles.dart';

class Topics extends StatelessWidget {
  final String topic;
  final String content;
  const Topics({Key? key, required this.topic, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            topic + ":",
            style: AppTextStyles.topic,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            content,
            style: AppTextStyles.contentText,
          ),
        ],
      ),
    );
  }
}
