import 'package:flutter/material.dart';
import 'chat_model.dart';
import 'chat_service.dart';

class ChatProvider with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  final ChatService _chatService = ChatService();
  bool _isLoading = false;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  void sendMessage(String text) async {
    _messages.add(ChatMessage(text: text, isUser: true));
    _isLoading = true;
    notifyListeners();

    try {
      final reply = await _chatService.sendMessage(text);
      _messages.add(ChatMessage(text: reply, isUser: false));
    } catch (e) {
      _messages.add(ChatMessage(text: 'Error: ${e.toString()}', isUser: false));
    }

    _isLoading = false;
    notifyListeners();
  }
}
