import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';

class Indicator extends AnimatedWidget {
  final PageController controller;
  final int pageCount;

  const Indicator({required this.controller, required this.pageCount})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              itemCount: pageCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _createIndicator(index);
              })
        ],
      ),
    );
  }

  Widget _createIndicator(index) {
    double w = 10;
    double h = 10;
    Color color = Colors.grey;

    if (controller.page == index) {
      color = kBlueColor;
      h = 13;
      w = 13;
    }

    return Container(
      height: 26,
      width: 26,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(3.0),
          width: w,
          height: h,
          child: Material(
            type: MaterialType.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
