import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/screens/components/animations/empty_content_animation.dart';
import 'package:instragram_clone/screens/components/loading/loading_screen.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';

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
            return Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      await ref.read(authStateProvider.notifier).logOut();
                    },
                    child: Text('Logout'),
                  ),
                  SizedBox(height: 20),
                  EmptyContentAnimation(),
                ],
              ),
            );
          }),
        ));
  }
}
