import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:webviewx/webviewx.dart';

const String link =
    "https://maps.googleapis.com/maps/api/staticmap?center=&27.2046,77.4977&zoom=18&size=300x300&maptype=terrain&markers=color:red%7Clabel:A%7C27.2046,77.4977&key=AIzaSyA4GfqRu9YuT4CEUlsRZ54fMbtFRSsyReA";

class PopUpMapWindow extends StatefulWidget {
  const PopUpMapWindow({Key? key}) : super(key: key);

  @override
  _PopUpMapWindowState createState() => _PopUpMapWindowState();
}

class _PopUpMapWindowState extends State<PopUpMapWindow> {
  @override
  Widget build(BuildContext context) {
    late WebViewXController webviewController;

    return LayoutBuilder(
      builder: (context, constraints) {
        // final mapOptions = MapOptions()
        //   ..zoom = 18
        //   ..center = LatLng(-34.397, 150.644);
        // GMap(document.getElementById("map-canvas"), mapOptions);

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: mapWindow(),
        );
      },
    );
  }
}

Widget mapWindow() {
  String htmlId = "static_map";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng = LatLng(28.479261666666666, 76.90485166666667);

    final mapOptions = MapOptions()
      ..zoom = 15
      ..streetViewControl = false
      ..fullscreenControl = false
      ..maxZoom = 18
      ..minZoom = 16
      ..mapTypeId = MapTypeId.ROADMAP
      ..mapTypeControl = false
      ..draggable = false
      ..keyboardShortcuts = false
      ..disableDefaultUI = true
      ..center = myLatlng;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = myLatlng
      ..map = map
      ..visible = true
      ..clickable = false);

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
