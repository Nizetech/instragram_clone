import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';

final userIdProvider = Provider<String?>(
  (ref) => ref.watch(authStateProvider).userId,
);
