import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/utils/colors.dart';

class CustomItem extends StatelessWidget {
  final String? title;

  CustomItem({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontFamily: 'Agne',
          fontSize: 16,
        ),
        child: Text(title ?? "",)
      ),
    );
  }
}
