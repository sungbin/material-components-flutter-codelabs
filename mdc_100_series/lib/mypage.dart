import 'my_model/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyPage extends StatefulWidget {
  MyPage(this._products);
  List<Product> _products;

  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> favorite_products = widget._products.where((Product p) {
        return p.is_favorite;
      }).toList();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text("My Page"),
      ),
      body: Center(
        child: CarouselSlider(
          height: 250.0,
          items: favorite_products.map((product) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child:  Image.asset(
                              product.assetName,
                              fit: BoxFit.fitWidth,
                            ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: Text(product.name,style: TextStyle(color: Colors.white,fontSize: 26.0,fontWeight: FontWeight.bold),),
                          
                        )
                        
                      ],
                    )
                  ],),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

}