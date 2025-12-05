import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/chat_module/bloc/chat_bloc.dart';
import 'package:petcure_user_app/modules/chat_module/model/chat_response_model.dart';
import 'package:petcure_user_app/modules/chat_module/model/message.dart';
import 'package:petcure_user_app/modules/chat_module/widgets/chat_bubble.dart';
import 'package:petcure_user_app/modules/chat_module/widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  static route() => MaterialPageRoute(builder: (context) => const ChatPage());
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatEvent.started());
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    // Add user message optimistically
    setState(() {
      _messages.add(
        Message(text: text, isUser: true, timestamp: DateTime.now()),
      );
    });

    _textController.clear();
    _scrollToBottom();

    // Dispatch BLoC event
    context.read<ChatBloc>().add(ChatEvent.sendingMessage(message: text));
  }

  void _handleNewResponse(ChatResponseModel response) {
    setState(() {
      _messages.add(
        Message(text: response.reply, isUser: false, timestamp: DateTime.now()),
      );
    });
    _scrollToBottom();
  }

  void _handleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  Widget _buildEmptyState() {
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
            onPressed: () {
              _textController.text = 'Hello! How can you help me?';
              _sendMessage();
            },
            icon: const Icon(Icons.message),
            label: const Text('Start Conversation'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
          chatMessageReceived: _handleNewResponse,
          error: _handleError,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AI Assistant'),
          centerTitle: true,
          actions: [
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(message: _messages[index]);
                      },
                    ),
            ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ChatInput(
                  controller: _textController,
                  onSend: _sendMessage,
                  isLoading: state is ChatLoading,
                  enabled: state is! ChatLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
