import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/components/welcome_page.dart';
import 'package:my_app/screens/nft_screen.dart';

import 'components/cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  static List pages = [
    const WelcomePage(),
    NftScreen(),
    const Cart(),
  ];

  int selectedIndex = 0;
  String title = 'WELCOME TO JAM NFTS';
  String title1 = 'WELCOME TO JAM NFTS';
  String title2 = 'MARKETPLACE';
  String title3 = 'MY CART';

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;

      if (index == 0) {
        title = title1;
      } else if (index == 1) {
        title = title2;
      } else if (index == 2) {
        title = title3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(title,
            style: TextStyle(
                letterSpacing: 1.2,
                color: Colors.orange.shade600,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Macondo')),
        toolbarOpacity: 0.5,
        centerTitle: true,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.pink[700], //not
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.ethereum), label: 'Welcome'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.store), label: 'Marketplace'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bagShopping), label: 'Cart'),
        ],
      ),
    );
  }
}
