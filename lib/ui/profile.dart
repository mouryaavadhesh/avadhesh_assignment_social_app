import 'dart:ui';

import 'package:avadhesh_assignment/data/data.dart';
import 'package:avadhesh_assignment/models/user_model.dart';
import 'package:avadhesh_assignment/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  List<UserModel> userModel = [];

  @override
  void initState() {
    super.initState();
    userModel.addAll(getUsersCard());
  }
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ThemeColor.background_colour,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              //pinned: true,
              floating: false,
              expandedHeight: 350.0,
              excludeHeaderSemantics: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bg_profile.png"),
                            fit: BoxFit.cover)),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/user.png"),
                              radius: 65.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text("Avadhesh Mourya",
                                style: TextStyle(
                                    color: ThemeColor.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Hybrid Application Developer",
                                style: TextStyle(
                                    color:
                                    ThemeColor.white.withOpacity(0.85),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 24.0, left: 42, right: 32),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text("567",
                                        style:  GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18))),
                                    Text("Photo",
                                        style:GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 20)))
                                  ],
                                ) ,
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text("12,454",
                                        style:  GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18))),
                                    Text("Followers",
                                        style: GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 20)))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text("127",
                                        style: GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18))),
                                    Text("Follows",
                                        style: GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 20)))
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              centerTitle: true,
              pinned: false,
              backgroundColor: ThemeColor.theme_colour,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Today Post",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return  Container(
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
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(top:200),
                            padding: EdgeInsets.all(20.0),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                bottomRight: const Radius.circular(40.0),
                                bottomLeft: const Radius.circular(40.0),
                              ),
                            ),
                            child:  Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.merriweather(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: ThemeColor.theme_colour,
                                      fontSize: 14)),
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                },
                childCount: userModel.length,
              ),
            ),
          ],
        ));
  }
}
