import 'package:flutter/material.dart';
import 'package:smith/constants/colors.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key, required this.text, required this.clipper});

  final String text;
  final dynamic clipper;

  @override
  TopButtonsState createState() => TopButtonsState();
}

class TopButtonsState extends State<TopButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool expanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      if (_controller.isDismissed) {
        expanded = true;
        _controller.forward();
      } else {
        expanded = false;
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: _handleTap,
            child: ClipPath(
              clipper: widget.clipper,
              child: Container(
                decoration: const BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                height: MediaQuery.of(context).size.width * 0.05 - 12,
                width: MediaQuery.of(context).size.width * 0.191,
                child: Center(
                  child: Text(
                    '<< ${widget.text} >>',
                    style: const TextStyle(
                        color: buttonTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.1),
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        AnimatedContainer(
          padding: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 300),
          height: expanded ? 200 : 0,
          width: MediaQuery.of(context).size.width * 0.191,
          decoration: const BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(const Radius.circular(5))),
          child: expanded
              ? const Text(
                  "Hello here is the content for now",
                  style: TextStyle(
                      color: buttonTextColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1),
                )
              : Container(),
        )
      ],
    );
  }
}
