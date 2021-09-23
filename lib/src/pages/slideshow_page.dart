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

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Slideshow(
              primaryColor: (appTheme.darkTheme)
                  ? appTheme.currentTheme.colorScheme.secondary
                  : Colors.red,
              primaryBullet: 12,
              secondaryBullet: 8,
              slides: <Widget>[
                SvgPicture.asset('assets/svg/slide-1.svg'),
                SvgPicture.asset('assets/svg/slide-2.svg'),
                SvgPicture.asset('assets/svg/slide-3.svg'),
                SvgPicture.asset('assets/svg/slide-4.svg'),
                SvgPicture.asset('assets/svg/slide-5.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
