import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/slots_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/services/appointment_booking_services.dart';

part 'slots_state.dart';
part 'slots_cubit.freezed.dart';

class SlotsCubit extends Cubit<SlotsState> {
  SlotsCubit() : super(const SlotsState.initial());

  Future<void> getSlots({required int doctorId, required DateTime date}) async {
    emit(const SlotsState.loading());
    try {
      final SlotsModel slots = await AppointmentBookingServices.getSlotsList(
        doctorId: doctorId,
        date: date,
      );
      emit(SlotsState.success(slots));
    } catch (e) {
      emit(SlotsState.error(e.toString()));
    }
  }
}
