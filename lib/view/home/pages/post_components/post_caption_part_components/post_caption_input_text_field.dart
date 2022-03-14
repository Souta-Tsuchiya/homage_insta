import 'package:flutter/material.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

class PostCaptionInputTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postViewModel = context.read<PostViewModel>();

    return TextField(
      controller: postViewModel.postCaptionController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        hintText: S.of(context).inputCaption,
        border: InputBorder.none
      ),
      onChanged: (value) => _onCaptionUpdated(context, value),
    );
  }

  _onCaptionUpdated(BuildContext context, String value) {
    final postViewModel = context.read<PostViewModel>();
    postViewModel.onCaptionUpdated(value);
  }


}
