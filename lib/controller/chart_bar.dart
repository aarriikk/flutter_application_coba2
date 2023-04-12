import 'dart:ffi';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';

class SubscriberSeries {
  final String year;
  final int subscriber;
  final charts.Color barColor;

  SubscriberSeries(
      {required this.year, required this.subscriber, required this.barColor});
}
