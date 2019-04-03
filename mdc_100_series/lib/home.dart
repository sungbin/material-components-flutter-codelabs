// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'cards.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Home", Icons.home),
    DrawerItem("Search", Icons.search),
    DrawerItem("Favorite Hotel", Icons.location_city),
    DrawerItem("Ranking", Icons.insert_chart),
    DrawerItem("My Page", Icons.person),
  ];
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Cards();
      case 1:
        // return new SecondFragment();
      case 2:
        // return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: Center(
        // child: _getCardView(context),
        child: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Pages", style: TextStyle(fontSize: 20),), accountEmail: null),
            Column(children: drawerOptions)
          ],
        ),
      ),
    );
  }
}

