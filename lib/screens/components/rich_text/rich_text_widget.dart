import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instragram_clone/screens/components/rich_text/base_text.dart';

import 'link_text.dart';

class RicTextWidget extends StatelessWidget {
  final Iterable<BaseText> texts;
  final TextStyle? styleForAll;
  const RicTextWidget({
    Key? key,
    required this.texts,
    required this.styleForAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: texts.map((baseText) {
          if (baseText is LinkText) {
            return TextSpan(
              text: baseText.text,
              style: styleForAll?.merge(baseText.style),
              recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
            );
          } else {
            return TextSpan(
              text: baseText.text,
              style: styleForAll?.merge(baseText.style),
            );
          }
        }).toList(),
      ),
    );
  }
}
