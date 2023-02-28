import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/screens/components/constants/constants.dart';
import 'package:instragram_clone/screens/login/divider_with_margin.dart';
import 'package:instragram_clone/screens/login/facebook_button.dart';
import 'package:instragram_clone/screens/login/google_button.dart';
import 'package:instragram_clone/screens/login/login_screen.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.appName),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                Strings.welcomeToAppName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              DividerWithMargin(),
              Text(
                Strings.logIntoYourAccount,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(height: 1.5),
              ),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
                child: FacebookButton(),
              ),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
                child: GoogleButton(),
              ),
              DividerWithMargin(),
              LoginScreenSignUp(),
            ],
          )),
        ));
  }
}
