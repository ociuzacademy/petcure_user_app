import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/next_vaccine_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/services/appointment_booking_services.dart';

part 'next_vaccine_state.dart';
part 'next_vaccine_cubit.freezed.dart';

class NextVaccineCubit extends Cubit<NextVaccineState> {
  NextVaccineCubit() : super(const NextVaccineState.initial());

  Future<void> fetchNextVaccine(int petId) async {
    emit(const NextVaccineState.loading());
    try {
      final nextVaccine = await AppointmentBookingServices.getPetNextVaccine(
        petId: petId,
      );
      emit(NextVaccineState.success(nextVaccine));
    } catch (e) {
      emit(NextVaccineState.error(e.toString()));
    }
  }

  void resetState() {
    emit(const NextVaccineState.initial());
  }
}
