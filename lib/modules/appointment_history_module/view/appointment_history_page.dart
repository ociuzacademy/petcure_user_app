// appointment_history_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/appointment_history_module/utils/appointment_history_helper.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/appointment_history_body.dart';

class AppointmentHistoryPage extends StatefulWidget {
  const AppointmentHistoryPage({super.key});

  @override
  State<AppointmentHistoryPage> createState() => _AppointmentHistoryPageState();

  static route() =>
      MaterialPageRoute(builder: (context) => const AppointmentHistoryPage());
}

class _AppointmentHistoryPageState extends State<AppointmentHistoryPage> {
  late final AppointmentHistoryHelper _appointmentHistoryHelper;

  @override
  void initState() {
    super.initState();
    _appointmentHistoryHelper = AppointmentHistoryHelper(context: context);
    _appointmentHistoryHelper.userPetsListInit();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentHistoryProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Booking History')),
        body: BlocListener<PetsListCubit, PetsListState>(
          listener: (context, state) {
            final provider = context.read<AppointmentHistoryProvider>();

            switch (state) {
              case UserPetsSuccess(:final userPets):
                provider.setPetsFromApi(userPets);
                break;
              default:
            }
          },
          child: const AppointmentHistoryBody(),
        ),
      ),
    );
  }
}
