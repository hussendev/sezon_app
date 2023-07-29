import 'package:flutter/material.dart';

BottomNavigationBar AppBottomNavigationBar({int currentIndex=0, Function(int index)? onTap, bool isHome=true}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    onTap: onTap,
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    items: isHome ? const[
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
    ] :const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        label: 'Home',

      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.shopping_cart_rounded),
          label: 'Orders'
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.notifications),
          label: 'Notifications'
      ),
      BottomNavigationBarItem(
          icon:  Icon(Icons.person),
          label: 'Profile'
      ),
    ]
  );
}