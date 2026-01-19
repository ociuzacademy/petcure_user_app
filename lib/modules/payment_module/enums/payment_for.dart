// ignore_for_file: public_member_api_docs, sort_constructors_first

enum PaymentFor {
  appointment('appointment'),
  order('order');

  final String label;
  const PaymentFor(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static PaymentFor fromLabel(String label) =>
      PaymentFor.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static PaymentFor? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return PaymentFor.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static PaymentFor fromJson(String? value) =>
      tryFromLabel(value) ?? PaymentFor.appointment;
}
