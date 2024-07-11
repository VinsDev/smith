import 'package:flutter/material.dart';
import 'package:smith/constants/values.dart';

Widget basicButton(String text) {
  return Container(
    decoration: const BoxDecoration(
        color: Color.fromARGB(150, 16, 133, 187),
        borderRadius: BorderRadius.all(Radius.circular(2.0))),
    margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.5),
    padding: const EdgeInsets.only(left: 5),
    height: (screenHeight - 13) * 0.07,
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
