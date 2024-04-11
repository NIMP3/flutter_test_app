import 'package:flutter/material.dart';
import 'package:flutter_test_app/presentation/widgets/chat/her_message_buble.dart';
import 'package:flutter_test_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_test_app/presentation/widgets/shared/message_field_box.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
