import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instragram_clone/screens/components/rich_text/link_text.dart';

class BaseText {
  final String text;
  final TextStyle? style;

  const BaseText({
    required this.text,
    this.style,
  });

  factory BaseText.plain({
    required String text,
    TextStyle? style = const TextStyle(),
  }) =>
      BaseText(
        text: text,
        style: style,
      );

  factory BaseText.link({
    required String text,
    required VoidCallback onTapped,
    TextStyle? style = const TextStyle(
      decoration: TextDecoration.underline,
      color: Colors.blue,
    ),
  }) =>
      LinkText(
        text: text,
        style: style,
        onTapped: onTapped,
      );
}
