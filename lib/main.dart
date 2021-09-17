import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/headers_page.dart';
import 'package:custom_painter/src/pages/animations_page.dart';
import 'package:custom_painter/src/retos/cuadrado_animado_page.dart';
import 'package:custom_painter/src/labs/circular_progress_page.dart';
import 'package:custom_painter/src/pages/pie_charts_page.dart';
import 'package:custom_painter/src/pages/slideshow_page.dart';
import 'package:custom_painter/src/pages/pinterest_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: PinterestPage(),
    );
  }
}
