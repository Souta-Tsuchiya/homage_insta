import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/util/const.dart';
import 'package:homage_insta/view/home/pages/feed_components/feed_sub_page.dart';
import 'package:homage_insta/view/home/pages/screens/post_upload_screen.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.cameraRetro),
          onPressed: () {
            _launchCamera(context);
          },
        ),
        title: Text(S.of(context).appTitle, style: TextStyle(fontFamily: TitleFont),),
      ),
      body: FeedSubPage(feedMode: FeedMode.FROM_FEED),
    );
  }

  void _launchCamera(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PostUploadScreen(uploadType: PostUploadType.CAMERA),
      ),
    );
  }
}
