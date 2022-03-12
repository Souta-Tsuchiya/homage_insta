import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/util/const.dart';
import 'package:homage_insta/view/common_components/button_with_icon.dart';

import '../screens/post_upload_screen.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ButtonWithIcon(
            icon: FontAwesomeIcons.images,
            label: S.of(context).gallery,
            onPressed: () => _openPostUploadScreen(context, PostUploadType.GALLERY),
          ),
          SizedBox(
            height: 16.0,
          ),
          ButtonWithIcon(
            icon: FontAwesomeIcons.camera,
            label: S.of(context).camera,
            onPressed: () => _openPostUploadScreen(context, PostUploadType.CAMERA),
          ),
        ],
      ),
    );
  }

  _openPostUploadScreen(BuildContext context, PostUploadType uploadType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PostUploadScreen(
          uploadType: uploadType,
        ),
      ),
    );
  }
}
