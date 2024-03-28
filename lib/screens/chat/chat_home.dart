
import 'package:flutter/material.dart';
 class ChatHome extends   StatefulWidget {
  const ChatHome({super.key});

  @override
  _ChatHomeState createState() =>_ChatHomeState();

 }
 class _ChatHomeState extends State<ChatHome> with SingleTickerProviderStateMixin{
   late TabController _Controller;
 @override
  void initState() {
   _Controller=TabController(length: 4, vsync: this,initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //primary 075E54 sec 128c7E
      appBar: AppBar(
        title: Text("WhatsappClone"),
        actions: [
          IconButton(
            icon:Icon(Icons.search),
            onPressed:(){}
          ),
          IconButton(
              icon:Icon(Icons.more_vert),
              onPressed:(){}
          ),
        ],
        bottom: TabBar(
          controller: _Controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _Controller,
        children: [
        Text("Camera"),
        Text("Chats"),
        Text("Status"),
        Text("Calls"),
      ],

      ),
    );
  }

 }