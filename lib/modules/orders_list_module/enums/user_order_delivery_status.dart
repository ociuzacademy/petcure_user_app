enum UserOrderDeliveryStatus {
  pending('pending'),
  orderPlaced('order placed'),
  orderOnTheWay('order on the way'),
  orderDelivered('order delivered'),
  orderCancelled('order cancelled');

  final String value;
  const UserOrderDeliveryStatus(this.value);

  // Helper method to get enum from string
  static UserOrderDeliveryStatus fromString(String status) {
    return UserOrderDeliveryStatus.values.firstWhere(
      (e) => e.value == status,
      orElse: () => UserOrderDeliveryStatus.pending,
    );
  }

  // Convert to string for APIs
  String toJson() => value;
}
