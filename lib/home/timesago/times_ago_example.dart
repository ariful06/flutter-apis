
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
class TimesAgoExample extends GetView{
  @override
  Widget build(BuildContext context) {
    final birthday = DateTime(1995, 5, 2);
    return Scaffold(
      appBar: AppBar(
        title: Text("Times Ago"),
      ),
      body: Center(
        child: Text(timeago.format(birthday))
      ),
    );
  }

}