
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:timeago/timeago.dart' as timeago;
class SmoothStarExample extends GetView{
  @override
  Widget build(BuildContext context) {

    var rating = 3.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Smooth Star"),
      ),
      body: Center(
        child:  SmoothStarRating(
            allowHalfRating: false,
            onRated: (v) {
            },
            starCount: 5,
            rating: rating,
            size: 40.0,
            isReadOnly:true,
            filledIconData: Icons.star_border,
            halfFilledIconData: Icons.star_half,
            color: Colors.green,
            borderColor: Colors.green,
            spacing:0.0
        )
      ),
    );
  }

}