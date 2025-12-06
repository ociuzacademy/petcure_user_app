class NutritionPlannerData {
  final String breed;
  final int age;
  final String health;

  const NutritionPlannerData({
    required this.breed,
    required this.age,
    required this.health,
  });

  Map<String, dynamic> toJson() {
    return {'breed': breed, 'age': age, 'health': health};
  }

  factory NutritionPlannerData.fromJson(Map<String, dynamic> json) {
    return NutritionPlannerData(
      breed: json['breed'],
      age: json['age'],
      health: json['health'],
    );
  }
}
