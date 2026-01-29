import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/widgets/complaint_card.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/widgets/empty_complaints_widget.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';

class UserComplaintsWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const UserComplaintsWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplaintsCubit, ComplaintsState>(
      builder: (context, state) {
        return switch (state) {
          ComplaintsInitial() => const SizedBox.shrink(),
          ComplaintsLoading() => const ListItemLoadingWidget(itemCount: 5),
          ComplaintsLoaded(userComplaintsModel: final userComplaintsModel) =>
            Builder(
              builder: (context) {
                if (userComplaintsModel.data.isEmpty) {
                  return const EmptyComplaintsWidget();
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: userComplaintsModel.data.length,
                  itemBuilder: (context, index) {
                    final complaint = userComplaintsModel.data[index];
                    return ComplaintCard(complaint: complaint);
                  },
                );
              },
            ),
          ComplaintsError(error: final error) => CustomErrorWidget(
            onRetry: onRetry,
            errorMessage: error,
          ),
        };
      },
    );
  }
}
