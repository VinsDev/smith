import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smith/clippers/clippers.dart';
import 'package:smith/constants/colors.dart';
import 'package:smith/providers/switch_notifier.dart';
import 'package:smith/widgets/buttons.dart';

class TopPanelButtons extends StatefulWidget {
  const TopPanelButtons(
      {super.key,
      required this.index,
      required this.text,
      required this.clipper,
      required this.dropdownItems});

  final int index;
  final String text;
  final dynamic clipper;
  final List<String> dropdownItems;

  @override
  TopPanelButtonsState createState() => TopPanelButtonsState();
}

class TopPanelButtonsState extends State<TopPanelButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

  @override
  Widget build(BuildContext context) {
    final switchNotifier = Provider.of<SwitchNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => switchNotifier.toggleTopPanelBottonSwitch(widget.index),
          child: ClipPath(
            clipper: widget.clipper,
            child: Container(
              decoration: const BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              height: MediaQuery.of(context).size.width * 0.05 - 12,
              width: MediaQuery.of(context).size.width * 0.191,
              child: Center(
                child: Text(
                  '<< ${widget.text} >>',
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
        ),
        ClipPath(
          clipper: TopButtonsItemsContainerClipper(),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.191,
              decoration: const BoxDecoration(
                color: containerBackground,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: switchNotifier.switches[widget.index]
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.dropdownItems.length,
                      itemBuilder: (context, index) {
                        return basicButton(
                            widget.dropdownItems[index]);
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        )
      ],
    );
  }
}
