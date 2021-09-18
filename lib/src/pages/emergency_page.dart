import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:custom_painter/src/widgets/fat_button.dart';
import 'package:custom_painter/src/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                const SizedBox(height: 100),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.carCrash,
                    title: 'Motor Accident',
                    color_1: const Color(0xff6989F5),
                    color_2: const Color(0xff906EF5),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.plus,
                    title: 'Medical Emergency',
                    color_1: const Color(0xff66A9F2),
                    color_2: const Color(0xff536CF6),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.theaterMasks,
                    title: 'Theft / Harrasement',
                    color_1: const Color(0xffF2D572),
                    color_2: const Color(0xffE06AA3),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.biking,
                    title: 'Awards',
                    color_1: const Color(0xff317183),
                    color_2: const Color(0xff46997D),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.carCrash,
                    title: 'Motor Accident',
                    color_1: const Color(0xff6989F5),
                    color_2: const Color(0xff906EF5),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.plus,
                    title: 'Medical Emergency',
                    color_1: const Color(0xff66A9F2),
                    color_2: const Color(0xff536CF6),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.theaterMasks,
                    title: 'Theft / Harrasement',
                    color_1: const Color(0xffF2D572),
                    color_2: const Color(0xffE06AA3),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.biking,
                    title: 'Awards',
                    color_1: const Color(0xff317183),
                    color_2: const Color(0xff46997D),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.carCrash,
                    title: 'Motor Accident',
                    color_1: const Color(0xff6989F5),
                    color_2: const Color(0xff906EF5),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.plus,
                    title: 'Medical Emergency',
                    color_1: const Color(0xff66A9F2),
                    color_2: const Color(0xff536CF6),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.theaterMasks,
                    title: 'Theft / Harrasement',
                    color_1: const Color(0xffF2D572),
                    color_2: const Color(0xffE06AA3),
                    onPressed: () => print('Click'),
                  ),
                ),
                FadeInLeft(
                  child: FatButton(
                    icon: FontAwesomeIcons.biking,
                    title: 'Awards',
                    color_1: const Color(0xff317183),
                    color_2: const Color(0xff46997D),
                    onPressed: () => print('Click'),
                  ),
                ),
              ],
            ),
          ),
          const _Header(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Haz solicitado',
          subtitle: 'Asistencia Médica',
        ),
        Positioned(
          right: 0,
          top: 30,
          child: RawMaterialButton(
            onPressed: () => print('CLICK'),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
