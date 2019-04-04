

import 'my_model/products_repository.dart';
import 'my_model/product.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Cards extends StatefulWidget {
  
  _CardsState createState() => _CardsState();
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
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 0.0),
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
                            Icon(Icons.star_border, color: Colors.yellow, size: 15.0,),
                            Text(
                              product.name,
                              style: theme.textTheme.body1,
                              maxLines: 1,
                            ),
                            SizedBox(height: 6.0),
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
                                body: Container(
                                  child: 
                                  Stack(
                                    children: <Widget>[
                                      PhotoHero(
                                        photo: product.assetName,
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.all(20.0),
                                        child: Icon(Icons.favorite_border,size: 40.0, color: Colors.red,),
                                      )
                                    ],
                                    
                                  )
                                  
                                ),
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
        );;
  }
}
class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.pachage, this.onTap/*, this.width*/ }) : super(key: key);

  final String photo;
  final String pachage;
  final VoidCallback onTap;
  // final double width;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: AspectRatio(
        aspectRatio: 487 / 400,
        child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.asset(
                photo,
                package: pachage,
                fit: BoxFit.fitHeight,
                height: 100.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}