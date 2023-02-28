import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/screens/login.dart';
import 'package:instragram_clone/state/auth/models/auth_results.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer(
        builder: ((context, ref, child) {
          final isLoggedIn =
              ref.watch(authStateProvider).result == AuthResult.success;
          print(isLoggedIn);
          if (isLoggedIn) {
            return const MainView();
          } else {
            return const Login();
          }
        }),
      ),
    );
  }
}
