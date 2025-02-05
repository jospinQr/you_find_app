import 'package:flutter/material.dart';

class WelcomViewModel with ChangeNotifier {
  int _pageViewIndex = 0;
  final PageController _pageviewController =
      PageController(initialPage: 0, keepPage: true);

  int get pageViewIndex => _pageViewIndex;

  PageController get pageviewController => _pageviewController;

  // Méthode pour changer de page
  void changePage(int newPageIndex, {bool animate = true}) {
    _pageViewIndex = newPageIndex;
    if (animate) {
      pageviewController.animateToPage(
        newPageIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOutQuad,
      );
    } else {
      pageviewController.jumpToPage(newPageIndex);
    }
    notifyListeners();
  }

  // Méthodes de navigation (Next / Previous)
  void nextPage() {
    if (_pageViewIndex < 2) {
      changePage(_pageViewIndex + 1);
    }
  }

  void previousPage() {
    if (_pageViewIndex > 0) {
      changePage(_pageViewIndex - 1);
    }
  }

  @override
  void dispose() {
    _pageviewController.dispose();
    super.dispose();
  }
}
