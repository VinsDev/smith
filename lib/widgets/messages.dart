import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:smith/clippers/clippers.dart';
import 'package:smith/constants/colors.dart';
import 'package:smith/constants/values.dart';

Widget messageBox1(String message, {String message2 = ""}) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.center,
        child: Container(
            width: screenWidth * 0.37,
            height: screenHeight * 0.08,
            color: lineColor),
      ),
      Align(
        alignment: Alignment.center,
        child: ClipPath(
          clipper: WelcomeClipper1(),
          child: Container(
            width: screenWidth * 0.371,
            height: screenHeight * 0.08,
            color: Colors.black,
            child: Center(
                child: message2.isEmpty
                    ? Text(
                        message,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 25, 184, 190),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            letterSpacing: 1.7),
                      )
                    : AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            message,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 25, 184, 190),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                letterSpacing: 1.7),
                            speed: const Duration(milliseconds: 100),
                          ),
                          TypewriterAnimatedText(
                            message2,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 25, 184, 190),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                letterSpacing: 1.7),
                            speed: const Duration(milliseconds: 100),
                          )
                        ],
                        isRepeatingAnimation: false,
                      )),
          ),
        ),
      )
    ],
  );
}
