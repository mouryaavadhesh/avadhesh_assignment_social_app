import 'package:flutter/material.dart';

class GreenClipper extends CustomClipper<Path> {



  @override
    Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 3);
    var firstControlPoint = Offset(0, size.height / 3.8); // adjust the height to move start of the first curve
    var firstEndPoint = Offset(size.width / 7.2, size.height / 3.9); // adjust the width to add the end controll point and height to move end of the first curve

    var secControlPoint = Offset(size.width, size.height / 3.3); // adjust the height to move end of the second curve
    var secEndPoint = Offset(size.width, size.height / 3 - 150); // adjust the width to add the right first controll point and height to move start of the second curve

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(
        secControlPoint.dx, secControlPoint.dy, secEndPoint.dx, secEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}