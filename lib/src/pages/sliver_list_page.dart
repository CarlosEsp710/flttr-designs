import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:custom_painter/src/theme/theme_cahner.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList(),
          ),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {},
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.colorScheme.secondary
            : const Color(0xFFED6762),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: (appTheme.darkTheme)
                ? appTheme.currentTheme.scaffoldBackgroundColor
                : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
      const _ListItem(title: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(title: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    ];

    final appTheme = Provider.of<ThemeChanger>(context);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              child: const _Title(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme || appTheme.customTheme)
                  ? Colors.white
                  : const Color(0xFF532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: (appTheme.darkTheme || appTheme.customTheme)
                    ? Colors.white
                    : const Color(0xFFF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                  color: (appTheme.darkTheme)
                      ? appTheme.currentTheme.colorScheme.secondary
                      : const Color(0xFFD93A30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: (appTheme.darkTheme) ? Colors.grey : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      height: 100,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.white : color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
