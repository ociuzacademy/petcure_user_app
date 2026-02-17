import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/prescription_details_module/service/prescription_details_service.dart';

part 'share_prescription_event.dart';
part 'share_prescription_state.dart';
part 'share_prescription_bloc.freezed.dart';

class SharePrescriptionBloc
    extends Bloc<SharePrescriptionEvent, SharePrescriptionState> {
  SharePrescriptionBloc() : super(const SharePrescriptionInitial()) {
    on<_SharePrescriptionDocument>(_onSharePrescriptionDocument);
  }

  Future<void> _onSharePrescriptionDocument(
    _SharePrescriptionDocument event,
    Emitter<SharePrescriptionState> emit,
  ) async {
    emit(const SharePrescriptionState.loading());
    try {
      // 1. Get user ID
      final String userId = await AuthStorageFunctions.getUserId();

      if (userId.isEmpty) {
        emit(const SharePrescriptionState.failure('User ID not found'));
        return;
      }

      // 2. Get prescription details
      final prescriptionDetails =
          await PrescriptionDetailsService.getPrescriptionDetails(
            prescriptionId: event.prescriptionId,
            userId: userId,
          );

      // 3. Generate and share prescription
      await PrescriptionDetailsService.generateAndSharePrescription(
        prescriptionDetails,
      );

      emit(const SharePrescriptionState.success());
    } catch (e) {
      emit(SharePrescriptionState.failure(e.toString()));
    }
  }
}
