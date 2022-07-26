import 'package:timelineapp/pages/create_conversation.dart';
import 'package:flutter/material.dart';
import 'package:timelineapp/pages/chat.dart';
import 'package:timelineapp/services/firestore_service.dart';
import 'package:timelineapp/models/conversation.dart';
import 'package:firestore_search/firestore_search.dart';

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({Key? key}) : super(key: key);

  @override
  State<ConversationsPage> createState() => _ConversationsState();
}

class _ConversationsState extends State<ConversationsPage> {
  final FirestoreService _fs = FirestoreService();
  @override
  void initState() {
    super.initState();
    _fs.setUserConvoserations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversations"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateConversationsPage()));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: StreamBuilder<List<Conversation>>(
          stream: _fs.userConvos,
          builder: (BuildContext context,
              AsyncSnapshot<List<Conversation>> snapshot) {
            if (snapshot.hasData) {
              List<Conversation> convos = snapshot.data!;
              return convos.isEmpty
                  ? Text(_fs.getUserId())
                  : ListView.builder(
                      itemCount: convos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(convoName(convos[index])),
                          onTap: () => convoLocation(convos[index]),
                        );
                      });
            } else {
              return const Center(child: Text("Are No Conversations"));
            }
          }),
    );
  }

  String convoName(Conversation convo) {
    var convoname = "";

    for (var user in convo.users) {
      if (user != _fs.getUserId()) {
        if (convoname.isEmpty) {
          convoname = FirestoreService.userMap[user]!.name.toUpperCase();
        } else {
          convoname +=
              ", ${FirestoreService.userMap[user]!.name.toUpperCase()}";
        }
      }
    }
    return convoname;
  }

  void convoLocation(Conversation convo) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ChatPage(conversation: convo, name: convoName(convo))));
  }
}
