// appointment_history_page.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/appointment_history_module/utils/appointment_history_helper.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/appointment_history_body.dart';

class AppointmentHistoryPage extends StatefulWidget {
  const AppointmentHistoryPage({super.key});

  @override
  State<AppointmentHistoryPage> createState() => _AppointmentHistoryPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const AppointmentHistoryPage());
}

class _AppointmentHistoryPageState extends State<AppointmentHistoryPage> {
  late final AppointmentHistoryHelper _appointmentHistoryHelper;

  @override
  void initState() {
    super.initState();
    _appointmentHistoryHelper = AppointmentHistoryHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _appointmentHistoryHelper.userPetsListInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentHistoryProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Booking History')),
        body: const AppointmentHistoryBody(),
      ),
    );
  }
}
