import 'package:flutter/material.dart';
import 'package:flutter_test_app/domain/entities/message.dart';
import 'package:flutter_test_app/presentation/providers/chat_provider.dart';
import 'package:flutter_test_app/presentation/widgets/chat/her_message_buble.dart';
import 'package:flutter_test_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_test_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://64.media.tumblr.com/avatar_0325a5b8e7fe_128.pnj'),
          ),
        ),
        title: const Text('Astrid Berges 😊'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(
                        text: message.text, imageUrl: message.imageUrl)
                    : MyMessageBubble(text: message.text);
              },
            )),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
