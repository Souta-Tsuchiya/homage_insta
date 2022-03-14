import 'package:flutter/material.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/util/const.dart';
import 'package:homage_insta/view_model/post_view_model.dart';
import 'package:provider/provider.dart';
import '../post_components/post_caption_part.dart';
import '../post_components/post_location_part.dart';

class PostUploadScreen extends StatelessWidget {
  final PostUploadType uploadType;

  PostUploadScreen({required this.uploadType});

  @override
  Widget build(BuildContext context) {
    final postViewModel = context.read<PostViewModel>();

    if (!postViewModel.isImagePicked && !postViewModel.isLoading) {
      Future(() {
        postViewModel.imagePicked(uploadType);
      });
    }

    return Selector<PostViewModel, bool>(
      selector: (context, postViewModel) => postViewModel.isLoading,
      builder: (context, isLoading, child) {
        final image = (postViewModel.imageFile == null)
            ? Image.asset("assets/images/no_image.png")
            : Image.file(postViewModel.imageFile!);

        return Scaffold(
          appBar: AppBar(
            leading: isLoading
                ? Container()
                : IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => _cancelPost(context),
                  ),
            title: isLoading ? Text(S.of(context).underProcessing) : Text(S.of(context).post),
            actions: [
              (isLoading || !postViewModel.isImagePicked)
                  ? IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => _cancelPost(context),
                    )
                  : IconButton(
                      icon: Icon(Icons.done),
                      onPressed: () => {},
                    ),
            ],
          ),
          body: isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Divider(),
                    PostCaptionPart(
                      openMode: PostCaptionOpenMode.FROM_POST,
                      image: image,
                    ),
                    Divider(),
                    PostLocationPart(),
                    Divider(),
                  ],
                ),
        );
      },
    );
  }

  _cancelPost(BuildContext context) {
    Navigator.pop(context);
  }
}
