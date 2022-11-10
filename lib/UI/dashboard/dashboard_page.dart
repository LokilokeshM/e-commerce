import 'package:ecommerce/UI/cart/cart_screen.dart';
import 'package:ecommerce/UI/home/components/icon_btn_with_counter.dart';

import 'package:ecommerce/UI/profile/profile_screen.dart';
import 'package:ecommerce/common/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerce/common/enum/enums.dart';
import 'package:ecommerce/common/size_congig.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/UI/dashboard/tileCards.dart';
import 'package:ecommerce/UI/dashboard/title_with_button.dart';
import 'package:ecommerce/common/kitchnomics_String.dart';
import 'package:ecommerce/common/widget/rating/rating.dart';
import 'package:ecommerce/constant/bottom_bar.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/model/card_helper_entity.dart';

import '../home/components/search_field.dart';
import '../home/home_page.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: _appBar(context),
      body: _pages(),
      // bottomNavigationBar:
      //     const CustomBottomNavBar(selectedMenu: MenuState.home)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: bottomAppBar,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 7, 103, 32),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _pages() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CartScreen();
      case 2:
        return ProfileScreen();
      case 3:
        return Container();
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }

  ///Bottom Navigation Content Widget
  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 15, 228, 125),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Plan.png",
            height: 40,
            width: 40,
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Cook Now.png",
            height: 40,
            width: 40,
          ),
          label: 'Cook Now',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Home.png",
            height: 40,
            width: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Learn.png",
            height: 40,
            width: 40,
          ),
          label: 'Learn',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Store.png",
            height: 40,
            width: 40,
          ),
          label: 'Shop',
        ),
      ],
      onTap: _onItemTapped,
    );
  }

  AppBar _appBar(BuildContext context) {
    if (currentIndex == 0 && currentIndex == 0) {
      return AppBar(
          title: Center(
            child: Text(
              EcommerceString.of(context: context).title,
              style: const TextStyle(
                color: kHeadingTextColor,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: kPrimaryColor,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBtnWithCounter(
                    svgSrc: "assets/icons/Cart Icon.svg",
                    press: () =>
                        Navigator.pushNamed(context, CartScreen.routeName),
                  ),
                  IconBtnWithCounter(
                    svgSrc: "assets/icons/Bell.svg",
                    numOfitem: 3,
                    press: () {},
                  ),
                ],
              ),
            ),
          ]);
    } else {
      return AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          },
          icon: const Icon(Icons.arrow_back),
          color: kPrimaryBlackColor,
        ),
      );
    }
  }

  ///Dummy on tap Function
  void _onItemTapped(int value) {
    setState(() {
      currentIndex = value;
    });
  }
}
