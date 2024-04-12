import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final texController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10));
    final inputDecoration = InputDecoration(
        hintText: 'Write your message',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = texController.value.text;
              texController.clear();
              onValue(textValue);
            },
            icon: const Icon(Icons.send)));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: texController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          texController.clear();
          focusNode.requestFocus();
          onValue(value);
        },
        onChanged: (value) {
          print('Changed value: $value');
        },
      ),
    );
  }
}
