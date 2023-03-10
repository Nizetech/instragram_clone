import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/screens/components/loading/loading_screen.dart';
import 'package:instragram_clone/screens/login.dart';
import 'package:instragram_clone/screens/login/login_view.dart';
import 'package:instragram_clone/screens/main_view.dart';
import 'package:instragram_clone/state/auth/models/auth_results.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';
import 'package:instragram_clone/state/auth/providers/is_loggedf_in_providers.dart';
import 'package:instragram_clone/state/providers/isloading_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   // name: 'dev',
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Firebase.initializeApp(
      name: "instragram-clone",
      options: const FirebaseOptions(
          apiKey: '<AIzaSyBP3KeTpDPXGIocY9of7TOfCX_2fImr5Do>',
          appId: '<1:723065524662:android:2fb2df1687e6317311b117>',
          messagingSenderId: '<senderId>',
          projectId: '<instagram-clone-nizetech>'));
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram_clone',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Consumer(
        builder: ((context, ref, child) {
          //takes care of loading Screen
          ref.listen<bool>(isLoadingProvider, (_, isLoading) {
            if (isLoading) {
              LoadingScreen.instance().show(context: context);
            } else {
              LoadingScreen.instance().hide();
            }
          });

          final isLoggedIn = ref.watch(isLoggedInProviders);
          print(isLoggedIn);
          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        }),
      ),
    );
  }
}
