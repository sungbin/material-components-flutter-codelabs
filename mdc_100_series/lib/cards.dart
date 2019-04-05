

import 'my_model/products_repository.dart';
import 'my_model/product.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Cards extends StatefulWidget {
  
  _CardsState createState() => _CardsState();
}

List<Icon> _drawStars(int n, {double start_size : 15.0}) {
  List<Icon> icons = List<Icon>();
  for(int i = 0; i<n; i++)
    icons.add(Icon(Icons.star, color: Colors.yellow, size: start_size,));
  return icons;
}

List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts();
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
              )
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.0, 6.0, 0.0, 0.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, color: Theme.of(context).primaryColor,),
                        SizedBox(width: 4.0,),
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
                          ]
                        )
                      ]
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        child: 
                          Text(
                            'more',
                            style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 12),
                            textAlign: TextAlign.right,
                          ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void> (
                            builder: (BuildContext context) {
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
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(Icons.favorite_border,size: 40.0, color: Colors.red,),
                                          )
                                        ],
                                      )
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(children: _drawStars(product.star_count,start_size: 30.0)),
                                          SizedBox(height: 20.0,),
                                          Text(
                                            product.name,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Theme.of(context).accentColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 20.0,),
                                          Row(children: <Widget>[Icon(Icons.location_on,color: theme.primaryColorLight,),Text(product.location,style: TextStyle(color: theme.primaryColorLight),)],),
                                          SizedBox(height: 8.0,),
                                          Row(children: <Widget>[Icon(Icons.phone,color: theme.primaryColorLight,),Text(product.phone,style: TextStyle(color: theme.primaryColorLight),)],),
                                          Divider(),
                                          Text(product.description,style: TextStyle(color: theme.primaryColorLight,fontSize: 14,height: 1.5),),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                                
                              );
                            }
                          ));
                        },
                        textTheme: ButtonTextTheme.primary, 
                      ),
                    ),
                  ]
                )
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
        );
  }
}