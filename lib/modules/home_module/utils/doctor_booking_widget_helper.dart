import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/models/location.dart';

class DoctorBookingWidgetHelper {
  const DoctorBookingWidgetHelper();

  void petsListInit(BuildContext context) {
    final PetsListCubit petsListCubit = context.read<PetsListCubit>();
    petsListCubit.getUserPets();
  }

  void fetchNearbyDoctorsList(
    BuildContext context,
    DoctorBookingProvider provider,
  ) {
    final Location? location = provider.validateNearbyDoctorSearch();
    if (location != null) {
      provider.showDoctors = true;
      _fetchNearbyDoctorsList(context, location);
    } else {
      debugPrint('Nearby doctors list empty');
    }
  }

  void _fetchNearbyDoctorsList(BuildContext context, Location location) {
    final NearbyDoctorsCubit nearbyDoctorsCubit = context
        .read<NearbyDoctorsCubit>();
    nearbyDoctorsCubit.getNearbyDoctorsList(location);
  }
}
