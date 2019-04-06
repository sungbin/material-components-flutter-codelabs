import 'my_model/products_repository.dart';
import 'my_model/product.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'detail.dart';

class Cards extends StatefulWidget {
  Cards(this._products);
  List<Product> _products;

  _CardsState createState() => _CardsState();
}

List<Product> products = null;

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    products = widget._products;
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context));
      },
    );
       
      
    // ));
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

  List<Card> _buildGridCards(BuildContext context) {
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 18 / 11,
                child: Hero(
                  tag: product.toString(),
                  child: Image.asset(
                    product.assetName,
                    fit: BoxFit.fitWidth,
                  ),
                )),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 6.0, 0.0, 0.0),
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    Row(children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: _drawStars(product.star_count)),
                            Text(
                              product.name,
                              style: theme.textTheme.title,
                              maxLines: 1,
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              product.location,
                              style: theme.textTheme.subtitle,
                              maxLines: 1,
                            ),
                          ])
                    ]),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        child: Text(
                          'more',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                          textAlign: TextAlign.right,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => Detail(product)
                          ));
                          },
                        textTheme: ButtonTextTheme.primary,
                      ),
                    ),
                  ])),
            ),
          ],
        ),
      );
    }).toList();
  }
}



