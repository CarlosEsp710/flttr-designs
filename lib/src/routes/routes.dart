import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:custom_painter/src/pages/slideshow_page.dart';
import 'package:custom_painter/src/pages/emergency_page.dart';
import 'package:custom_painter/src/pages/headers_page.dart';
import 'package:custom_painter/src/pages/pie_charts_page.dart';
import 'package:custom_painter/src/pages/pinterest_page.dart';
import 'package:custom_painter/src/pages/sliver_list_page.dart';

import 'package:custom_painter/src/challenges/cuadrado_animado_page.dart';

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare,
    title: 'Slideshow',
    page: const SlideshowPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.ambulance,
    title: 'Emergency',
    page: const EmergencyPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers',
    page: const HeadersPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarry,
    title: 'Cuadro Animado',
    page: const CuadradoAnimadoPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch,
    title: 'RadialProgress',
    page: const PieChartsPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest,
    title: 'Pinterest',
    page: const PinterestPage(),
  ),
  _Route(
    icon: FontAwesomeIcons.mobile,
    title: 'Slivers',
    page: const SliverListPage(),
  ),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({
    required this.icon,
    required this.title,
    required this.page,
  });
}
