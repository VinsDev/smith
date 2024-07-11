import 'package:flutter/material.dart';

class SwitchNotifier extends ChangeNotifier {
  final List<bool> _switches;
  int _displayIndex = 0;

  SwitchNotifier({int numberOfSwitches = 15})
      : _switches = List.filled(numberOfSwitches, false);

  List<bool> get switches => _switches;

  int get displayIndex => _displayIndex;

  void setDisplayIndex(int index) {
    _displayIndex = index;
    notifyListeners();
  }

  void toggleSwitch(int index) {
    _switches[index] = !_switches[index];
    notifyListeners();
  }

  void toggleTopPanelBottonSwitch(int index) {
    if (index >= 5 && index <= 7) {
      for (int i = 5; i <= 7; i++) {
        _switches[i] = i == index ? !_switches[i] : false;
      }
    } else {
      _switches[index] = !_switches[index];
    }
    notifyListeners();
  }

  void toggleBasePanelBottonSwitch(int index) {
    if (!_switches[index]) {
      _displayIndex = index;
    } else {
      _displayIndex = -1;
    }
    if (index >= 1 && index <= 4) {
      for (int i = 1; i <= 4; i++) {
        _switches[i] = i == index ? !_switches[i] : false;
      }
    } else {
      _switches[index] = !_switches[index];
    }
    notifyListeners();
  }
}
