import 'dart:math' as math;

import 'package:flutter/material.dart';

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingWidth = size.width * 3 / 5;

    final filledRectangle = Rect.fromLTRB(
      0,
      0,
      size.width - roundingWidth,
      size.height,
    );

    final roundingRectangle = Rect.fromLTRB(
      size.width - roundingWidth * 2,
      -30,
      size.width,
      size.height + 30,
    );

    final path = Path();

    path.addRect(filledRectangle);
    path.arcTo(roundingRectangle, -math.pi / 2, math.pi, true);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
