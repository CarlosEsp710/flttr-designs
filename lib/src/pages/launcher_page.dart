import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:custom_painter/src/routes/routes.dart';
import 'package:custom_painter/src/theme/theme_cahner.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
        title: const Text('Diseños Flutter'),
      ),
      drawer: const _DrawerMenu(),
      body: const _OptionsList(),
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  const _DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        color: appTheme.currentTheme.scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                  child: const Text(
                    'CE',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: _OptionsList(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme.currentTheme.colorScheme.secondary,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.colorScheme.secondary,
                ),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                  onChanged: (value) => appTheme.customTheme = value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, i) =>
          Divider(color: appTheme.currentTheme.primaryColorLight),
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.currentTheme.colorScheme.secondary,
        ),
        title: Text(
          pageRoutes[i].title,
          style: TextStyle(
            color: (appTheme.darkTheme || appTheme.customTheme)
                ? Colors.white
                : Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.currentTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageRoutes[i].page,
            ),
          );
        },
      ),
    );
  }
}
