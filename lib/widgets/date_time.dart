import 'package:flutter/material.dart';
import 'package:smith/constants/colors.dart';
import 'dart:async';
import '../clippers.dart';

class DateAndTimeContainer extends StatefulWidget {
  const DateAndTimeContainer({super.key});

  @override
  DateAndTimeContainerState createState() => DateAndTimeContainerState();
}

class DateAndTimeContainerState extends State<DateAndTimeContainer> {
  Stream<DateTime> _currentTimeStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 6,
      left: MediaQuery.of(context).size.width * 0.05,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.066,
        child: Column(
          children: [
            Container(
              color: lineColor,
              height: 1.0,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Expanded(child: Container()),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                children: [
                  ClipPath(
                    clipper: DateClipper(),
                    child: Container(
                      padding: const EdgeInsets.only(right: 20, left: 15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(144, 27, 138, 172),
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      // width: MediaQuery.of(context).size.width * 0.195,
                      child: StreamBuilder<DateTime>(
                        stream: _currentTimeStream(),
                        builder: (context, snapshot) {
                          final dateTime = snapshot.data ?? DateTime.now();
                          final date =
                              "${_getMonth(dateTime.month)} ${dateTime.day}, ${dateTime.year}";
                          // final date = "${_getWeekday(dateTime.weekday)}, ${_getMonth(dateTime.month)} ${dateTime.day}, ${dateTime.year}";
                          return Center(
                            child: Text(
                              date,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 136, 228, 228),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  StreamBuilder<DateTime>(
                    stream: _currentTimeStream(),
                    builder: (context, snapshot) {
                      final dateTime = snapshot.data ?? DateTime.now();
                      final time =
                          "${_formatTime(dateTime.hour)}:${_formatTime(dateTime.minute)}:${_formatTime(dateTime.second)} ${_getPeriod(dateTime.hour)}";
                      return Text(
                        time,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 131, 177, 199),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              color: lineColor,
              height: 1.0,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ],
        ),
      ),
    );
  }

  String _getWeekday(int weekday) {
    const weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
    return weekdays[weekday - 1];
  }

  String _getMonth(int month) {
    const months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC"
    ];
    return months[month - 1];
  }

  String _formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  String _getPeriod(int hour) {
    return hour >= 12 ? "PM" : "AM";
  }
}
