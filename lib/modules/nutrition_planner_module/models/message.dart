import 'package:petcure_user_app/modules/nutrition_planner_module/enums/message_type.dart';

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final MessageType type;

  Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.type = MessageType.text,
  });
}
