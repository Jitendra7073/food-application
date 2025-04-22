import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  GoogleMapController? _mapController;
  LatLng _initialPosition = const LatLng(37.7749, -122.4194);
  String _address = "Searching address...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.requestPermission();
    if (!serviceEnabled || permission == LocationPermission.denied) return;

    final position = await Geolocator.getCurrentPosition();
    _initialPosition = LatLng(position.latitude, position.longitude);
    _isLoading = false;
    setState(() {});
    _getAddressFromLatLng(_initialPosition);
  }

  Future<void> _getAddressFromLatLng(LatLng pos) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);
      Placemark place = placemarks[0];
      _address =
          "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      setState(() {});
    } catch (e) {
      _address = "Unable to fetch address";
      setState(() {});
    }
  }

  void _onCameraIdle() async {
    LatLng center = await _mapController!.getLatLng(
      ScreenCoordinate(
        x: MediaQuery.of(context).size.width ~/ 2,
        y: MediaQuery.of(context).size.height ~/ 2,
      ),
    );
    _getAddressFromLatLng(center);
  }

  Future<void> _saveAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_address', _address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialPosition, zoom: 16),
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  onCameraIdle: _onCameraIdle,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
                Center(
                  child: const Icon(Icons.location_pin,
                      size: 40, color: Colors.red),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _address,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 40,
                  right: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      await _saveAddress();
                      Navigator.pop(context, _address);
                    },
                    child: const Text("Confirm Location",
                        style: TextStyle(fontSize: 18)),
                  ),
                )
              ],
            ),
    );
  }
}
