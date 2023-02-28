import 'package:flutter/material.dart';

class DividerWithMargin extends StatelessWidget {
  const DividerWithMargin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Divider(),
        SizedBox(height: 40),
      ],
    );
  }
}
