import 'package:flutter/material.dart';
import 'package:homage_insta/util/const.dart';

import '../../../generated/l10n.dart';

class PostUploadScreen extends StatelessWidget {
  final PostUploadType uploadType;
  PostUploadScreen({required this.uploadType});

  @override
  Widget build(BuildContext context) {
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
