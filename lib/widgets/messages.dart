import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:smith/clippers.dart';
import 'package:smith/constants/colors.dart';

Widget messageBox1(String message, BuildContext context,
    {String message2 = ""}) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.37,
          height: MediaQuery.of(context).size.height * 0.08,
          color: lineColor
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: ClipPath(
          clipper: WelcomeClipper1(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.371,
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.black,
            child: Center(
                child: AnimatedTextKit(
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
                message2.isNotEmpty
                    ? TypewriterAnimatedText(
                        message2,
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 25, 184, 190),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            letterSpacing: 1.7),
                        speed: const Duration(milliseconds: 100),
                      )
                    : TyperAnimatedText("")
              ],
              isRepeatingAnimation: false,
            )),
          ),
        ),
      )
    ],
  );
}
