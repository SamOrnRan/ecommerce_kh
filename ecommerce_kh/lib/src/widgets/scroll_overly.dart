import 'package:flutter/material.dart';

import '../utils/style.dart';

class SrollOverLyWidget extends StatefulWidget {
  const SrollOverLyWidget(
      {Key? key, this.contentWidget, required this.widgetUnder})
      : super(key: key);

  final Widget? contentWidget;
  final Widget widgetUnder;

  @override
  State<SrollOverLyWidget> createState() => _SrollOverLyWidgetState();
}

class _SrollOverLyWidgetState extends State<SrollOverLyWidget> {
  bool appbarPin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color:
                appbarPin == false ? Constant.whiteColor : Constant.blackColor),
        backgroundColor:
            appbarPin == false ? Constant.backgroundColor : Constant.whiteColor,
        title: const Text("ផ្សារខ្មែរ"),
        titleTextStyle: TextStyle(
            fontSize: 25,
            color: appbarPin == false ? Colors.white : Colors.black),
        centerTitle: true,
      ),
      drawer: const Drawer(child: Text("Demo Drawer")),
      body: Container(
        color: Constant.backgroundColor,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: AspectRatio(aspectRatio: 2 / 1, child: widget.widgetUnder),
            ),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();

                return false;
              },
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: ((notification) {
                  if (notification.extent == 1.0) {
                    if (appbarPin == false) {
                      setState(() {
                        appbarPin = true;
                      });
                    }
                  } else {
                    if (appbarPin == true) {
                      setState(() {
                        appbarPin = false;
                      });
                    }
                  }
                  return false;
                }),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.50,
                  minChildSize: 0.50,
                  maxChildSize: 1.0,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                        controller: scrollController,
                        child: widget.contentWidget ?? Container());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
