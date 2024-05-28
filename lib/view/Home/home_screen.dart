import 'package:chat_app/view/ChatPage/chat_screen.dart';
import 'package:chat_app/view/services/auth/auth.dart';
import 'package:chat_app/widget/user_tiles.dart';
import 'package:firebase_auth_rest/firebase_auth_rest.dart';
import 'package:flutter/material.dart';

import '../services/Chat/chat_services.dart';

class HomePage extends StatelessWidget {
  final ChatServices _chatServices = ChatServices();
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _chatServices.getUserStream(),
        builder: (context, snapshot) {
          print(_authServices.getCurrentUser());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                if (users[index]['email'] != _authServices.getCurrentUser()!.email) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UserTiles(
                      text: users[index]['email'],
                      ontap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen(
                              receiverEmail: users[index]['email'],
                              receiverId: users[index]['uid'],
                            );
                          },
                        ));
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          }
        },
      ),
    );
  }
}
