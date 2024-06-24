import 'package:flutter/material.dart';

class MyCustomClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height - size.height * 0.08);
    path.lineTo(size.height * 0.08, size.height);
    path.lineTo(size.width - size.height * 0.08, size.height);
    path.lineTo(size.width, size.height - size.height * 0.08);
    path.lineTo(size.width, size.height * 0.08);
    path.lineTo(size.width - size.height * 0.08, 0.0);
    path.lineTo(size.width * 0.4, 0.0);
    path.lineTo(size.width * 0.4 - size.height * 0.08, size.height * 0.08);
    path.lineTo(size.height * 0.08, size.height * 0.08);
    path.lineTo(0, size.height * 0.08 * 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class MyCustomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height - size.height * 0.25);
    path.lineTo(1.5, size.height - size.height * 0.25);
    path.lineTo(1.5, size.height - size.height * 0.08);
    path.lineTo(size.height * 0.08, size.height - 1.5);
    path.lineTo(size.height * 0.25, size.height - 1.5);
    path.lineTo(size.height * 0.25, size.height);
    path.lineTo(size.width - size.height * 0.25, size.height);
    path.lineTo(size.width - size.height * 0.25, size.height - 1.5);
    path.lineTo(size.width - size.height * 0.08, size.height - 1.5);
    path.lineTo(size.width - 1.5, size.height - size.height * 0.08);
    path.lineTo(size.width - 1.5, size.height - size.height * 0.25);
    path.lineTo(size.width, size.height - size.height * 0.25);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width - 1.5, size.height * 0.25);
    path.lineTo(size.width - 1.5, size.height * 0.08);
    path.lineTo(size.width - size.height * 0.08, 1.5);
    path.lineTo(size.width - size.height * 0.25, 1.5);
    path.lineTo(size.width - size.height * 0.25, 0.0);
    path.lineTo(size.width * 0.4 + 2.0, 0.0);
    path.lineTo(
        size.width * 0.4 - size.height * 0.08 + 2.0, size.height * 0.08);
    path.lineTo(size.height * 0.25, size.height * 0.08);
    path.lineTo(size.height * 0.25, size.height * 0.08 + 1.5);
    path.lineTo(size.height * 0.08, size.height * 0.08 + 1.5);
    path.lineTo(1.5, size.height * 0.08 * 2);
    path.lineTo(1.5, size.height * 0.08 + size.height * 0.25);
    path.lineTo(0.0, size.height * 0.08 + size.height * 0.25);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class BottomLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width * 0.14, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.5 + 25, 0.0);
    path.lineTo(size.width * 0.5 + 20, 3.0);
    path.lineTo(size.width * 0.5 - 20, 3.0);
    path.lineTo(size.width * 0.5 - 25, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class ButtonsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.5 + 25, 0.0);
    path.lineTo(size.width * 0.5 + 20, 3.0);
    path.lineTo(size.width * 0.5 - 20, 3.0);
    path.lineTo(size.width * 0.5 - 25, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width - size.width * 0.15, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.5 + 25, 0.0);
    path.lineTo(size.width * 0.5 + 20, 3.0);
    path.lineTo(size.width * 0.5 - 20, 3.0);
    path.lineTo(size.width * 0.5 - 25, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class TopLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.5 - 25, size.height);
    path.lineTo(size.width * 0.5 - 20, size.height - 3.0);
    path.lineTo(size.width * 0.5 + 20, size.height - 3.0);
    path.lineTo(size.width * 0.5 + 25, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.15, 0.0);
    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class TopButtonsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.5 - 25, size.height);
    path.lineTo(size.width * 0.5 - 20, size.height - 3.0);
    path.lineTo(size.width * 0.5 + 20, size.height - 3.0);
    path.lineTo(size.width * 0.5 + 25, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class TopRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.5 - 25, size.height);
    path.lineTo(size.width * 0.5 - 20, size.height - 3.0);
    path.lineTo(size.width * 0.5 + 20, size.height - 3.0);
    path.lineTo(size.width * 0.5 + 25, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - size.width * 0.15, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class CenterRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height * 0.6);
    path.lineTo(3.0, size.height * 0.6 + 3.0);
    path.lineTo(3.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(3.0, 0.0);
    path.lineTo(3.0, size.height * 0.4 - 3.0);
    path.lineTo(0.0, size.height * 0.4);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class DateClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.87, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class WelcomeClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height * 0.75);
    path.lineTo(2.0, size.height * 0.75);
    path.lineTo(2.0, size.height - 2.0);
    path.lineTo(size.width - 2.0, size.height - 2.0);
    path.lineTo(size.width - 2.0, size.height * 0.75);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width - 2.0, size.height * 0.25);
    path.lineTo(size.width - 2.0, 2.0);
    path.lineTo(2.0, 2.0);
    path.lineTo(2.0, size.height * 0.25);
    path.lineTo(0.0, size.height * 0.25);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class StatsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.615);
    path.lineTo(size.width - 3.0, size.height * 0.615 - 3.0);
    path.lineTo(size.width - 3.0, size.height * 0.385 + 3.0);
    path.lineTo(size.width, size.height * 0.385);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
