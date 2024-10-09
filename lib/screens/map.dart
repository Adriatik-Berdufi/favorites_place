import 'package:favorites_place/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      address: '',
      lat: 37.422,
      lng: -122.084,
    ),
    this.isSelecting = true,
  });
  final PlaceLocation location;

  final bool isSelecting;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.lat, widget.location.lng),
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('map1'),
            position: LatLng(widget.location.lat, widget.location.lng),
          ),
        },
      ),
    );
  }
}
