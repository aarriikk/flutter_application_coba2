import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as Ui;

class Utils {
  static var key;

  static capture(GlobalKey) async {
    if (key == null) return null;

    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: Ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }
}
