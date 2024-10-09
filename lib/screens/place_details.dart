import 'package:favorites_place/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:favorites_place/models/place.dart';
import 'package:favorites_place/models/enviroment.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final Place place;
  String get locationImage {
    final lat = place.location.lat;
    final lng = place.location.lng;
    final apiKey = Enviroment.apiKey;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=5&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$apiKey';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const MapScreen(
                          isSelecting: false,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(locationImage),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
