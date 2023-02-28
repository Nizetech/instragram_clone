import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/screens/components/loading/loading_screen.dart';
import 'package:instragram_clone/state/auth/backend/authenticatior.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login View'),
      ),
      body: Column(
        children: [
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              onPressed: () =>
                  ref.read(authStateProvider.notifier).loginWithGoogle(),
              child: Text('Sign With Google'))
        ],
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Main View'),
        ),
        body: Consumer(
          builder: ((context, ref, child) {
            return TextButton(
              onPressed: () async {
                await ref.read(authStateProvider.notifier).logOut();
              },
              child: Text('Logout'),
            );
          }),
        ));
  }
}
