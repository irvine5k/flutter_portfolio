import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool showProjects = false;

  void toggleShowProjects() {
    showProjects = !showProjects;

    notifyListeners();
  }
}
