import 'dart:async';

import 'package:avadhesh_assignment/widgets/ease_in_widget.dart';
import 'package:avadhesh_assignment/ui/home.dart';
import 'package:avadhesh_assignment/utils/green_clipper.dart';
import 'package:avadhesh_assignment/utils/indicator.dart';
import 'package:avadhesh_assignment/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);
  ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  List<String> widgetList = [];
  int changePage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    widgetList.add('The Best Photo Of Celebrities');
    widgetList.add('The Best Photo Of Scientist');
    widgetList.add('The Best Photo Of Nature');
    widgetList.add('The Best Photo Of WildLife');

    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _pageController.animateToPage(
        currentPageNotifier.value,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
      if (changePage == 0) {
        changePage = 1;
        if (currentPageNotifier.value < widgetList.length) {
          currentPageNotifier.value++;
        } else {
          currentPageNotifier.value = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ThemeColor.theme_colour,
          body: Stack(
            children: <Widget>[
              ClipPath(
                clipper: GreenClipper(),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: ThemeColor.background_colour,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        child: PageView.builder(
                          onPageChanged: (value) async {
                            currentPageNotifier.value = value;
                            if (currentPageNotifier.value < widgetList.length) {
                              currentPageNotifier.value++;
                            } else {
                              currentPageNotifier.value = 0;
                            }

                            if (currentPageNotifier.value == widgetList.length) {
                              changePage = 0;
                            }
                          },
                          controller: _pageController,
                          itemCount: widgetList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              widgetList[index],
                              textAlign: TextAlign.left,
                              style: GoogleFonts.merriweather(
                                  textStyle: TextStyle(
                                      color: ThemeColor.text_colour,
                                      fontSize: 28)),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 50.0),
                      ValueListenableBuilder(
                        valueListenable: currentPageNotifier,
                        builder:
                            (BuildContext context, int value, Widget? child) =>
                                Container(
                          height: MediaQuery.of(context).size.height * .02,
                          child: Indicator(
                            controller: _pageController,
                            itemCount: widgetList.length,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.2),
                child: Image.asset('assets/welcome_image.png'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: EaseInWidget(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            InstaHome(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 40.0, right: 40.0, bottom: 40.0),
                      height: 66,
                      decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        gradient: LinearGradient(
                          colors: [ThemeColor.gradient3, ThemeColor.gradient1],
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Get Start',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.prompt(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 21)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )),
              )
            ],
          )),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    timer.cancel();
    super.dispose();
  }
}
