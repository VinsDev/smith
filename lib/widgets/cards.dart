import 'package:flutter/material.dart';
import 'package:smith/constants/colors.dart';
import 'package:smith/constants/values.dart';

Widget hubCard = Container(
  width: screenWidth * 0.2,
  height: (screenHeight * 0.66) / 3,
  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
  decoration: BoxDecoration(
      color: moreTransparentContainerBackground.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8)),
);

Widget projectCard = Container(
  width: screenWidth * 0.2,
  height: (screenHeight * 0.66) / 3,
  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
  decoration: BoxDecoration(
      color: moreTransparentContainerBackground.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8)),
);
