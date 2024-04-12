import 'package:flutter/material.dart';
import 'package:flutter_test_app/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_test_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  final chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'Hello, How are you?', fromWho: FromWho.mine),
    Message(
        text: 'Fine thanks, and you?',
        fromWho: FromWho.hers,
        imageUrl:
            'https://yesno.wtf/assets/yes/11-a23cbde4ae018bbda812d2d8b2b8fc6c.gif'),
    Message(text: "I'm well too\nWhere are you from?", fromWho: FromWho.mine),
    Message(text: "I'm from England, and you?", fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messages.add(newMessage);
    if (text.endsWith('?')) herReply();

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
