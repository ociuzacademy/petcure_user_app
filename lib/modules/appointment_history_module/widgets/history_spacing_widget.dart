// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';

class HistorySpacingWidget extends StatelessWidget {
  const HistorySpacingWidget({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppointmentHistoryProvider>();

    if (!provider.showHistory) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return const SliverToBoxAdapter(child: SizedBox(height: 10));
  }
}
