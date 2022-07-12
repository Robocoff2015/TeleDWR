import 'package:dwr0001/Application/burgerMenu/burgermenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = {};
  final mark = [
    LatLng(13.777183, 100.629559),
    LatLng(13.7785028, 100.6149977),
    LatLng(13.777694, 100.624656),
  ];

  void initState() {
    super.initState();

    for (var item in mark) {
      setState(() {
        _markers.add(
          Marker(
            width: 40,
            height: 40,
            point: item,
            builder: (ctx) => Container(
                child: IconButton(
              icon: Icon(Icons.location_on_outlined),
              color: Color(0xff6200eee),
              iconSize: 45.0,
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        color: Colors.white,
                        child: Text("TEST"),
                      );
                    });
              },
            )),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationBurgerMenuWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('แผนที่'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(13.782694, 100.5549202),
          zoom: 10.25,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayerOptions(markers: _markers.toList())
        ],
      ),
    );
  }
}
