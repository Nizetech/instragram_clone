import '../components/constants/constants.dart';

enum PostSettings {
  allowLikes(
    title: Strings.allowLikesTitle,
    description: Strings.allowLikeDescription,
    storageKey: Strings.allowLikeStorageKey,
  ),
  allowComments(
    title: Strings.allowCommentsTitle,
    description: Strings.allowCommentsDescription,
    storageKey: Strings.allowCommentsStorageKey,
  );

  final String title;
  final String description;
  final String storageKey;

  const PostSettings({
    required this.title,
    required this.description,
    required this.storageKey,
  });
}
