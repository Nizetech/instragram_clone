import 'package:flutter/animation.dart';
import 'package:instragram_clone/screens/components/rich_text/base_text.dart';

class LinkText extends BaseText {
  final VoidCallback onTapped;
  const LinkText({
    required this.onTapped,
    required super.text,
    super.style,
  });
}
