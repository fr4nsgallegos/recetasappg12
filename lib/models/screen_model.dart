import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recetasappg12/examples/textfield_page.dart';
import 'package:recetasappg12/pages/home_page.dart';
import 'package:recetasappg12/pages/scroll_page.dart';

class ScreenModel {
  Widget page;
  String title;
  Color bgColor;
  Color colorButtonOption;
  Icon icono;
  ScreenModel({
    required this.page,
    required this.title,
    required this.bgColor,
    required this.colorButtonOption,
    required this.icono,
  });
}

List<ScreenModel> screensList = [
  ScreenModel(
    page: HomePage(Color(0xff344e41)),
    title: "Home",
    bgColor: Color(0xff344e41),
    colorButtonOption: Colors.white.withOpacity(0.3),
    icono: Icon(Icons.home),
  ),
  ScreenModel(
    page: TextfieldPage(Color(0xff588157)),
    title: "Text Field PAGE",
    bgColor: Color(0xff588157),
    colorButtonOption: Colors.white.withOpacity(0.3),
    icono: Icon(Icons.question_mark_outlined),
  ),
  ScreenModel(
    page: ScrollPage(Color(0xffa3b18a)),
    title: "Scroll Page",
    bgColor: Color(0xffa3b18a),
    colorButtonOption: Colors.white.withOpacity(0.3),
    icono: Icon(Icons.archive_rounded),
  ),
];
