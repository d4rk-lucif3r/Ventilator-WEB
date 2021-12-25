import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:webviewx/webviewx.dart';

// const String link =
//     "https://maps.googleapis.com/maps/api/staticmap?center=&27.2046,77.4977&zoom=18&size=300x300&maptype=terrain&markers=color:red%7Clabel:A%7C27.2046,77.4977&key=AIzaSyA4GfqRu9YuT4CEUlsRZ54fMbtFRSsyReA";

class PopUpMapWindow extends StatefulWidget {
  PopUpMapWindow({
    Key? key,
    required this.getLatlng,
  }) : super(key: key);

  final LatLng getLatlng;

  @override
  _PopUpMapWindowState createState() => _PopUpMapWindowState();
}

class _PopUpMapWindowState extends State<PopUpMapWindow> {
  late LatLng _latLng;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _latLng = widget.getLatlng;
    debugPrint("Map Created");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _latLng = LatLng(28.479261666666666, 76.90485166666667);
    debugPrint("Map Disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // late WebViewXController webviewController;

    return LayoutBuilder(
      builder: (context, constraints) {

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
            bottom: 10,
            top: 0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: ui.Radius.circular(10),
              bottomRight: ui.Radius.circular(10),
            ),
          ),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: ui.Radius.circular(10),
                bottomRight: ui.Radius.circular(10),
              ),
              child: mapWindow(_latLng)),
        );
      },
    );
  }
}

Widget mapWindow(LatLng latLngValue) {
  String htmlId = "static_map";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
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
      ..center = latLngValue
      ;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = latLngValue
      ..map = map
      ..visible = true
      ..clickable = false);

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
