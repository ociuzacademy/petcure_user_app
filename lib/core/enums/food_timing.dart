enum FoodTiming {
  before('before'),
  after('after'),
  withFood('with food');

  final String label;
  const FoodTiming(this.label);

  String toJson() => label;

  static FoodTiming fromString(String value) {
    return FoodTiming.values.firstWhere(
      (option) => option.label == value,
      orElse: () => throw ArgumentError('Unknown FoodTiming value: $value'),
    );
  }
}
