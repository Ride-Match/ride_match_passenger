import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ride_match/core/utils/validators';
import 'package:ride_match/core/widgets/custome_input.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.0404, 38.7633),
    zoom: 17.4746,
  );
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(9.0404, 38.7633),
        infoWindow: InfoWindow(title: 'Addis Ababa Institute of Technology'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
            markers: markers,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            padding: EdgeInsets.only(top: 60.h),
          ),
          Positioned(
            left: 4.w,
            top: 10.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.w),
                ),
                padding: EdgeInsets.all(0.6.w),
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withGreen(200),
                elevation: 5,
              ),
              child: Icon(Icons.menu,
                  color: Theme.of(context).colorScheme.surface, size: 10.w),
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        constraints: BoxConstraints(maxHeight: 30.h),
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5.w)),
        ),
        builder: (context) => LocationBottomSheet(),
      ),
    );
  }
}

class LocationBottomSheet extends StatefulWidget {
  @override
  _LocationBottomSheetState createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
  TextEditingController searchController = TextEditingController();
  List<String> locations = [
    "Bole",
    "Arat Kilo",
    "Piazza",
    "Merkato",
    "Megenagna",
    "Lideta",
    "Kazanchis",
    "Sarbet",
    "CMC",
    "Gurd Shola"
  ];
  List<String> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    filteredLocations = locations;
  }

  void filterLocations(String query) {
    setState(() {
      filteredLocations = locations
          .where((location) =>
              location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 12),
          CustomeTextField(
              hintText: 'Search location',
              controller: searchController,
              validator: textValidator),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: filteredLocations.length,
              separatorBuilder: (context, index) => Container(
                width: 80.w,
                height: 0.1.w,
                color: Theme.of(context).colorScheme.secondary,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 6.w,
                  ),
                  title: Text(
                    filteredLocations[index],
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 4.w),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
