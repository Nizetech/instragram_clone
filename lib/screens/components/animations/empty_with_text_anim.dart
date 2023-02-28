import 'package:flutter/material.dart';

import 'empty_content_animation.dart';

class EmptyContentsWithTextAnimation extends StatelessWidget {
  final String text;
  const EmptyContentsWithTextAnimation({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white54),
          ),
        ),
        EmptyContentAnimation(),
      ],
    ));
  }
}
