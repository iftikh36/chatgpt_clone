import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _message = [];

  void _sendMessage() {
    ChatMessage _message = ChatMessage(text: _controller.text, sender: "user");
    setState(() {
      _message.insert(0, _message);
    });

    _controller.clear();
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted:  (value) => _sendMessage(),
            decoration: InputDecoration.collapsed(hintText: "Send a message"),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: ()  => _sendMessage() ,
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ChatGPT Clone")),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _message.length,
                itemBuilder: (context, index) {
                  return _message[index];
                },
              )),
              Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                ),
                child: _buildTextComposer(),
              )
            ],
          ),
        ));
  }
}
