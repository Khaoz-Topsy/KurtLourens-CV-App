import 'package:flutter/material.dart';

import '../constants/app_image.dart';
import 'helper/drawer_helper.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  //
  Widget drawerWrapper(BuildContext drawerCtx, List<Widget> widgets) {
    String path = AppImage.drawer;
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 150.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(path),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: null,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
            ),
          ),
          ...widgets,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return drawerWrapper(
      context,
      getDrawerItems(context),
    );
  }
}
