import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
  PageController pageController = PageController();

  int _currentPage = 0;

  final List<String> images = [
    'assets/images/bana.png',
    'assets/images/bana1.png',
    'assets/images/bana2.png',
  ];

  void onPageChanged(int page) {
    _currentPage = page;
    rebuildUi();
  }

  int counter = 1;
  void incounter() {
    counter++;
    rebuildUi();
  }

  void decounter() {
    if (counter > 1) {
      counter--;
      rebuildUi();
    }
  }

  double pricePerUnit = 4.99;
  double get totalPrice {
    return pricePerUnit * counter;
  }

  int get currentPage => _currentPage;
}
