part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.authLoading() = AuthLoading;
  const factory AuthState.loginSuccess(LoginModel response) = LoginSuccess;
  const factory AuthState.logoutSuccess() = LogoutSuccess;
  const factory AuthState.authError(String errorMessage) = AuthError;
}
