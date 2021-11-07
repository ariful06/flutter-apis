import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/common/row_item.dart';
import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/controller/aimation/curved_bottom_navigation_bar_controller.dart';
import 'package:flutter_api_learning/controller/badges_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class BadgesExample
    extends GetView<BadgesController> {
  BadgesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.argumentData[0]['title'] ?? "No Title"),
        centerTitle: true,
      ),
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add,color: Colors.white,), backgroundColor: Colors.deepOrange, onPressed: () {}),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade200,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(icon: Icon(Icons.home,color: Colors.deepOrange,), onPressed: () {}),
                IconButton(icon: Icon(Icons.search,color: Colors.deepOrange), onPressed: () {}),
                SizedBox(width: 40), // The dummy child
                Badge(
                    position: BadgePosition.topEnd(top: 0,end: 2),
                    badgeContent: const Text("8",style: TextStyle(color: Colors.white),),
                    showBadge: true,
                    child: IconButton(icon: Icon(Icons.notifications,color: Colors.deepOrange), onPressed: () {})),
                Badge(
                    position: BadgePosition.topEnd(top: 0,end: 2),
                    badgeContent: const Text("8",style: TextStyle(color: Colors.white),),
                    showBadge: true,
                    child: IconButton(icon: Icon(Icons.message,color: Colors.deepOrange), onPressed: () {})),
              ],
            ),
          )),
    );
  }
}
