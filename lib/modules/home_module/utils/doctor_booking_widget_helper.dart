import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/models/location.dart';

class DoctorBookingWidgetHelper {
  const DoctorBookingWidgetHelper();

  void petsListInit(BuildContext context) {
    final PetsListCubit petsListCubit = context.read<PetsListCubit>();
    petsListCubit.getUserPets();
  }

  void fetchNearbyDoctorsList(BuildContext context, Location location) {
    final NearbyDoctorsCubit nearbyDoctorsCubit = context
        .read<NearbyDoctorsCubit>();
    nearbyDoctorsCubit.getNearbyDoctorsList(location);
  }
}
