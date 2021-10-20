import 'package:flutter/material.dart';
import 'package:flutter_todolist/screens/home_screen.dart';

import 'package:flutter_todolist/screens/categories_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://blog.logrocket.com/wp-content/uploads/2021/04/flutter-app-development-pros-cons.png'),
          ),
          accountName: Text('FlutterCrypto'),
          accountEmail: Text('fluttercrypto@gmx.de'),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
        ),
        ListTile(
          leading: Icon(Icons.view_list),
          title: Text('Categories'),
          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen())),
        ),

      ]
      ),
    ));
  }
}

