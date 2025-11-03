// doctor_booking_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petcure_user_app/modules/home_module/cubits/cubit/pets_list_cubit.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:petcure_user_app/modules/home_module/utils/doctor_booking_widget_helper.dart';
import 'package:petcure_user_app/modules/home_module/widgets/doctors_list_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/find_doctors_button.dart';
import 'package:petcure_user_app/modules/home_module/widgets/location_input_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pet_selection_widget.dart';

class DoctorBookingWidget extends StatefulWidget {
  const DoctorBookingWidget({super.key});

  @override
  State<DoctorBookingWidget> createState() => _DoctorBookingWidgetState();
}

class _DoctorBookingWidgetState extends State<DoctorBookingWidget> {
  late final DoctorBookingWidgetHelper _doctorBookingWidgetHelper;

  @override
  void initState() {
    super.initState();
    _doctorBookingWidgetHelper = DoctorBookingWidgetHelper(context: context);
    _doctorBookingWidgetHelper.petsListInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetsListCubit, PetsListState>(
      listener: (context, state) {
        final provider = context.read<DoctorBookingProvider>();

        switch (state) {
          case UserPetsSuccess(:final userPets):
            provider.setPetsFromApi(userPets);
            break;
          default:
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: const Text(
                'Select Pet:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 8)),
            PetSelectionWidget(),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            LocationInputWidget(),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            FindDoctorsButton(),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            DoctorsListWidget(),
          ],
        ),
      ),
    );
  }
}
