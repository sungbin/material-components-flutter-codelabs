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
import 'my_model/products_repository.dart';
import 'my_model/product.dart';
import 'search.dart';
import 'favorite.dart';
import 'ranking.dart';
import 'mypage.dart';

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
  List<String> _appbarTitleList = ["Main","Search","Favortie Hotels", "Hotel Users Ranking", "My Page"];
  final List<Product> products = ProductsRepository.loadProducts();
  Cards _cards = null;
  Search _search = null;
  Favorite _favorite_page = null;
  Ranking ranking_page = null;
  var drawerOptions = <Widget>[];

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      Navigator.of(context).pop(); // close the drawer

      if(index == 1) {
        _search ??= Search();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _search),
        );
      } else if(index == 2) {
        _favorite_page ??= Favorite(products);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _favorite_page),
        );
      } else if(index == 3) {
        ranking_page ??= Ranking(products);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ranking_page),
        );
      }
      _selectedDrawerIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
         ListTile(
          leading: Icon(d.icon),
          title: Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    _cards ??=Cards(products);
    return Scaffold(
          appBar: get_appbar(),
          drawer: get_drawer(),
          body: Center(
            child: _cards,
          ),
    );
  }
  AppBar get_appbar (){
    return AppBar(
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
  );
  }
  Drawer get_drawer() {
    return Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Pages", style: TextStyle(fontSize: 20),), accountEmail: null),
            Column(children: drawerOptions)
          ],
        ),
      );
  }
}

