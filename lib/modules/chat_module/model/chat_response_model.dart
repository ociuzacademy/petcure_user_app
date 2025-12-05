// To parse this JSON data, do
//
//     final chatResponseModel = chatResponseModelFromJson(jsonString);

import 'dart:convert';

ChatResponseModel chatResponseModelFromJson(String str) =>
    ChatResponseModel.fromJson(json.decode(str));

String chatResponseModelToJson(ChatResponseModel data) =>
    json.encode(data.toJson());

class ChatResponseModel {
  final String reply;

  const ChatResponseModel({required this.reply});

  ChatResponseModel copyWith({String? reply}) =>
      ChatResponseModel(reply: reply ?? this.reply);

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      ChatResponseModel(reply: json['reply']);

  Map<String, dynamic> toJson() => {'reply': reply};
}
