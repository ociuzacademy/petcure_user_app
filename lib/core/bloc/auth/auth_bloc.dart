import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/login_module/models/login_model.dart';
import 'package:petcure_user_app/modules/login_module/services/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<UserLoggingIn>(_onLogIn);
    on<UserLoggingOut>(_onLogOut);
  }

  Future<void> _onLogIn(UserLoggingIn event, Emitter<AuthState> emit) async {
    emit(AuthState.authLoading());
    try {
      final LoginModel response = await userLogin(
        email: event.email,
        password: event.password,
      );

      await AuthStorageFunctions.login(response.userId);

      emit(AuthState.loginSuccess(response));
    } catch (e) {
      emit(AuthState.authError(e.toString()));
    }
  }

  Future<void> _onLogOut(UserLoggingOut event, Emitter<AuthState> emit) async {
    emit(AuthState.authLoading());
    try {
      await Future.delayed(Duration(seconds: 2));

      await AuthStorageFunctions.logout();

      emit(AuthState.logoutSuccess());
    } catch (e) {
      emit(AuthState.authError(e.toString()));
    }
  }
}
