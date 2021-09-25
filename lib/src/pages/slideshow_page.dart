import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:custom_painter/src/widgets/slideshow.dart';
import 'package:custom_painter/src/theme/theme_cahner.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    bool isLarge;
    (MediaQuery.of(context).size.height > 500)
        ? isLarge = true
        : isLarge = false;

    final children = [
      Expanded(
        child: MySlideShow(appTheme: appTheme),
      ),
      Expanded(
        child: MySlideShow(appTheme: appTheme),
      ),
    ];

    return Scaffold(
      body: (isLarge) ? Column(children: children) : Row(children: children),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    Key? key,
    required this.appTheme,
  }) : super(key: key);

  final ThemeChanger appTheme;

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      primaryColor: appTheme.currentTheme.colorScheme.secondary,
      primaryBullet: 12,
      secondaryBullet: 8,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}
