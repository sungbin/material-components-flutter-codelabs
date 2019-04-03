

import 'model/products_repository.dart';
import 'model/product.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
class Cards extends StatefulWidget {
  
  _CardsState createState() => _CardsState();
}

List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

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
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.0, 12.0, 16.0, 8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Theme.of(context).primaryColor,),
                    SizedBox(width: 4.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.star_border, color: Colors.yellow, size: 15.0,),
                        Text(
                          product.name,
                          style: theme.textTheme.body1,
                          maxLines: 1,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          formatter.format(product.price),
                          style: theme.textTheme.body2,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'more',
                            style: TextStyle(color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context),
        );;
  }
}