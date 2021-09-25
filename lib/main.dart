import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:custom_painter/src/models/layout_model.dart';
import 'package:custom_painter/src/theme/theme_cahner.dart';
import 'package:custom_painter/src/pages/launcher_tablet_page.dart';
import 'package:custom_painter/src/pages/launcher_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LayoutModel(),
      child: ChangeNotifierProvider(
        create: (_) => ThemeChanger(1),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: appTheme.currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}
