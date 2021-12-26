import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WEBVIEW extends StatefulWidget {
  const WEBVIEW({Key? key}) : super(key: key);

  @override
  _WEBVIEWState createState() => _WEBVIEWState();
}

class _WEBVIEWState extends State<WEBVIEW> {
  late Widget _iframeWidget;

  final IFrameElement _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    _iframeElement.height = '300';
    _iframeElement.width = '300';
    _iframeElement.name = 'map';
    _iframeElement.src =
        'https://maps.googleapis.com/maps/api/staticmap?center=&27.2046,77.4977&zoom=18&size=400x400&maptype=terrain&markers=color:red%7Clabel:A%7C27.2046,77.4977&key=AIzaSyCROBDc99LcRZD-jF8aAmpMxUZY9IGu5v0';
    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        height: 450,
        color: Colors.redAccent,
        child: _iframeWidget,
      ),
    );
  }
}
