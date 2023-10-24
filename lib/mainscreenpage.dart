import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/home.dart';
import 'package:flutter_application_1/Core/inbox.dart';
import 'package:flutter_application_1/Core/order.dart';
import 'package:flutter_application_1/Core/profile.dart';
import 'package:flutter_application_1/Core/travels.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int _selectedIndex = 2; // Changer l'index à 2 pour afficher Home en premier
  final List<Widget> _screens = [
    Profile(),
    Orders(),
    Home(),
    Travels(),
    Inbox(),
  ];
  
  final List<String> _pageNames = [
    "Profile",
    "Orders",
    "",
    "Travels",
    "Inbox",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  Color.fromARGB(225, 255, 255, 255),
          selectedItemColor: Colors.purpleAccent,
          unselectedItemColor: const Color.fromARGB(255, 32, 32, 32),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle),
              label: _pageNames[0],
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag_badge_plus),
              label: _pageNames[1],
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.purple, // Couleur mauve
                child: Icon(
                  Icons.home,
                  color: Colors.white, // Couleur de l'icône en blanc
                ),
              ),
              label: _pageNames[2],
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.airplane),
              label: _pageNames[3],
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.captions_bubble),
              label: _pageNames[4],
            ),
          ],
        ),
      ),
    );
  }
}
