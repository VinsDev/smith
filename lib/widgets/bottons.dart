import 'package:flutter/material.dart';

Widget quickCommandsItem(String text, BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
        color: Color.fromARGB(150, 16, 133, 187),
        borderRadius: BorderRadius.all(Radius.circular(2.0))),
    margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.5),
    padding: const EdgeInsets.only(left: 5),
    height: (MediaQuery.of(context).size.height - 13) * 0.07,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 143, 228, 240),
            fontWeight: FontWeight.w700,
            fontSize: 11,
            letterSpacing: 1.2),
      ),
    ),
  );
}

Widget button(String text, dynamic clipper, BuildContext context) {
  return ClipPath(
    clipper: clipper,
    child: Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(144, 27, 138, 172),
          borderRadius: BorderRadius.all(Radius.circular(3))),
      height: MediaQuery.of(context).size.width * 0.05 - 12,
      width: MediaQuery.of(context).size.width * 0.23,
      child: Center(
        child: Text(
          '<< $text >>',
          style: const TextStyle(
              color: Color.fromARGB(255, 131, 177, 199),
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.1),
        ),
      ),
    ),
  );
}
