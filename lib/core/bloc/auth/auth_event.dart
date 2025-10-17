part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.userLoggingIn(String email, String password) =
      UserLoggingIn;
  const factory AuthEvent.userLoggingOut() = UserLoggingOut;
}
