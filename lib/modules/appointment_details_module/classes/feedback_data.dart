class FeedbackData {
  final int appointment;
  final int rating;
  final String feedback;

  const FeedbackData({
    required this.appointment,
    required this.rating,
    required this.feedback,
  });

  Map<String, dynamic> toJson() {
    return {'appointment': appointment, 'rating': rating, 'feedback': feedback};
  }

  factory FeedbackData.fromJson(Map<String, dynamic> json) {
    return FeedbackData(
      appointment: json['appointment'],
      rating: json['rating'],
      feedback: json['feedback'],
    );
  }
}
