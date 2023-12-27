import 'package:chat_app/constant.dart';
import 'package:chat_app/widgets/custom_chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatPage extends StatefulWidget {
  static const String routeName = 'Chat-Page';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kCollectionMessage);

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs[2]['message']);

            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                centerTitle: true,
                automaticallyImplyLeading: false,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: kFontFamily,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 50,
                    ),
                    const Text('Scholar Chat'),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const ChatBubble(),
                      itemCount: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          'message': data,
                        });

                        controller.clear();
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        suffixIcon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 2,
                            color: kPrimaryColor,
                          ),
                        ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        //   borderSide: const BorderSide(
                        //     color: kPrimaryColor,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const ModalProgressHUD(
              inAsyncCall: true,
              child: Scaffold(body: SizedBox()),
            );
          }
        });
  }
}
