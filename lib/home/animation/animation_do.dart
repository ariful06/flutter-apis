import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/common/row_item.dart';
import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AnimationDoSample extends GetView<AnimationDoController> {
  AnimationDoSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.argumentData[0]['title'] ?? "No Title"),
          centerTitle: true,
        ),
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        body: Column(
          children: [
            Wrap(
                children :[
                ElasticIn(child: Square()),
                ElasticInDown(child: Square()),
                ElasticInUp(child: Square()),
                SlideInUp(child: Square()),
                ]),

          ],
        ));
  }
}

class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
