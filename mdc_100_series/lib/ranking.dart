import 'package:charts_flutter/flutter.dart' as charts;
import 'my_model/product.dart';
import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  Ranking(this._products);
  List<Product> _products;

  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {

  @override
  Widget build(BuildContext context) {
    List<Product> favorite_products = widget._products.where((Product p) {
      return p.is_favorite;
    }).toList();
    List<Product> productList0 = favorite_products.where((Product p) {
      return p.location == 'Silla Stay';
    }).toList();
    List<Product> productList1 = favorite_products.where((Product p) {
      return p.location == 'Ramada';
    }).toList();
    List<Product> productList2 = favorite_products.where((Product p) {
      return p.location == 'Pohang';
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Users Ranking"),
      ),
      body: Center(
        child: 
        Padding(
          padding: EdgeInsets.fromLTRB(10, 200, 10, 200),
          child: SimpleBarChart(_createSampleData([productList0.length,productList1.length,productList2.length,])),
        )
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData(List<int> counts) {
    final List<OrdinalSales> data = [
      OrdinalSales('Silla Stay', counts[0]),
      OrdinalSales('Ramada', counts[1]),
      OrdinalSales('Pohang', counts[2]),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.black,
        domainFn: (OrdinalSales sales, _) => sales.location,
        measureFn: (OrdinalSales sales, _) => sales.count,
        data: data,
      )
    ];
  }
}


class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final List<OrdinalSales> data = [
      new OrdinalSales('Silla Stay', 2),
      new OrdinalSales('Ramada', 4),
      new OrdinalSales('Pohang', 5),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.black,
        domainFn: (OrdinalSales sales, _) => sales.location,
        measureFn: (OrdinalSales sales, _) => sales.count,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String location;
  final int count;

  OrdinalSales(this.location, this.count);
}