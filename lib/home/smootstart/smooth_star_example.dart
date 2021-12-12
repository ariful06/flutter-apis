
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_api_learning/controller/smooth_start_controller.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:timeago/timeago.dart' as timeago;
class SmoothStarExample extends GetView<SmoothStartController>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Smooth Star"),
      ),
      body: Center(
        child:  SmoothStarRating(
            allowHalfRating: false,
            onRated: (v) {
              controller.rating = v;
            },
            starCount: 5,
            rating: controller.rating,
            size: 40.0,
            isReadOnly:false,
            filledIconData: Icons.star,
            color: Colors.green,
            borderColor: Colors.green,
            spacing:0.0
        )
      ),
    );
  }

}