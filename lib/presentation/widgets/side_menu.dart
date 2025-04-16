import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  
  final  GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).padding.top > 30;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (int index) {
        setState(() {
          navDrawerIndex = index;
        });
        final menuItem = appMenuItems[index];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children:[
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text('Main'),
        ),

        ...appMenuItems
        .sublist(0, 3)
        .map( (menuItem) => NavigationDrawerDestination(
          icon: Icon(menuItem.icon),
          label: Text(menuItem.title),
          // selectedIcon: Icon(menuItem.icon),
        )),
       
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
          child: Divider(),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More options'),
        ),

        ...appMenuItems
        .sublist(3, appMenuItems.length)
        .map( (menuItem) => NavigationDrawerDestination(
          icon: Icon(menuItem.icon),
          label: Text(menuItem.title),
          // selectedIcon: Icon(menuItem.icon),
        )),

      ] 
      );
  }
}