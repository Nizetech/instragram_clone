import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/state/auth/models/auth_results.dart';
import 'package:instragram_clone/state/auth/models/auth_state.dart';
import 'package:instragram_clone/state/auth/providers/auth_state_providers.dart';

final isLoggedInProviders = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);
    return authState.result == AuthResult.success;
  },
);
