import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/chat_module/model/chat_response_model.dart';
import 'package:petcure_user_app/modules/chat_module/services/chat_services.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatInitial()) {
    on<_Started>(_onStarted);
    on<_SendingMessage>(_onSendingMessage);
  }

  void _onStarted(_Started event, Emitter<ChatState> emit) {
    // Initialize chat - currently just keeps initial state
    emit(const ChatState.initial());
  }

  Future<void> _onSendingMessage(
    _SendingMessage event,
    Emitter<ChatState> emit,
  ) async {
    emit(const ChatState.loading());

    try {
      final response = await ChatServices.sendMessage(message: event.message);
      emit(ChatState.chatMessageReceived(data: response));
    } catch (e) {
      emit(ChatState.error(message: e.toString()));
    }
  }
}
