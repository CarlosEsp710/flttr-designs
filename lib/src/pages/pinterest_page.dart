import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:custom_painter/src/widgets/pinterest_menu.dart';
import 'package:custom_painter/src/theme/theme_cahner.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: const <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context);

    if (width > 500) width = width - 500;

    return Positioned(
      bottom: 20,
      child: Container(
        height: 100,
        width: width,
        child: Row(
          children: <Widget>[
            const Spacer(),
            PinterestMenu(
              show: show,
              activeColor: (appTheme.darkTheme)
                  ? appTheme.currentTheme.colorScheme.secondary
                  : Colors.blue,
              backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
              items: [
                PinterestButton(
                  icon: Icons.pie_chart,
                  onPressed: () => print('Icon pie_chart'),
                ),
                PinterestButton(
                  icon: Icons.search,
                  onPressed: () => print('Icon search'),
                ),
                PinterestButton(
                  icon: Icons.notifications,
                  onPressed: () => print('Icon notifications'),
                ),
                PinterestButton(
                  icon: Icons.supervised_user_circle,
                  onPressed: () => print('Icon supervised_user_circle'),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double prevScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > prevScroll && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      prevScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;

    if (MediaQuery.of(context).size.width > 500) {
      count = 6;
    } else {
      count = 4;
    }

    return StaggeredGridView.countBuilder(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => _show;
  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
