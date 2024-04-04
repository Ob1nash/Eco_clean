import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/ecomart.dart';
import 'screens/ecocollect.dart';
import 'screens/recyclepage.dart';
import 'screens/smartbin.dart';
import 'widgets/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 2; // Set initial index to 2 for the HomeScreen

  final List<Widget> _screens = [
    EcoCollectScreen(),
    EcomartScreen(),
    HomeScreen(),
    RecyclePageScreen(),
    SmartBinScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoSeg',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/EcoCollect.png', width: 20, height: 20,),
              label: 'Eco Collect',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Eco Market',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.recycling),
              label: 'Recycle',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              label: 'Smart Bin',
            ),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 141, 233, 98),
          unselectedItemColor: Color.fromARGB(255, 37, 139, 2),
          elevation: 8.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
