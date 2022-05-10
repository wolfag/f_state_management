import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final randomGenerator = Random();

  int? _generatedNumber;
  int? get generatedNumber => _generatedNumber;

  int min = 0;
  int max = 0;

  void generateNumber() {
    _generatedNumber = min + randomGenerator.nextInt(max + 1 - min);
    notifyListeners();
  }
}
