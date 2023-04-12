import 'package:flutter/material.dart';

class WidgettoImage extends StatefulWidget {
  final Function(GlobalKey key) builder;

  const WidgettoImage({super.key, required this.builder});

  @override
  State<WidgettoImage> createState() => _WidgettoImageState();
}

class _WidgettoImageState extends State<WidgettoImage> {
  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
    );
  }
}
