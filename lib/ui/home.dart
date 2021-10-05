import 'package:avadhesh_assignment/data/data.dart';
import 'package:avadhesh_assignment/models/user_model.dart';
import 'package:avadhesh_assignment/ui/chatList.dart';
import 'package:avadhesh_assignment/widgets/ease_in_widget.dart';
import 'package:avadhesh_assignment/ui/profile.dart';
import 'package:avadhesh_assignment/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstaHome extends StatefulWidget {
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  List<UserModel> userList = [];

  @override
  void initState() {
    super.initState();
    userList.add(UserModel('', ''));
    userList.addAll(getUsersCard());
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return new Scaffold(
      backgroundColor: ThemeColor.background_colour,
      appBar: new AppBar(
        backgroundColor: ThemeColor.background_colour,
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white.withOpacity(0),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Hello, Avadhesh',
          textAlign: TextAlign.left,
          style: GoogleFonts.prompt(
              textStyle:
                  TextStyle(color: ThemeColor.theme_colour, fontSize: 21)),
        ),
        actions: <Widget>[
          new Container(
            width: 40.0,
            height: 40.0,
            decoration:
                new BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              Icons.search,
              color: ThemeColor.imageAdd,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          )
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: userList.length,
        itemBuilder: (context, index) => index == 0
            ? new SizedBox(
                child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userList.length,
                  itemBuilder: (context, index) => EaseInWidget(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ChatList(),
                      ));
                    },
                    child: new Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[

                            Container(
                                margin:
                                    EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                 index == 0
                                        ? new CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Color(0xfff1f3f5),
                                      child: Icon(
                                        Icons.add,
                                        color: ThemeColor.imageAdd,
                                      ),
                                    ):CircleAvatar(
                                      backgroundImage: AssetImage(
                                          userList[index].profilePic),
                                      radius: 32,
                                      backgroundColor: Color(0xfff1f3f5),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        index == 0?'':userList[index].name,
                                        style: TextStyle(
                                            inherit: true,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            color: ThemeColor.text_colour),
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                height: 120,
              )
            : Container(
                height: deviceSize.width - 40.0,
                width: deviceSize.width - 40.0,
                margin: EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(40.0),
                  ),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage("assets/image_main.png")),
                ),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Profile(),
                        ));
                      },

                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                              bottomRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(40.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              new Container(
                                height: 50.0,
                                width: 40.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                          userList[index].profilePic)),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              new Expanded(
                                child: SizedBox(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        child: Text(
                                          userList[index].name,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.merriweather(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: ThemeColor.text_colour,
                                                  fontSize: 18)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        child: Text(
                                          '1 Hour',
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.merriweather(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: ThemeColor.theme_colour,
                                                  fontSize: 14)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(Icons.more_vert)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
