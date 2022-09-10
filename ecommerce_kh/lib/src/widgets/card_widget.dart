import 'package:ecommerce_kh/src/utils/style.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key,
      required this.cardHeight,
      this.cardWidth,
      this.cardChild,
      this.cardColor})
      : super(key: key);
  final double cardHeight;
  final double? cardWidth;
  final Color? cardColor;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
          color: cardColor ?? Colors.white,
          border: Border.all(color: Constant.blackColor),
          borderRadius: BorderRadius.circular(10)),
      child: cardChild ?? Container(),
    );
  }
}
