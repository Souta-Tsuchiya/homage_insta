import 'package:flutter/material.dart';
import 'package:homage_insta/util/const.dart';
import 'package:homage_insta/view/home/pages/post_components/post_caption_part_components/enlarge_image_screen.dart';
import 'package:homage_insta/view/home/pages/post_components/post_caption_part_components/hero_image.dart';
import 'package:homage_insta/view/home/pages/post_components/post_caption_part_components/post_caption_input_text_field.dart';

class PostCaptionPart extends StatelessWidget {
  final Image image;
  final PostCaptionOpenMode openMode;

  PostCaptionPart({required this.image, required this.openMode});

  @override
  Widget build(BuildContext context) {
    if (openMode == PostCaptionOpenMode.FROM_POST) {
      return ListTile(
        leading: HeroImage(
          image: image,
          onTap: () => _displayLargeImage(context, image),
        ),
        title: PostCaptionInputTextField(),
      );
    } else {
      return Container();
    }
  }

  _displayLargeImage(BuildContext context, Image image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnLargeImageScreen(image: image),
      ),
    );
  }
}
