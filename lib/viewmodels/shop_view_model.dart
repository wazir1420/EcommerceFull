import 'dart:async';

import 'package:ecommerce/views/explore_view.dart';

import 'package:ecommerce/views/shop_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ShopViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  int get currentPage => _currentPage;

  final List<Widget> _screens = [
    ShopView(),
    ExploreView(),
  ];

  void onBottomNavTapped(int index, BuildContext context) {
    _selectedIndex = index;
    rebuildUi();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => _screens[index]));
  }

  ShopViewModel() {
    _startAutoPageChange();
  }

  void _startAutoPageChange() {
    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        if (pageController.hasClients) {
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
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
