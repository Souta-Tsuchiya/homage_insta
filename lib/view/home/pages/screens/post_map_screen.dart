import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homage_insta/data/location.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

class PostMapScreen extends StatefulWidget {
  final Location location;

  PostMapScreen({required this.location});

  @override
  State<PostMapScreen> createState() => _PostMapScreenState();
}

class _PostMapScreenState extends State<PostMapScreen> {
  late LatLng _latLng;
  late CameraPosition _cameraPosition;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  GoogleMapController? _mapController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _latLng = LatLng(widget.location.latitude, widget.location.longitude);
    _cameraPosition = CameraPosition(target: _latLng, zoom: 12.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).selectPlace),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => _changeLocation(),
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        onMapCreated: onMapCreated,
        onTap: onMapTapped,
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void onMapTapped(LatLng latLng) {
    final markerId = MarkerId("selected");
    _latLng = latLng;
    final marker = Marker(
      markerId:  markerId,
      position: latLng,
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  _changeLocation() {
    final postViewModel = context.read<PostViewModel>();
    postViewModel.changeLocation(_latLng.latitude, _latLng.longitude);

    Navigator.pop(context);
  }
}
