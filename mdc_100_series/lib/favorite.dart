import 'my_model/product.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  Favorite(this._products);
  List<Product> _products;

  _FavoriteState createState() => _FavoriteState();
}

List<Product> products = null;

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    products = widget._products;
    List<Product> favorite_products = products.where((Product p) {
      return p.is_favorite;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Hotels"),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: favorite_products.length,
        itemBuilder: (context, index) {
          final Product item = favorite_products[index];
          return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify Widgets.
              key: Key(item.toString()),
              // We also need to provide a function that tells our app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from our data source.
                setState(() {
                  favorite_products.remove(item);
                  item.toggle();
                });

                // Then show a snackbar!
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // Show a red background as the item is swiped away
              background: Container(color: Colors.red),
              child: Padding(
                padding:  EdgeInsets.all(2.0),
                child: ListTile(title:Text("     "+favorite_products[index].name,style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            );

        },
      )
    );
  }

}