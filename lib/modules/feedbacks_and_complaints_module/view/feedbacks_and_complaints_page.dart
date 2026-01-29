import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/helpers/feedbacks_and_complaints_helper.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/widgets/user_complaints_widget.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/widgets/user_feedbacks_widget.dart';

class FeedbacksAndComplaintsPage extends StatefulWidget {
  const FeedbacksAndComplaintsPage({super.key});

  @override
  State<FeedbacksAndComplaintsPage> createState() =>
      _FeedbacksAndComplaintsPageState();

  static route() => MaterialPageRoute(
    builder: (context) => const FeedbacksAndComplaintsPage(),
  );
}

class _FeedbacksAndComplaintsPageState
    extends State<FeedbacksAndComplaintsPage> {
  late final FeedbacksAndComplaintsHelper _helper;
  @override
  void initState() {
    super.initState();
    _helper = FeedbacksAndComplaintsHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _helper.getUserFeedbacks();
      _helper.getUserComplaints();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Feedbacks and Complaints'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Feedbacks'),
              Tab(text: 'Complaints'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UserFeedbacksWidget(onRetry: _helper.getUserFeedbacks),
            UserComplaintsWidget(onRetry: _helper.getUserComplaints),
          ],
        ),
      ),
    );
  }
}
