import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/appointment_details_module/classes/complaint_data.dart';
import 'package:petcure_user_app/modules/appointment_details_module/classes/feedback_data.dart';

class FeedbackComplaintProvider extends ChangeNotifier {
  final int bookingId;
  // Feedback State
  int _rating = 0;
  int get rating => _rating;

  final TextEditingController feedbackController = TextEditingController();

  // Complaint State
  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  final TextEditingController complaintController = TextEditingController();

  final List<String> categories = [
    'Doctor Behavior',
    'Long Wait Time',
    'Incorrect Diagnosis',
    'Facility Cleanliness',
    'Staff Behavior',
    'Billing Issues',
    'Other',
  ];

  FeedbackComplaintProvider({required this.bookingId});

  // Setters
  void setRating(int value) {
    _rating = value;
    notifyListeners();
  }

  void setCategory(String? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  ComplaintData? getComplaintData() {
    if (_selectedCategory == null) {
      return null;
    }

    if (complaintController.text.trim().isEmpty) {
      return null;
    }

    return ComplaintData(
      appointment: bookingId,
      category: _selectedCategory!,
      description: complaintController.text.trim(),
    );
  }

  FeedbackData? getFeedbackData() {
    if (_rating == 0) {
      return null;
    }

    if (feedbackController.text.trim().isEmpty) {
      return null;
    }

    return FeedbackData(
      appointment: bookingId,
      rating: _rating,
      feedback: feedbackController.text.trim(),
    );
  }

  void clearFeedback() {
    _rating = 0;
    feedbackController.clear();
    notifyListeners();
  }

  void clearComplaint() {
    _selectedCategory = null;
    complaintController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    feedbackController.dispose();
    complaintController.dispose();
    super.dispose();
  }
}
