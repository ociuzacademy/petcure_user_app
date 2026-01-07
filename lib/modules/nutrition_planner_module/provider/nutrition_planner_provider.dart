import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/input_type.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/message_type.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/models/message.dart';

class NutritionPlannerProvider extends ChangeNotifier {
  final List<Message> _messages = [];
  String? _currentBreed;
  int? _currentAge;
  String? _currentHealth;
  InputType _currentInputType = InputType.breed;

  List<Message> get messages => List.unmodifiable(_messages);
  String? get currentBreed => _currentBreed;
  int? get currentAge => _currentAge;
  String? get currentHealth => _currentHealth;
  InputType get currentInputType => _currentInputType;

  void addBotMessage(String text, {MessageType type = MessageType.text}) {
    _messages.add(
      Message(text: text, isUser: false, timestamp: DateTime.now(), type: type),
    );
    notifyListeners();
  }

  void addUserMessage(String text, {MessageType type = MessageType.text}) {
    _messages.add(
      Message(text: text, isUser: true, timestamp: DateTime.now(), type: type),
    );
    notifyListeners();
  }

  void setInputType(InputType type) {
    _currentInputType = type;
    notifyListeners();
  }

  void setBreed(String breed) {
    _currentBreed = breed;
    notifyListeners();
  }

  void setAge(int age) {
    _currentAge = age;
    notifyListeners();
  }

  void setHealth(String health) {
    _currentHealth = health;
    notifyListeners();
  }

  void resetConversation() {
    _messages.clear();
    _currentBreed = null;
    _currentAge = null;
    _currentHealth = null;
    _currentInputType = InputType.breed;
    notifyListeners();
  }
}
