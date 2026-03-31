import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapView extends StatelessWidget{
///Center of the map
final Lating Center;

///Initial zoom level 
final double zoom;

///Map markers to render 
final List<MapMarkerData> markers;

///Optional polyline points (e.g. a route between two locations).
final List<Lating>? polyLinePoints;

///Color of the polyline
final Color polylineColor;

///Whether the user can pan / zoom the map.
final bool interactive;

///When true, titles are color- inverted to approximate a dark theme
final bool darkMode;

const MapView({
    super.key,
    required this.center,
    this.zoom = 14,
    this.markers = const[],
    this.polylinePoints,
    this.polylineColor = const Color.fromARGB(255, 45, 177, 73),
    this.interactive = true,
    this.darkMode = false,

});

@override
Widget build (BuildContext context){
    final map = FlutterMap(
        options: MapOptions(
            initialCenter: center,
            initialZoom: zoom,
            interactionOptions: InteractionOptions(
                flags: interactive ? InteractiveFlag.all : InteractiveFlag.none,
            ),//interactionOption
        ),//MapOptions
    
        Childern: [
            //Tile layer
            TileLayer(
                 urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                 userAgentPackageName: 'com.fixongo.app',
                 maxZoom: 19,
            ),//TitleLayer

            // Polyline layer
            if (polylinePoints != null && polylinePoints!.length >= 2)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: polylinePoints,
                    strokeWidth:4;
                    color : polylinecolor,
                  ), //Polyline
                ],
              ),//PolylineLayer

              //Marker layer
              if (markers.isNotEmpty)
                 MarkerLayer(
                  markers: Markers
                      .map(
                        (m) =>Marker(
                          point: m.position,
                          width: m.width,
                          height: m.height,
                          child: m.child,
                        ),//Marker
                      )
                      .toList(),
                  
                 ),//MarkerLayer
                 if (markers.isNotEmpty)
                    MarkerLayer(
                      markers: markers
        ]                .map(
                           (m) => Marker(
                              point: m.position,
                              width: m.width,
                              height: m.height,
                              child: m.child,
                           ),
                        )
                        .toList(),
                     ), //MarkerLayer

                // Attribution
                const RichAttributionWidget(
                  attributions: [TextSourceAttribution('OpenStreetMap contributors')],
                ),//RichAttributionWidget
              ],
          );//FlutterMap

          // For dark mode, apply a colour filter to invert + shift hue.
          if (darkmode){
            return ColorFiltered(
              colorFilter: Const ColorFilter.matrix(<double>[
                -1, 0, 0, 0, 255, //
                0, -1, 0, 0, 255, //
                0, 0, -1, 0, 255, //
                0, 0, 0, 1, 0, //
          }),
          child: map,
          );//colorFiltered
            )
          }  
       return map;

       }
    }
/// Data model for a single map marker.
class MapMarkerData {
  final LatLng position;
  final Widget child;
  final double width;
  final double height;

  const MapMarkerData({
    required this.position,
    required this.child,
    this.width = 40,
    this.height = 40,
});


}