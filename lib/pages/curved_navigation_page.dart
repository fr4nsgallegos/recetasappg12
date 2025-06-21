import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:recetasappg12/models/screen_model.dart';
import 'package:recetasappg12/pages/home_page.dart';
import 'package:recetasappg12/pages/scroll_page.dart';

class CurvedNavigationPage extends StatefulWidget {
  @override
  State<CurvedNavigationPage> createState() => _CurvedNavigationPageState();
}

class _CurvedNavigationPageState extends State<CurvedNavigationPage> {
  Logger _logger = Logger();

  int _activeIndex = 0;

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _activeIndex,
        items: screensList.map((e) => e.icono).toList(),
        color: Color(0xffdad7cd),
        buttonBackgroundColor: screensList[_activeIndex].colorButtonOption,
        backgroundColor: screensList[_activeIndex].bgColor,

        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(seconds: 1),
            curve: Curves.decelerate,
          );
          _logger.d("El valor es $index");
          setState(() {});
        },
      ),
      // BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      //   ],
      // ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          _activeIndex = index;
          setState(() {});
        },
        children: screensList.map((e) => e.page).toList(),
      ),
    );
  }
}
