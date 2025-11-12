import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/login_module/models/login_model.dart';
import 'package:petcure_user_app/modules/login_module/services/login_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<UserLoggingIn>(_onLogIn);
    on<UserLoggingOut>(_onLogOut);
  }

  Future<void> _onLogIn(UserLoggingIn event, Emitter<AuthState> emit) async {
    emit(const AuthState.authLoading());
    try {
      final LoginModel response = await LoginServices.userLogin(
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
    emit(const AuthState.authLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));

      await AuthStorageFunctions.logout();

      emit(const AuthState.logoutSuccess());
    } catch (e) {
      emit(AuthState.authError(e.toString()));
    }
  }
}
