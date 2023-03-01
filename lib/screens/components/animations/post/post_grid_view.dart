import 'package:flutter/material.dart';
import 'package:instragram_clone/screens/components/animations/post/post_thumnail_view.dart';

import '../../../../state/posts/models/post.dart';

class PostGridView extends StatelessWidget {
  final List<Post> posts;
  const PostGridView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return PostThumbnailView(
            post: post,
            onTapped: () {
              //todo navigate to post detail view
            });
      },
    );
  }
}
