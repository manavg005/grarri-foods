import 'package:flutter/material.dart';

/// A base provider class that extends [ChangeNotifier].
class BaseProvider extends ChangeNotifier {
  void refreshState() {
    notifyListeners();
  }
}
