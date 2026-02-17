import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';
import 'package:petcure_user_app/modules/prescription_details_module/service/prescription_details_service.dart';

part 'prescription_details_state.dart';
part 'prescription_details_cubit.freezed.dart';

class PrescriptionDetailsCubit extends Cubit<PrescriptionDetailsState> {
  PrescriptionDetailsCubit() : super(const PrescriptionDetailsState.initial());

  Future<void> getPrescriptionDetails({required int prescriptionId}) async {
    emit(const PrescriptionDetailsState.loading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      if (userId.isEmpty) {
        emit(const PrescriptionDetailsState.error('User ID not found'));
        return;
      }

      final prescriptionDetails =
          await PrescriptionDetailsService.getPrescriptionDetails(
            prescriptionId: prescriptionId,
            userId: userId,
          );
      emit(PrescriptionDetailsState.loaded(prescriptionDetails));
    } catch (e) {
      emit(PrescriptionDetailsState.error(e.toString()));
    }
  }
}
