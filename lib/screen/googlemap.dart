import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String htmlId = "7";
    // final PlatformViewRegistry platformViewRegistry = PlatformViewRegistry._();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(41.332931708525914,69.28397573743348);
      // 41.332961708525914, 69.28397573743348

      // another location
      final myLatlng2 = LatLng(41.332931708525914, 69.28397573743348);

      final mapOptions = MapOptions()
        ..zoom = 18
        ..maxZoom = 20
        ..center = LatLng(41.332931708525914, 69.28397573743348);

      final elem = DivElement()
        ..id = htmlId
        ..style.color = "black"
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      final marker = Marker(
          MarkerOptions()
        ..position = myLatlng
            ..icon = 'assets/images/tss.png'
        ..map = map);
      // ..icon =
      //     'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');

      // Another marker
      Marker(
        MarkerOptions()
          ..position = myLatlng2
          ..map = map,
      );

      final infoWindow =
          InfoWindow(InfoWindowOptions()..content = contentString);
      marker.onClick.listen((event) => infoWindow.open(map, marker));
      return elem;
    });
    return HtmlElementView(viewType: htmlId);
  }
}

var contentString = '<div id="content">' +
    '<div id="siteNotice">' +
    '</div>' +
    '<h1 id="firstHeading" class="firstHeading">"TEXNIKA ADVANS SERVIS"</h1>' +
    '<div id="bodyContent">' +
    '\"Orient Business Center\" блок 504, ' +
    '95А Амир Темур шоҳ кўчаси, ' +
    'Tashkent 100084, Узбекистан ' +
    '</div>' +
    '</div>';


