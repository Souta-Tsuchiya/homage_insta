import 'package:flutter/material.dart';
import 'package:homage_insta/view/home/pages/post_components/post_caption_part_components/hero_image.dart';

class EnLargeImageScreen extends StatelessWidget {
  final Image image;

  EnLargeImageScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: HeroImage(
          image: image,
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
