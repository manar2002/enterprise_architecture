import 'package:enterprise_architecture/screens/home/view.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/custom_text.dart';
import '../cart/view.dart';
import '../favourite/view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {

  int currentIndex = 0;

  List content = [
    ['shops', 'Shops', const HomeScreen()],
    ['cart', 'Cart', const Cart()],
    ['heart', 'Favourite', const Favorite()],
    ['user', 'Account', const Center(child: Text('Account'))],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content[currentIndex][2],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (v) {
          currentIndex = v;
          setState(() {});
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kBlackColor,
        items: content.map((e) {
          final index = content.indexOf(e);
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                    getAsset(e[0]),
                    height: 30,
                    width: 30,
                    color: currentIndex == index ? kPrimaryColor : kBlackColor,
                  ),
                ),
                MyText(
                  data: e[1],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: currentIndex == index ? kPrimaryColor : kBlackColor,
                ),
              ],
            ),
            label: '',
          );
        }).toList(),
      ),
    );
  }
}
