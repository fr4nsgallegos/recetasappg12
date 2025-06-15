import 'package:flutter/material.dart';
import 'package:recetasappg12/pages/detalle_receta_page.dart';
import 'package:recetasappg12/pages/home_page.dart';
import 'package:recetasappg12/examples/textfield_page.dart';
import 'package:recetasappg12/examples/textformfield_page.dart';
import 'package:recetasappg12/pages/navegacion_page.dart';
import 'package:recetasappg12/pages/scroll_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(Color(0xff003049)),
      debugShowCheckedModeBanner: false,
    ),
  );
}
