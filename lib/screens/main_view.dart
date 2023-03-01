import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/screens/components/dialog/alert_dialog_model.dart';
import 'package:instragram_clone/screens/components/dialog/logout_dialog.dart';
import 'package:instragram_clone/screens/tabs/user_post/post_view.dart';

import '../state/auth/providers/auth_state_providers.dart';
import 'components/constants/constants.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text(Strings.appName),
            actions: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.film),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.add_a_photo_outlined,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.logout,
                ),
                onPressed: () async {
                  final shouldLogOut = await const LogoutDialog()
                      .present(context)
                      .then((value) => value ?? false);
                  if (shouldLogOut) {
                    ref.read(authStateProvider.notifier).logOut();
                  }
                },
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.person),
                ),
                Tab(
                  icon: Icon(Icons.search),
                ),
                Tab(
                  icon: Icon(Icons.home),
                ),
              ],
            )),
        body: const TabBarView(
          children: [
            UserPOstsView(),
            UserPOstsView(),
            UserPOstsView(),
          ],
        ),
      ),
    );
  }
}
