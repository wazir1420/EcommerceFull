import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ExploreViewModel extends BaseViewModel {
  // Search controller
  TextEditingController searchController = TextEditingController();

  // Original list of categories
  final List<Map<String, dynamic>> _categories = [
    {
      'image': 'assets/images/fresh.png',
      'name': 'Fresh Fruits & Vegetables',
      'color': Colors.green,
      'colors': Color.fromARGB(255, 217, 249, 217)
    },
    {
      'image': 'assets/images/oil.png',
      'name': 'Cooking Oil & Ghee',
      'color': Colors.amber,
      'colors': Color.fromARGB(255, 245, 236, 209)
    },
    {
      'image': 'assets/images/meat.png',
      'name': 'Meat & Fish',
      'color': Colors.red,
      'colors': Color.fromARGB(255, 248, 214, 212)
    },
    {
      'image': 'assets/images/bakery.png',
      'name': 'Bakery & Snacks',
      'color': Colors.purpleAccent,
      'colors': Color.fromARGB(255, 240, 212, 245)
    },
    {
      'image': 'assets/images/dairy.png',
      'name': 'Dairy & Eggs',
      'color': Colors.yellow,
      'colors': const Color.fromARGB(255, 241, 237, 203),
    },
    {
      'image': 'assets/images/beverage.png',
      'name': 'Beverages',
      'color': Colors.blue,
      'colors': const Color.fromARGB(255, 206, 227, 244),
    },
  ];

  // Getter for the categories
  List<Map<String, dynamic>> get categories {
    if (_searchText.isEmpty) {
      return _categories;
    }
    return _categories
        .where((item) =>
            item['name'].toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
  }

  // Private search text variable
  String _searchText = '';

  // Getter for search text
  String get searchText => _searchText;

  // Function to update search text
  void updateSearch(String text) {
    _searchText = text;
    notifyListeners(); // Update UI when search text changes
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
