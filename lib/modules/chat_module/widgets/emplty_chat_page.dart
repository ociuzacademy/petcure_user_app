import 'package:flutter/material.dart';

class EmpltyChatPage extends StatelessWidget {
  final VoidCallback onSendMessage;
  const EmpltyChatPage({super.key, required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.smart_toy, size: 40, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          const Text(
            'AI Assistant',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Ask me anything! I\'m here to help.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: onSendMessage,
            icon: const Icon(Icons.message),
            label: const Text('Start Conversation'),
          ),
        ],
      ),
    );
  }
}
