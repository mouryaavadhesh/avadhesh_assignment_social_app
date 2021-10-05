import 'package:avadhesh_assignment/notifire/chat_detail_notifier.dart';
import 'package:avadhesh_assignment/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late ChatDetailNotifier _chatDetailNotifier;

  @override
  void initState() {
    super.initState();
    _chatDetailNotifier = ChatDetailNotifier(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background_colour,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: new AssetImage("assets/user.png"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Avadhesh Mourya",
                        style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ThemeColor.text_colour,
                                fontSize: 14)),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ThemeColor.gradient4,
                                fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ChangeNotifierProvider(
          create: (context) => _chatDetailNotifier,
          child: Stack(
            children: <Widget>[
              Consumer<ChatDetailNotifier>(builder: (context, cart, child) {
                return ListView.builder(
                  controller: _chatDetailNotifier.scrollController,
                  itemCount: _chatDetailNotifier.messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 60),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment:
                            (_chatDetailNotifier.messages[index].messageType ==
                                    "receiver"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                        child: Container(
                          margin:
                              _chatDetailNotifier.messages[index].messageType ==
                                      "receiver"
                                  ? EdgeInsets.only(right: 80)
                                  : EdgeInsets.only(left: 80),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (_chatDetailNotifier
                                        .messages[index].messageType ==
                                    "receiver"
                                ? Colors.white
                                : ThemeColor.chatBg),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            _chatDetailNotifier.messages[index].messageContent,
                            style: GoogleFonts.prompt(
                                textStyle: TextStyle(
                                    color: ThemeColor.text_colour,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 5, top: 5,right: 10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ThemeColor.theme_colour,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          maxLength: 100,
                          obscureText: false,
                          onSubmitted: (value) {
                            _chatDetailNotifier.handleSendMessage();
                          },
                          textInputAction: TextInputAction.send,
                          textAlign: TextAlign.start,
                          controller: _chatDetailNotifier.chatMessageController,
                          decoration: InputDecoration(
                              counterText: '',
                              hintText: "Write message...",
                              labelStyle: GoogleFonts.prompt(
                                  textStyle: TextStyle(
                                      color: ThemeColor.text_colour,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          _chatDetailNotifier.handleSendMessage();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: ThemeColor.theme_colour,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
