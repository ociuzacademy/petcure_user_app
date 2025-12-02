import 'package:flutter/material.dart';

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

  // Actions
  Future<bool> submitFeedback(BuildContext context, int bookingId) async {
    // Simulate API call
    // In a real app, you would call a repository here
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> submitComplaint(BuildContext context, int bookingId) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return true;
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
