import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/enums/message_type.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/models/message.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/formatted_text.dart';

class NutritionMessageBubble extends StatelessWidget {
  final Message message;
  final bool showAvatar;

  const NutritionMessageBubble({
    super.key,
    required this.message,
    this.showAvatar = true,
  });

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  IconData _getBotIcon() {
    switch (message.type) {
      case MessageType.breedInput:
        return Icons.pets;
      case MessageType.ageInput:
        return Icons.cake;
      case MessageType.healthInput:
        return Icons.medical_services;
      case MessageType.recommendation:
        return Icons.restaurant_menu;
      default:
        return Icons.smart_toy;
    }
  }

  Color _getBotColor() {
    switch (message.type) {
      case MessageType.breedInput:
      case MessageType.ageInput:
      case MessageType.healthInput:
        return Colors.blue;
      case MessageType.recommendation:
        return Colors.deepOrange;
      default:
        return Colors.blue;
    }
  }

  Widget _buildMessageContent(BuildContext context) {
    // Added context parameter
    if (message.type == MessageType.recommendation && !message.isUser) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange[100]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    color: Colors.deepOrange,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Nutrition Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: FormattedText(
                text: message.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: message.isUser
            ? Theme.of(context).primaryColor
            : Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: message.isUser
              ? const Radius.circular(20)
              : const Radius.circular(4),
          bottomRight: message.isUser
              ? const Radius.circular(4)
              : const Radius.circular(20),
        ),
      ),
      child: message.isUser
          ? Text(
              message.text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          : FormattedText(
              text: message.text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.4,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser && showAvatar)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _getBotColor(),
                shape: BoxShape.circle,
              ),
              child: Icon(_getBotIcon(), color: Colors.white, size: 20),
            ),
          Expanded(
            child: Align(
              alignment: message.isUser
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Column(
                  crossAxisAlignment: message.isUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    _buildMessageContent(context), // Pass context
                    const SizedBox(height: 4),
                    Text(
                      _formatTime(message.timestamp),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (message.isUser && showAvatar)
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 20),
            ),
        ],
      ),
    );
  }
}
