import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homage_insta/data/location.dart';
import 'package:homage_insta/util/const.dart';
import 'package:homage_insta/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class PostLocationPart extends StatelessWidget {
  const PostLocationPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = context.read<PostViewModel>();
    final location = postViewModel.location;
    return ListTile(
      title: Text(
        postViewModel.locationString, style: TextStyle(fontFamily: RegularFont, fontSize: 16.0),),
      subtitle: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Chip(label: Text(S.of(context).latitude)),
          SizedBox(width: 8.0,),
          Text(location != null ? location.latitude.toStringAsFixed(2) : "0.00"),
          SizedBox(width: 8.0,),
          Chip(label: Text(S.of(context).longitude)),
          SizedBox(width: 8.0,),
          Text(location != null ? location.longitude.toStringAsFixed(2) : "0.00"),
        ],
      ),
      trailing: IconButton(
        icon: FaIcon(FontAwesomeIcons.mapMarkerAlt),
        onPressed: () => _displayMap(context, location),
      ),
    );
  }

  _displayMap(BuildContext context, Location? location) {}
}
