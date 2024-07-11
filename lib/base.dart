import 'package:flutter/material.dart';
import 'package:smith/constants/colors.dart';
import 'package:smith/constants/values.dart';
import 'package:smith/widgets/base_panel_button.dart';
import 'package:smith/widgets/top_panel_button.dart';
import 'package:smith/widgets/buttons.dart';
import 'package:smith/widgets/containers.dart';
import 'package:smith/widgets/date_time.dart';
import 'clippers/clippers.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => BaseState();
}

class BaseState extends State<Base> {
  bool stats = false;

  final List<String> quickCommands = [
    "Make a Call",
    "Send a Text",
    "Launch an App",
    "Set an Alarm",
    "On Flashlight",
    "On Wifi",
    "Turn On Bluetooth",
    "Turn On Mobile Data",
    "Activate Camera",
    "Capture Sound",
    "Schedule Task",
  ];

  final List<String> peopleItems = [
    "Family",
    "Friends",
    "Classmates",
    "Colleagues",
    "Mentors",
    "Others",
  ];

  final List<String> chatItems = ["Lets talk", "Tell me a story", "I'm bored"];

  final List<String> meItems = [
    "Important life events",
    "Achievements",
    "Memories",
    "Goals and Aspirations",
  ];

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
                  width: screenWidth - 10,
                  height: screenHeight - 10,
                  color: lineColor,
                )),
          ),
          // Body Container . . .
          Align(
            alignment: Alignment.center,
            child: ClipPath(
                clipper: MyCustomClipper2(),
                child: Container(
                  width: screenWidth - 13,
                  height: screenHeight - 13,
                  color: Colors.black,
                  child: Stack(children: [
                    // App Name . . .
                    appNameContainer(context),
                    // Vert. line before Q.C . . .
                    Positioned(
                      bottom: screenWidth * 0.05,
                      left: screenWidth * 0.03,
                      child: Container(
                        color: lineColor,
                        height: (screenHeight - 13) * 0.40,
                        width: 3.0,
                      ),
                    ),
                    // Quick Commands . . .
                    Positioned(
                      bottom: screenWidth * 0.05,
                      left: screenWidth * 0.03 + 6,
                      child: Container(
                        color: containerBackground,
                        height: (screenHeight - 13) * 0.40,
                        width: (screenWidth - 13) * 0.2,
                        child: Column(children: [
                          Container(
                            color: Colors.transparent,
                            width:
                                (screenWidth - 13) * 0.2,
                            height: (screenHeight - 13) * 0.06,
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
                            height: (screenHeight - 13) * 0.34,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: quickCommands.length,
                              itemBuilder: (context, index) {
                                return basicButton(quickCommands[index]);
                              },
                            ),
                          )
                        ]),
                      ),
                    ),
                    // Vert. line after Q.C . . .
                    Positioned(
                      bottom: screenWidth * 0.05,
                      left: screenWidth * 0.03 +
                          (screenWidth - 13) * 0.2 +
                          10,
                      child: Container(
                        color: lineColor,
                        height: (screenHeight - 13) * 0.40,
                        width: 3.0,
                      ),
                    ),
                    // Horiz. line after Q.C . . .
                    Positioned(
                      bottom: screenWidth * 0.05,
                      left: screenWidth * 0.03 +
                          (screenWidth - 13) * 0.2 +
                          10,
                      child: Container(
                        color: lineColor,
                        height: 1.5,
                        width: (screenWidth - 13) * 0.727,
                      ),
                    ),
                    // Base Pannel . . .
                    Positioned(
                        bottom: 6.0,
                        left: screenWidth * 0.025,
                        child: SizedBox(
                          width: screenWidth * 0.93,
                          child: Flex(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: [
                              BasePanelButton(
                                  index: 1,
                                  text: "HUB",
                                  clipper: BottomLeftClipper()),
                              BasePanelButton(
                                  index: 2,
                                  text: "DATABASE",
                                  clipper: ButtonsClipper()),
                              BasePanelButton(
                                  index: 3,
                                  text: "PROJECTS",
                                  clipper: ButtonsClipper()),
                              BasePanelButton(
                                  index: 4,
                                  text: "ARMORY",
                                  clipper: BottomRightClipper())
                            ],
                          ),
                        )),
                    // Stats Bar . . .
                    Positioned(
                      right: 7.0,
                      top: screenHeight / 10,
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
                            height: (screenHeight - 13) * 0.77,
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
                        child: statsContainer()),
                    // Display Panel . . .
                    displayPanelContainer(context),
                    // Top Pannel . . .
                    Positioned(
                        top: 6,
                        right: screenWidth * 0.025,
                        child: SizedBox(
                          width: screenWidth * 0.58,
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TopPanelButtons(
                                index: 5,
                                text: "PEOPLE",
                                clipper: TopLeftClipper(),
                                dropdownItems: peopleItems,
                              ),
                              TopPanelButtons(
                                index: 6,
                                text: "CHAT",
                                clipper: TopButtonsClipper(),
                                dropdownItems: chatItems,
                              ),
                              TopPanelButtons(
                                index: 7,
                                text: "ME",
                                clipper: TopRightClipper(),
                                dropdownItems: meItems,
                              )
                            ],
                          ),
                        )),
                  ]),
                )),
          ),
        ]),
      ),
    );
  }
}
