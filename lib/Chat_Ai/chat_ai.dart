import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatAi_Page extends StatefulWidget {
  const ChatAi_Page({super.key});

  @override
  State<ChatAi_Page> createState() => _ChatAi_PageState();
}

class _ChatAi_PageState extends State<ChatAi_Page> {
  ChatUser myself = ChatUser(id: '1', firstName: "user");
  ChatUser bot = ChatUser(id: '2', firstName: "AI doctor");

  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];

  final ourUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCH3SnCFd1CHTU3EFy0Z6LgX_pmYNehU9o';
  final header = {'Content-Type': 'application/json'};

  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(ourUrl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        // print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());

        allMessages.insert(0, m1);
      } else {
        print("invalid input");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI doctor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black) ,),
        backgroundColor: const Color.fromARGB(255, 153, 229, 155),
        centerTitle: true,
      ),
      body: DashChat(
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m) {
            getdata(m);
          },
          messages: allMessages),
    );
  }
}
