class ComplaintData {
  final int appointment;
  final String category;
  final String description;

  const ComplaintData({
    required this.appointment,
    required this.category,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'appointment': appointment,
      'category': category,
      'description': description,
    };
  }

  factory ComplaintData.fromJson(Map<String, dynamic> json) {
    return ComplaintData(
      appointment: json['appointment'],
      category: json['category'],
      description: json['description'],
    );
  }
}
