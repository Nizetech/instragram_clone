import 'package:flutter/material.dart';
import 'package:instragram_clone/screens/components/constants/constants.dart';
import 'package:instragram_clone/screens/components/rich_text/base_text.dart';
import 'package:instragram_clone/screens/components/rich_text/rich_text_widget.dart';

class LoginScreenSignUp extends StatelessWidget {
  const LoginScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RicTextWidget(
      styleForAll: Theme.of(context).textTheme.subtitle1?.copyWith(height: 1.5),
      texts: [
        BaseText.plain(
          text: Strings.dontHaveAnAccount,
        ),
        BaseText(
          text: Strings.signUpOn,
        ),
        BaseText.link(
          onTapped: () => Uri.parse(
            Strings.facebookSignUpUrl,
          ),
          text: Strings.facebook,
        ),
        BaseText.plain(
          text: Strings.orCreateAnAccountOn,
        ),
        BaseText.link(
          onTapped: () => Uri.parse(
            Strings.googleSignUpUrl,
          ),
          text: Strings.google,
        ),
      ],
    );
  }
}
