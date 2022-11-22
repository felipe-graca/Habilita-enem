// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SizeProviderWidget extends StatefulWidget {
  final Widget child;
  final Function(Size) onChildSize;

  const SizeProviderWidget(
      {Key? key, required this.onChildSize, required this.child})
      : super(key: key);
  @override
  _SizeProviderWidgetState createState() => _SizeProviderWidgetState();
}

class _SizeProviderWidgetState extends State<SizeProviderWidget> {
  @override
  void initState() {
    _onResize();
    super.initState();
  }

  void _onResize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.size is Size) {
        widget.onChildSize(context.size!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
