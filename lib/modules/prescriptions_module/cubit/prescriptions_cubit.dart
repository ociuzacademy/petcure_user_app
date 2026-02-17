import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/prescriptions_module/model/prescription_list_model.dart';
import 'package:petcure_user_app/modules/prescriptions_module/service/prescriptions_service.dart';

part 'prescriptions_state.dart';
part 'prescriptions_cubit.freezed.dart';

class PrescriptionsCubit extends Cubit<PrescriptionsState> {
  PrescriptionsCubit() : super(const PrescriptionsState.initial());

  Future<void> getPrescriptions() async {
    emit(const PrescriptionsState.loading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      if (userId.isEmpty) {
        emit(const PrescriptionsState.error('User ID not found'));
        return;
      }

      final prescriptions = await PrescriptionsService.getPrescriptions(
        userId: userId,
      );
      emit(PrescriptionsState.loaded(prescriptions));
    } catch (e) {
      emit(PrescriptionsState.error(e.toString()));
    }
  }
}
