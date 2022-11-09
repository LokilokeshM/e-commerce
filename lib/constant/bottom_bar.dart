import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomAppBar = [
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      size: 30,
      color: kPrimaryBlackColor,
    ),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.shopify_outlined,
      size: 30,
      color: kPrimaryBlackColor,
    ),
    label: 'Cart',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.person,
      size: 30,
      color: kPrimaryBlackColor,
    ),
    label: 'Profile',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.settings,
      size: 30,
      color: kPrimaryBlackColor,
    ),
    label: 'Setting',
  ),
];
