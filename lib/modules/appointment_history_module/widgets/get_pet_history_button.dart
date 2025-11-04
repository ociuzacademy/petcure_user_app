import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class GetPetHistoryButton extends StatelessWidget {
  const GetPetHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AppointmentHistoryProvider>();

    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            try {
              provider.getChildVaccineHistory();
            } catch (e) {
              CustomSnackBar.showError(context, message: e.toString());
            }
          },
          child: const Text('Get History'),
        ),
      ),
    );
  }
}
