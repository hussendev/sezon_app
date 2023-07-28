import 'package:flutter/material.dart';

BottomNavigationBar AppBottomNavigationBar({int currentIndex=0, Function(int index)? onTap}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    onTap: onTap,
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    items: const[
      BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        label: 'Home',

      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.category),
          label: 'Category'
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.shopping_cart_rounded),
          label: 'Orders'
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.favorite),
          label: 'Favorite'
      ),
    ],
  );
}