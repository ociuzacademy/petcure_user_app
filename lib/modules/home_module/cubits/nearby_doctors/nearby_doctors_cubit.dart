import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/models/location.dart';

import 'package:petcure_user_app/modules/home_module/models/nearby_doctors_model.dart';
import 'package:petcure_user_app/modules/home_module/services/home_module_services.dart';

part 'nearby_doctors_cubit.freezed.dart';
part 'nearby_doctors_state.dart';

class NearbyDoctorsCubit extends Cubit<NearbyDoctorsState> {
  NearbyDoctorsCubit() : super(const NearbyDoctorsState.initial());

  Future<void> getNearbyDoctorsList(Location location) async {
    emit(const NearbyDoctorsState.nearbyDoctorsLoading());
    try {
      final NearbyDoctorsModel nearbyDoctors =
          await HomeModuleServices.getNearbyDoctorsList(location: location);
      emit(NearbyDoctorsState.nearbyDoctorsSuccess(nearbyDoctors));
    } catch (e) {
      emit(NearbyDoctorsState.nearbyDoctorsError(e.toString()));
    }
  }
}
