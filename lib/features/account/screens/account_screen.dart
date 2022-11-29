import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AccoutScreen extends StatelessWidget {
  const AccoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,

            ),
           ),
           title: Row(
            children:[
             Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/amazon_in.png', 
              width: 120, 
              height: 45,
              color: Colors.black,
              ),
             ),
             Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
                
             ),
            ],
           
           ),
          ),
      ),
    );
  }
}