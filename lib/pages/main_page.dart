import 'package:elibrary/pages/accounts/account_page.dart';
import 'package:elibrary/pages/categories/category_page.dart';
import 'package:elibrary/pages/favorites/favorite_page.dart';
import 'package:elibrary/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    FavoritePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: _selectedIndex == 0
                ? Icon(Icons.home, size: 30)
                : Icon(Icons.home_outlined, size: 30),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Categories",
            icon: _selectedIndex == 1
                ? Icon(Icons.ballot, size: 30)
                : Icon(Icons.ballot_outlined, size: 30),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Favorites",
            icon: _selectedIndex == 2
                ? Icon(Icons.favorite, size: 30)
                : Icon(Icons.favorite_outline, size: 30),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: _selectedIndex == 3
                ? Icon(Icons.person, size: 30)
                : Icon(Icons.person_outline, size: 30),
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey.shade400,
        onTap: _onItemTapped,
      ),
    );
  }
}
