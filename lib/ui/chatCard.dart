import 'package:avadhesh_assignment/models/card_model.dart';
import 'package:avadhesh_assignment/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatCardWidget extends StatelessWidget {
  final CardModel cardModel;
  const ChatCardWidget({required this.cardModel})
      : super();
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(cardModel.profilePic),
          radius: 28,
          backgroundColor: Color(0xfff1f3f5),
        ),
        title: Text(cardModel.name, style: GoogleFonts.merriweather(
            textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: ThemeColor.text_colour,
                fontSize: 18))),
        subtitle: Text(cardModel.latestMessage,
           style: GoogleFonts.merriweather(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ThemeColor.text_colour,
                    fontSize: 14)),
            ),
        trailing: Text(cardModel.timeStamp, style:TextStyle(color: Colors.black87, fontSize: 10.0)),
      );
  }
}