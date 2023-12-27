import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rite_funeral_flutter/imports.dart';

class GoogleMps extends StatelessWidget {
  const GoogleMps({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
        target: LatLng(
            36.778259,119.417931
        ),
    zoom: 10,
    ));
  }
}
