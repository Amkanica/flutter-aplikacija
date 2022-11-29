import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/constants/global_variables.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}
int _page = 0;
double bottomBarWidth = 42;
double bottomBarBorderWidth = 5;


class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor ,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor ,
        backgroundColor: GlobalVariables.backgroundColor ,
        iconSize: 28,
        items: [

//HOMEPAGE
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 0? 
                      GlobalVariables.selectedNavBarColor : 
                    GlobalVariables.backgroundColor ,
                  width: bottomBarBorderWidth,
               ),
              ),
             ),
             child: const Icon(
              Icons.home_outlined,
            ),
          ),
          label: ''
        ),

//ACCOUNT
                     BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 1? 
                      GlobalVariables.selectedNavBarColor : 
                    GlobalVariables.backgroundColor ,
                  width: bottomBarBorderWidth,
               ),
              ),
             ),
             child: const Icon(
              Icons.person_outline_outlined,
              ),
            ),
            label: '',
            ),



// CART
            BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 2? 
                      GlobalVariables.selectedNavBarColor : 
                    GlobalVariables.backgroundColor ,
                  width: bottomBarBorderWidth,
               ),
              ),
             ),
             child: Badge(
              elevation: 0,
              badgeContent: const Text('2'),
              badgeColor: Colors.white,
               child: const Icon(
               Icons.home_outlined,
              ),
              )
            ),
            label: '',
          ),


        ],
      ),
    );
  }
}
