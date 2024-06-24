import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smith/constants/colors.dart';
import 'package:smith/widgets/botton_slider.dart';
import 'package:smith/widgets/bottons.dart';
import 'package:smith/widgets/containers.dart';
import 'package:smith/widgets/date_time.dart';
import 'package:smith/widgets/messages.dart';
import 'clippers.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => BaseState();
}

class BaseState extends State<Base> {
  bool welcome = true;
  bool stats = false;

  final List<String> quickCommands = [
    "Make a Call",
    "Greet Me",
    "Send a Text",
    "Launch an App",
    "Set an Alarm",
    "On Flashlight",
    "On Wifi",
    "On Bluetooth",
    "On Mobile Data",
    "Activate Camera",
    "Capture Sound",
    "Schedule Task",
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      setState(() {
        welcome = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          // Date and Time . . .
          const DateAndTimeContainer(),
          // Parent Border . . .
          Align(
            alignment: Alignment.center,
            child: ClipPath(
                clipper: MyCustomClipper1(),
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  height: MediaQuery.of(context).size.height - 10,
                  color: lineColor,
                )),
          ),
          // Body Container . . .
          Align(
            alignment: Alignment.center,
            child: ClipPath(
                clipper: MyCustomClipper2(),
                child: Container(
                  width: MediaQuery.of(context).size.width - 13,
                  height: MediaQuery.of(context).size.height - 13,
                  color: Colors.black,
                  child: Stack(children: [
                    // App Name . . .
                    appNameContainer(context),
                    // Vert. line before Q.C . . .
                    Positioned(
                      bottom: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.03,
                      child: Container(
                        color: lineColor,
                        height:
                            (MediaQuery.of(context).size.height - 13) * 0.40,
                        width: 3.0,
                      ),
                    ),
                    // Quick Commands . . .
                    Positioned(
                      bottom: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.03 + 6,
                      child: Container(
                        color: const Color.fromARGB(108, 27, 138, 172),
                        height:
                            (MediaQuery.of(context).size.height - 13) * 0.40,
                        width: (MediaQuery.of(context).size.width - 13) * 0.2,
                        child: Column(children: [
                          Container(
                            color: Colors.transparent,
                            width:
                                (MediaQuery.of(context).size.width - 13) * 0.2,
                            height: (MediaQuery.of(context).size.height - 13) *
                                0.06,
                            child: const Center(
                                child: Text(
                              'Quick Commands',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 144, 212, 243),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  letterSpacing: 1.2),
                            )),
                          ),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height - 13) *
                                0.34,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: quickCommands.length,
                              itemBuilder: (context, index) {
                                return quickCommandsItem(
                                    quickCommands[index], context);
                              },
                            ),
                          )
                        ]),
                      ),
                    ),
                    // Vert. line after Q.C . . .
                    Positioned(
                      bottom: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.03 +
                          (MediaQuery.of(context).size.width - 13) * 0.2 +
                          10,
                      child: Container(
                        color: const Color.fromARGB(255, 9, 179, 231),
                        height:
                            (MediaQuery.of(context).size.height - 13) * 0.40,
                        width: 3.0,
                      ),
                    ),
                    // Horiz. line after Q.C . . .
                    Positioned(
                      bottom: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.03 +
                          (MediaQuery.of(context).size.width - 13) * 0.2 +
                          10,
                      child: Container(
                        color: lineColor,
                        height: 1.5,
                        width: (MediaQuery.of(context).size.width - 13) * 0.727,
                      ),
                    ),
                    // Base Pannel . . .
                    Positioned(
                        bottom: 6.0,
                        left: MediaQuery.of(context).size.width * 0.025,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.93,
                          child: Flex(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: [
                              button("HUB", BottomLeftClipper(), context),
                              button("DATABASE", ButtonsClipper(), context),
                              button("PROJECTS", ButtonsClipper(), context),
                              button("ARMORY", BottomRightClipper(), context),
                            ],
                          ),
                        )),
                    // Top Pannel . . .
                    Positioned(
                        top: 6,
                        right: MediaQuery.of(context).size.width * 0.025,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.58,
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TopButtons(
                                  text: "PEOPLE", clipper: TopLeftClipper()),
                              TopButtons(
                                  text: "CHAT", clipper: TopButtonsClipper()),
                              TopButtons(text: "ME", clipper: TopRightClipper())
                            ],
                          ),
                        )),
                    // Stats Bar . . .
                    Positioned(
                      right: 7.0,
                      top: MediaQuery.of(context).size.height / 10,
                      child: ClipPath(
                        clipper: CenterRightClipper(),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (stats) {
                                stats = false;
                              } else {
                                stats = true;
                              }
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(111, 9, 179, 231),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            height: (MediaQuery.of(context).size.height - 13) *
                                0.77,
                            width: 12.0,
                            child: const Center(
                                child: CircleAvatar(
                              radius: 3,
                              backgroundColor:
                                  Color.fromARGB(255, 131, 177, 199),
                            )),
                          ),
                        ),
                      ),
                    ),
                    // Stats . . .
                    Visibility(
                        visible: stats ? true : false,
                        child: statsContainer(context)),
                    // Welcome . . .
                    welcome
                        ? Align(
                            alignment: Alignment.center,
                            child: messageBox1(
                                'GOOD DAY MR. VINCENT',
                                message2: 'How can i help?',
                                context))
                        : const SizedBox(),
                  ]),
                )),
          ),
        ]),
      ),
    );
  }
}
