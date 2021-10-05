import 'package:avadhesh_assignment/data/data.dart';
import 'package:avadhesh_assignment/ui/chatCard.dart';
import 'package:avadhesh_assignment/ui/chat_detail_page.dart';
import 'package:avadhesh_assignment/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.background_colour,
        body: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: _media.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                        ThemeColor.gradient3,
                        ThemeColor.gradient4
                      ])),
                ),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: ThemeColor.text_colour,
                              ),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Conversation",
                              style: GoogleFonts.headlandOne(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: ThemeColor.text_colour,
                                      fontSize: 25)),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          )),
                      child: Row(
                        children: [
                          Container(
                            decoration: ShapeDecoration(
                              shape: const StadiumBorder(),
                              gradient: LinearGradient(
                                colors: [
                                  ThemeColor.gradient3,
                                  ThemeColor.gradient1
                                ],
                              ),
                            ),
                            child: _editingController.text.trim().isEmpty
                                ? IconButton(
                                    icon: Icon(Icons.search,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5)),
                                    onPressed: null)
                                : IconButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    icon: Icon(Icons.clear,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5)),
                                    onPressed: () => setState(() {
                                          _editingController.clear();
                                        })),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _editingController,
                              textAlignVertical: TextAlignVertical.center,
                              onChanged: (_) => setState(() {}),
                              style: GoogleFonts.headlandOne(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      fontSize: 14)),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: GoogleFonts.headlandOne(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        fontSize: 14)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _media.height * 0.72,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 25.0, top: 20.0),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: getCardList().length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ChatDetailPage(),
                                ));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: ChatCardWidget(
                                  cardModel: getCardList()[index],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Colors.grey.shade300,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
