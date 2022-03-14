import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homage_insta/data/location.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

class PostMapScreen extends StatelessWidget {
  final Location location;

  PostMapScreen({required this.location});

  @override
  Widget build(BuildContext context) {
    LatLng _latLng = LatLng(location.latitude, location.longitude);
    CameraPosition _cameraPosition = CameraPosition(target: _latLng, zoom: 15.0);



    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).selectPlace),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => {},
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        onMapCreated: (controller) => onMapCreated(controller, context),
        // onTap: ,
        // myLocationEnabled: ,

      ),
    );
  }

  void onMapCreated(GoogleMapController controller, BuildContext context) {
    final postViewModel = context.read<PostViewModel>();
    postViewModel.onMapCreated(controller);
  }
}
