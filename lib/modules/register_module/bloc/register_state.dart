part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.registerLoading() = RegisterLoading;
  const factory RegisterState.registerError(String errorMessage) =
      RegisterError;
  const factory RegisterState.userRegisterSuccess(UserRegisterModel response) =
      UserRegisterSuccess;
}
