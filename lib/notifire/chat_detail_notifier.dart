import 'package:avadhesh_assignment/models/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailNotifier extends ChangeNotifier {
  BuildContext context;
  ScrollController scrollController=ScrollController();
  TextEditingController chatMessageController = TextEditingController();
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Avadhesh", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Ram, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  ChatDetailNotifier(this.context);

  void handleSendMessage() {
    if(chatMessageController.text.isNotEmpty) {
      if (messages.length % 2 == 0)
        messages.add(ChatMessage(
            messageContent: chatMessageController.text, messageType: "receiver"));
      else
        messages.add(ChatMessage(
            messageContent: chatMessageController.text, messageType: "sender"),);


      scrollController.jumpTo(messages.length * 55);
      print(messages.length);
      chatMessageController.text = '';
      notifyListeners();
    }
  }

  @override
  void dispose() {
    chatMessageController.removeListener(() {
      chatMessageController.dispose();
    });

    this.removeListener(() {
      super.dispose();
    });
  }
}
