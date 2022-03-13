import 'package:flutter/material.dart';
import 'package:homage_insta/util/const.dart';
import 'package:homage_insta/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class PostUploadScreen extends StatelessWidget {
  final PostUploadType uploadType;
  PostUploadScreen({required this.uploadType});

  @override
  Widget build(BuildContext context) {
    final postViewModel = context.read<PostViewModel>();

    if(!postViewModel.isImagePicked && !postViewModel.isLoading) {
      Future(() {
        postViewModel.imagePicked(uploadType);
      });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appTitle),
      ),
      body: Container(
        child: Center(child: Text("PostUploadScreen")),
      ),
    );
  }
}
