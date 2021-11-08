import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/controller/chart_controller.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

import 'pie_chart_2_page.dart';
class ChartPage extends GetView<ChartController> {


  final _controller = PageController(initialPage: 0);
  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.easeInOutCubic;
  final _pages = const [
    PieChartSample2(),
    PieChartSample2()
  ];

  bool get isDesktopOrWeb =>
      Platform.isWindows ||kIsWeb;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: isDesktopOrWeb
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          controller: _controller,
          children: _pages,
        ),
      ),
      bottomNavigationBar: isDesktopOrWeb
          ? Container(
        padding: const EdgeInsets.all(16),
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              visible:  controller.currentPage != 0,
              child: FloatingActionButton(
                onPressed: () => _controller.previousPage(
                    duration: _duration, curve: _curve),
                child: const Icon(Icons.chevron_left_rounded),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: controller.currentPage != _pages.length - 1,
              child: FloatingActionButton(
                onPressed: () => _controller.nextPage(
                    duration: _duration, curve: _curve),
                child: const Icon(Icons.chevron_right_rounded),
              ),
            ),
          ],
        ),
      )
          : null,
    );
  }
}