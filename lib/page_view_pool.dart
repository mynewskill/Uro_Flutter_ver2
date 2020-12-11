import 'package:flutter/material.dart';
import 'package:uro_control/slider.dart';

class PageViewPool extends StatefulWidget {
  @override
  _PageViewPoolState createState() => _PageViewPoolState();
}

class _PageViewPoolState extends State<PageViewPool> {
  int _currentPage = 0;
  PageController _pageController = PageController();
  List _pages = [
    SlidePage(),
    SlidePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemCount: _pages.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, int index) {
            return _pages[index];
          },
        ),
      ],
    );
  }
}
