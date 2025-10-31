import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/register_module/class/user_register_details.dart';
import 'package:petcure_user_app/modules/register_module/models/user_register_model.dart';
import 'package:petcure_user_app/modules/register_module/services/register_user_service.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<UserRegistering>(_onUserRegister);
  }

  Future<void> _onUserRegister(
    UserRegistering event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState.registerLoading());
    try {
      final UserRegisterModel response = await RegisterUserService.registerUser(
        userRegisterDetails: event.userRegisterDetails,
      );

      debugPrint('User ID: ${response.data.id}');

      emit(RegisterState.userRegisterSuccess(response));
    } catch (e) {
      emit(RegisterState.registerError(e.toString()));
    }
  }
}
