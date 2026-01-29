import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/widgets/empty_feedbacks_widget.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/widgets/feedback_card.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';

class UserFeedbacksWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const UserFeedbacksWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbacksCubit, FeedbacksState>(
      builder: (context, state) {
        return switch (state) {
          FeedbacksInitial() => const SizedBox.shrink(),
          FeedbacksLoading() => const ListItemLoadingWidget(itemCount: 5),
          FeedbacksLoaded(userFeedbacksModel: final userFeedbacksModel) =>
            Builder(
              builder: (context) {
                if (userFeedbacksModel.data.isEmpty) {
                  return const EmptyFeedbacksWidget();
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: userFeedbacksModel.data.length,
                  itemBuilder: (context, index) {
                    final feedback = userFeedbacksModel.data[index];
                    return FeedbackCard(feedback: feedback);
                  },
                );
              },
            ),
          FeedbacksError(error: final error) => CustomErrorWidget(
            onRetry: onRetry,
            errorMessage: error,
          ),
        };
      },
    );
  }
}
