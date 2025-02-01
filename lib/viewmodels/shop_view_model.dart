import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ShopViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void onBottomNavTapped(int index) {
    _selectedIndex = index;
    rebuildUi();
    if (index == 0) {
    } else if (index == 1) {}
  }

  int get currentPage => _currentPage;

  ShopViewModel() {
    _startAutoPageChange();
  }

  void _startAutoPageChange() {
    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        rebuildUi();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
