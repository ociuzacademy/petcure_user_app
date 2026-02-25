import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/chat_module/bloc/chat_bloc.dart';
import 'package:petcure_user_app/modules/chat_module/model/chat_response_model.dart';
import 'package:petcure_user_app/modules/chat_module/model/message.dart';
import 'package:petcure_user_app/modules/chat_module/widgets/chat_bubble.dart';
import 'package:petcure_user_app/modules/chat_module/widgets/chat_input.dart';
import 'package:petcure_user_app/modules/chat_module/widgets/emplty_chat_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const ChatPage());
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final ValueNotifier<List<Message>> _messagesNotifier;

  @override
  void initState() {
    super.initState();
    _messagesNotifier = ValueNotifier<List<Message>>([]);
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
    _messagesNotifier.value = [
      ..._messagesNotifier.value,
      Message(text: text, isUser: true, timestamp: DateTime.now()),
    ];

    _textController.clear();
    _scrollToBottom();

    // Dispatch BLoC event
    context.read<ChatBloc>().add(ChatEvent.sendingMessage(message: text));
  }

  void _handleNewResponse(ChatResponseModel response) {
    _messagesNotifier.value = [
      ..._messagesNotifier.value,
      Message(text: response.reply, isUser: false, timestamp: DateTime.now()),
    ];
    _scrollToBottom();
  }

  void _handleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder<List<Message>>(
                  valueListenable: _messagesNotifier,
                  builder: (context, messages, _) {
                    if (messages.isEmpty) {
                      return EmpltyChatPage(
                        onSendMessage: () {
                          _textController.text = 'Hello! How can you help me?';
                          _sendMessage();
                        },
                      );
                    }
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(message: messages[index]);
                      },
                    );
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
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _messagesNotifier.dispose();
    super.dispose();
  }
}
