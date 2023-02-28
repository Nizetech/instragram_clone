import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authstate = ref.watch(authStateProvider);
  return authstate.isLoading;
});
