import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wa_screen/message_object.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController = TextEditingController();
  var list = <MessageObject>[];
  // var timeFormat = DateFormat("hh-mm");
  var person_message = "";
  var p_type = 1;
  var time = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade900,
        title: const Text(
          "Chat Screen",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                var message = list[index];
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding: const EdgeInsets.all(10),
                      color:
                          message.personType == 1 ? Colors.teal : Colors.amber,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/image.jpeg"),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message.personType == 1
                                        ? "Person1"
                                        : "Person2",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    message.message ?? "",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            message.time ?? "",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal.shade900,
                    ),
                    onPressed: () {
                      if (textEditingController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter the Message");
                      } else {
                        person_message = textEditingController.text.toString();
                        p_type = 1;

                        list.add(MessageObject(
                            message: person_message,
                            personType: p_type,
                            time: time));
                        textEditingController.clear();
                      }
                      setState(() {});
                    },
                    child: const Text(
                      "Person1",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal.shade900,
                    ),
                    onPressed: () {
                      if (textEditingController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter the Message");
                      } else {
                        person_message = textEditingController.text.toString();
                        p_type = 2;
                        list.add(MessageObject(
                            message: person_message,
                            personType: p_type,
                            time: time));
                        textEditingController.clear();
                      }
                      setState(() {});
                    },
                    child: const Text(
                      "Person2",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
