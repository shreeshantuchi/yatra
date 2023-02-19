import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yatra/location/location_provider.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final provmaps = Provider.of<ProviderMaps>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Google Maps - Route OSRM",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FlutterMap(
                options: MapOptions(
                  onTap: ((tapPosition, point) => provmaps.addMarker(point)),
                  center: provmaps.initialPos,
                  zoom: 9.2,
                ),
                nonRotatedChildren: [
                  AttributionWidget.defaultWidget(
                    source: 'OpenStreetMap contributors',
                    onSourceTapped: null,
                  ),
                ],
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: provmaps.markers.toList(),
                  ),
                  PolylineLayer(
                    polylines: provmaps.polyline.toList(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                  //color: Colors.white,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          height: 220,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: provmaps.markers.length,
                                  itemBuilder: (context, index) {
                                    return InputChip(
                                        label: Text(
                                            provmaps.markers
                                                    .elementAt(index)
                                                    .point
                                                    .latitude
                                                    .toString()
                                                    .substring(0, 7) +
                                                "," +
                                                provmaps.markers
                                                    .elementAt(index)
                                                    .point
                                                    .longitude
                                                    .toString()
                                                    .substring(0, 7),
                                            style:
                                                TextStyle(color: Colors.white)),
                                        backgroundColor: index == 0
                                            ? Colors.green
                                            : Colors.blue,
                                        onDeleted: () {
                                          provmaps.cleanpoint(index);
                                          setState(() {});
                                        });
                                  },
                                ),
                              ),
                              Text("Distance: ${provmaps.distance}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )),
                      FloatingActionButton(
                        elevation: 1,
                        backgroundColor: Colors.blueAccent,
                        onPressed: provmaps.routermap,
                        child: Icon(Icons.directions),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
