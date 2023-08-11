import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:plantpal/screens/profile_screen/profile_screen.dart';

import '../favorite_screen/favorite_screen.dart';
import '../home_screen/home_screen.dart';

/// Step1
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const routeName = '/tab-screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget>? _pages;

  @override
  void initState() {
    _pages = [
      const HomeScreen(),
      const FavoriteScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.grey,

        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        // backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.heart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.profile),
            label: '',
          ),
        ],
      ),
    );
  }
}
