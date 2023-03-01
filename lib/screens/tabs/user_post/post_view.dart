import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/screens/components/animations/error_anim.dart';
import 'package:instragram_clone/screens/components/animations/loading_animation.dart';
import 'package:instragram_clone/screens/components/animations/post/post_grid_view.dart';

import '../../../state/providers/user_post_provider.dart';
import '../../components/animations/empty_with_text_anim.dart';
import '../../components/constants/constants.dart';

class UserPOstsView extends ConsumerWidget {
  const UserPOstsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(userPostsProvider);
        return Future.delayed(Duration(seconds: 1));
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return EmptyContentsWithTextAnimation(text: Strings.youHaveNoPosts);
          } else {
            return PostGridView(posts: posts);
          }
        },
        error: ((error, stackTrace) => ErrorAnimation()),
        loading: () => LoadingAnimation(),
      ),
    );
  }
}
