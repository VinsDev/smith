import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smith/clippers/clippers.dart';
import 'package:smith/constants/colors.dart';
import 'package:smith/constants/values.dart';
import 'package:smith/providers/switch_notifier.dart';
import 'displays.dart';

Widget statsContainer() {
  return Positioned(
    right: 17.5,
    top: screenHeight / 10,
    child: ClipPath(
      clipper: StatsClipper(),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(108, 27, 138, 172),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
        height: (screenHeight - 13) * 0.77,
        width: (screenWidth - 13) * 0.25,
        child: Column(children: [
          Container(
            color: Colors.transparent,
            width: (screenWidth - 13) * 0.2,
            height: (screenHeight - 13) * 0.06,
            child: const Center(
                child: Text(
              '< STATS >',
              style: TextStyle(
                  color: Color.fromARGB(255, 144, 212, 243),
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                  letterSpacing: 1.2),
            )),
          ),
          SizedBox(
            height: (screenHeight - 13) * 0.70,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [],
            ),
          )
        ]),
      ),
    ),
  );
}

Widget appNameContainer(BuildContext context) {
  return Positioned(
      top: screenHeight * 0.12,
      left: screenHeight * 0.08,
      child: Column(
        children: [
          Container(
            height: 1,
            width: 110,
            color: const Color.fromARGB(255, 86, 2, 241),
          ),
          Container(
            height: 2,
            width: 110,
            color: lineColor,
          ),
          Row(
            children: [
              const Text(
                'Smith',
                style: TextStyle(
                    color: Color.fromARGB(255, 18, 203, 235),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, top: 1, bottom: 1),
                padding: const EdgeInsets.only(left: 5, right: 5),
                color: const Color.fromARGB(144, 9, 179, 231),
                child: const Text(
                  'AI',
                  style: TextStyle(
                      color: Color.fromARGB(255, 161, 215, 240),
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5),
                ),
              )
            ],
          ),
          Container(
            height: 2,
            width: 110,
            color: lineColor,
          ),
          Container(
            height: 1,
            width: 110,
            color: const Color.fromARGB(255, 86, 2, 241),
          ),
        ],
      ));
}

// Filters display based on index . . .
Widget filterDisplays(int index, List<DisplayObject> list) {
  Widget r = const SizedBox.shrink();
  for (var element in list) {
    if (element.index == index) {
      r = element.widget;
    }
  }
  return r;
}

Widget displayPanelContainer(BuildContext context) {
  final switchNotifier = Provider.of<SwitchNotifier>(context);
  return Positioned(
    bottom: screenWidth * 0.05 + 8,
    left: screenWidth * 0.03 +
        (screenWidth - 13) * 0.2 +
        10 +
        8,
    child: SizedBox(
        // color: moreTransparentContainerBackground,
        height: (screenHeight - 13) * 0.77 - 4,
        width: (screenWidth - 13) * 0.727 - 8,
        child: filterDisplays(switchNotifier.displayIndex, displays)),
  );
}
