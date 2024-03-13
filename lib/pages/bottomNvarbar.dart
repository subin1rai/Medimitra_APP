import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:medimitra/pages/Walllet.dart';
import 'package:medimitra/pages/order.dart';
import 'package:medimitra/pages/profile.dart';
import '../Screens/HomeScreen/HomePage.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int CurrentTypeIndex = 0;

  late List<Widget> pages;
  late Widget Currentpage;
  late HomePage homePage;
  late Profile profile;
  late Wallet wallet;
  late OrderPage order;

  @override
  void initState() {
    homePage = HomePage();
    profile = Profile();
    wallet = Wallet();
    order = OrderPage();
    pages = [homePage, order, wallet, profile];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Color(0xff6FC8B8),
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            CurrentTypeIndex = index;
          });
        },
        items: 
      [
        CurvedNavigationBarItem(
        child: Icon(Icons.home_outlined, color: Colors.black,),
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.shopping_bag_outlined, color: Colors.black,),
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.wallet_outlined, color: Colors.black,),
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.person_outline, color: Colors.black,),
      ),
      
       ],),

       body: pages[CurrentTypeIndex],
    );
  }
}
