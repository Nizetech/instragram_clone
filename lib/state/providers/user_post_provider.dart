import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/state/auth/providers/user_is_providers.dart';
import 'package:instragram_clone/state/posts/models/post.dart';

final userPostsProvider = StreamProvider.autoDispose<List<Post>>((ref) {
  final userId = ref.watch(userIdProvider);

  final controller = StreamController<List<Post>>();

  controller.onListen = () => controller.sink.add([]);

  final sub = FirebaseFirestore.instance
      .collection('posts')
      .where('userId', isEqualTo: userId)
      .snapshots()
      .listen((snapshot) {
    final posts = snapshot.docs
        .where((doc) => !doc.metadata.hasPendingWrites)
        .map((doc) => Post(postId: doc.id, json: doc.data()))
        .toList();
    controller.sink.add(posts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
