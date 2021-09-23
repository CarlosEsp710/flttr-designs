import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:custom_painter/src/widgets/radial_progress.dart';
import 'package:custom_painter/src/theme/theme_cahner.dart';

class PieChartsPage extends StatefulWidget {
  const PieChartsPage({Key? key}) : super(key: key);

  @override
  State<PieChartsPage> createState() => _PieChartsPageState();
}

class _PieChartsPageState extends State<PieChartsPage> {
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appTheme.colorScheme.secondary,
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            percent += 10;
            if (percent > 100) {
              percent = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                percent: percent,
                primaryColor: Colors.blue,
              ),
              CustomRadialProgress(
                percent: percent,
                primaryColor: Colors.purple,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                percent: percent,
                primaryColor: Colors.green,
              ),
              CustomRadialProgress(
                percent: percent,
                primaryColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color primaryColor;

  const CustomRadialProgress({
    Key? key,
    required this.percent,
    this.primaryColor = Colors.blue,
  }) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        percent: percent,
        primaryColor: primaryColor,
        secondaryColor:
            appTheme.currentTheme.textTheme.bodyText1!.color ?? Colors.grey,
        secondaryStrokeWidth: 2,
      ),
    );
  }
}
