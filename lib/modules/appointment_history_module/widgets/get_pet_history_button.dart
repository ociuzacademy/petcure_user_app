import 'package:flutter/material.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class GetPetHistoryButton extends StatelessWidget {
  final VoidCallback onFetchingPetAppointmentHistory;
  const GetPetHistoryButton({
    super.key,
    required this.onFetchingPetAppointmentHistory,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            try {
              onFetchingPetAppointmentHistory();
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
