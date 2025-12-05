import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

class ChatHelper {
  final BuildContext context;
  final TextEditingController textController;

  ChatHelper({required this.context, required this.textController});

  void sendMessage() {
    final String message = textController.text.trim();
    if (message.isEmpty) return;

    final ChatBloc chatBloc = context.read<ChatBloc>();
    chatBloc.add(ChatEvent.sendingMessage(message: message));
  }
}
