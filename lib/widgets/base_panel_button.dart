import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smith/constants/colors.dart';
import 'package:smith/constants/values.dart';
import 'package:smith/providers/switch_notifier.dart';

class BasePanelButton extends StatelessWidget {
  final int index;
  final String text;
  final dynamic clipper;

  const BasePanelButton(
      {super.key,
      required this.text,
      required this.clipper,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final switchNotifier = Provider.of<SwitchNotifier>(context);
    return InkWell(
      onTap: () => switchNotifier.toggleBasePanelBottonSwitch(index),
      child: ClipPath(
        clipper: clipper,
        child: Container(
          decoration: BoxDecoration(
            color: switchNotifier.switches[index]
                ? moreTransparentContainerBackground
                : buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(3)),
          ),
          height: screenWidth * 0.05 - 12,
          width: screenWidth * 0.23,
          child: Center(
            child: Text(
              '<< $text >>',
              style: const TextStyle(
                color: panelButtonTextColor,
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
