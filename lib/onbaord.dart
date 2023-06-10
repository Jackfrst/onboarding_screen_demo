import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment(0,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceOut,
                  );
                },
                child: Text("Next"),
              ),

              SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  onDotClicked: (index) => _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.bounceIn),
              ),

              GestureDetector(
                onTap: (){
                  _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
                child: Text("Skip"),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
