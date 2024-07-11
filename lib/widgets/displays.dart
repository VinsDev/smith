import 'package:flutter/material.dart';
import 'package:smith/widgets/cards.dart';
import 'package:smith/widgets/messages.dart';

class DisplayObject {
  final int index;
  final Widget widget;

  DisplayObject({required this.index, required this.widget});
}

List<DisplayObject> displays = [
  DisplayObject(
      index: 0,
      widget: messageBox1('GOOD DAY MR. VINCENT', message2: 'How can i help?')),
  DisplayObject(index: 1, widget: hub),
  DisplayObject(
      index: 2,
      widget: const Center(
        child: Text(
          "DATABASE",
          style: TextStyle(color: Colors.white),
        ),
      )),
  DisplayObject(index: 3, widget: projects),
  DisplayObject(
      index: 4,
      widget: const Center(
        child: Text(
          "ARMORY",
          style: TextStyle(color: Colors.white),
        ),
      )),
];

Widget hub = SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [hubCard, hubCard, hubCard, hubCard],
      ),
      Row(
        children: [hubCard, hubCard, hubCard, hubCard],
      ),
      Row(
        children: [hubCard, hubCard, hubCard],
      ),
    ],
  ),
);

Widget projects = SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [projectCard, projectCard, projectCard, projectCard],
      ),
      Row(
        children: [projectCard, projectCard, projectCard, projectCard],
      ),
      Row(
        children: [projectCard, projectCard, projectCard],
      ),
    ],
  ),
);
