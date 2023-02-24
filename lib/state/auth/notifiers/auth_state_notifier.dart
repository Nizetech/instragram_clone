import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/state/auth/backend/authenticatior.dart';
import 'package:instragram_clone/state/auth/models/auth_results.dart';

import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = Authenticator();

  AuthStateNotifier() : super(AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        isLoading: false,
        result: AuthResult.success,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
  }
}
