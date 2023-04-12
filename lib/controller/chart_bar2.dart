import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coba2/controller/chart_bar.dart';

class SubsriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  SubsriberChart({required this.data});

  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
        id: "Subscribers",
        data: data,
        domainFn: (SubscriberSeries series, _) => series.year,
        measureFn: (SubscriberSeries series, _) => series.subscriber,
        colorFn: (SubscriberSeries series, _) => series.barColor,
      )
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Data Perbandingan BEP",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
