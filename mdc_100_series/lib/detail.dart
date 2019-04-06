import 'package:flutter/material.dart';
import 'my_model/product.dart';

class Detail extends StatefulWidget {
  Product _product;
  Detail(this._product);

  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Product product;
  @override
  Widget build(BuildContext context) {
    product = widget._product;
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                child: Stack(
              children: <Widget>[
                Hero(
                  tag: product.toString(),
                  child: Image.asset(
                    product.assetName,
                    // fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(10.0),
                    child: IconButton(
                        icon: Icon(
                          product.is_favorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 40.0,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            product.toggle();
                            print(product.is_favorite);
                            print(this);
                          });
                        }))
              ],
            )),
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      children:
                          _drawStars(product.star_count, start_size: 30.0)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      Text(
                        product.location,
                        style: TextStyle(color: Theme.of(context).primaryColorLight),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      Text(
                        product.phone,
                        style: TextStyle(color: Theme.of(context).primaryColorLight),
                      )
                    ],
                  ),
                  Divider(),
                  Text(
                    product.description,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 14,
                        height: 1.5),
                  ),
                ],
              ),
            )
          ],
        ));
  }
  List<Icon> _drawStars(int n, {double start_size: 15.0}) {
    List<Icon> icons = List<Icon>();
    for (int i = 0; i < n; i++)
      icons.add(Icon(
        Icons.star,
        color: Colors.yellow,
        size: start_size,
      ));
    return icons;
  }
}
