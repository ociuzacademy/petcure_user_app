import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/add_pet_module/class/add_pet_details.dart';
import 'package:petcure_user_app/modules/add_pet_module/models/add_pet_response_model.dart';
import 'package:petcure_user_app/modules/add_pet_module/services/add_pet_services.dart';

part 'pet_operations_event.dart';
part 'pet_operations_state.dart';
part 'pet_operations_bloc.freezed.dart';

class PetOperationsBloc extends Bloc<PetOperationsEvent, PetOperationsState> {
  PetOperationsBloc() : super(const PetOperationsInitial()) {
    on<_AddingPet>(_onAddingPet);
  }

  Future<void> _onAddingPet(
    _AddingPet event,
    Emitter<PetOperationsState> emit,
  ) async {
    emit(const PetOperationsState.petOperationsLoading('Adding a pet...'));
    try {
      late final String userId;
      if (event.userId != null) {
        userId = event.userId!;
        debugPrint('First pet');
      } else {
        userId = await AuthStorageFunctions.getUserId();
        if (userId.isEmpty) {
          emit(
            const PetOperationsState.petOperationsError('User ID not found'),
          );
          return;
        }
        debugPrint('Not first pet');
      }

      debugPrint('User ID: $userId');

      final response = await AddPetServices.addPet(
        petDetails: event.petDetails,
        userId: userId,
      );

      emit(PetOperationsState.addPetSuccess(response));
    } catch (e) {
      emit(PetOperationsState.petOperationsError(e.toString()));
    }
  }
}
