import 'package:flutter/material.dart';
import '../../utils/style.dart';
import '../../widgets/card_widget.dart';
import '../../widgets/scroll_overly.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SrollOverLyWidget(
      widgetUnder: const Image(
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://www.pngmart.com/files/17/Organic-Fruits-Transparent-Background.png'),
      ),
      contentWidget: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                color: Constant.whiteColor,
                height: 400,
              )),
          Positioned(
              left: 10,
              right: 10,
              child: CardWidget(
                cardHeight: 60,
                cardColor: Constant.whiteColor,
              )),
        ],
      ),
    );
  }
}
