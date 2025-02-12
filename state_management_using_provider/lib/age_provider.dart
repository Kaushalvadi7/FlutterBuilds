import 'package:flutter/material.dart';

class AgeProvider extends ChangeNotifier {
  int _age = 0;
  String _message = "";

  int get age => _age;
  String get message => _message;

  void checkEligibility(int enteredAge) {
    _age = enteredAge;
    if (_age >= 18) {
      _message = "You are eligible to vote! 🗳️";
    } else {
      _message = "You are NOT eligible to vote! ❌";
    }
    notifyListeners(); // Notify UI about the update
  }
}
