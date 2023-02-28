import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instragram_clone/state/auth/backend/authenticatior.dart';
import 'package:instragram_clone/state/auth/models/auth_results.dart';
import 'package:instragram_clone/state/user_info/models/backend/user_info_storage.dart';

import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = Authenticator();
  final _userInforStorage = const UserInfoStorage();

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
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }

    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  // Future<void> loginWithFacebook() async {
  //   state = state.copiedWithIsLoading(true);
  // final result = await _authenticator.logInWIthFacebook();
  //   final userId = _authenticator.userId;
  //   if (result == AuthResult.success && userId != null) {
  //     await saveUserInfo(userId: userId);
  //   }

  //   state = AuthState(
  //     result: result,
  //     isLoading: false,
  //     userId: userId,
  //   );
  // }

  Future<void> saveUserInfo({required String userId}) =>
      _userInforStorage.saveUserInfo(
        userId: userId,
        displayName: _authenticator.displayName,
        email: _authenticator.email,
      );
}
