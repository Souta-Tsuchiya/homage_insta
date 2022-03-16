import 'dart:io';

import 'package:homage_insta/data/location.dart';
import 'package:homage_insta/data/login_user.dart';
import 'package:homage_insta/data/post.dart';
import 'package:homage_insta/model/managers/database_manager.dart';
import 'package:homage_insta/model/managers/location_manager.dart';
import 'package:homage_insta/util/const.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class PostRepository {
  final DatabaseManager dbManager;

  final LocationManager locationManager;

  PostRepository({required this.dbManager, required this.locationManager});

  Future<File?> imagePicked(PostUploadType uploadType) async {
    final imagePicker = ImagePicker();

    if (uploadType == PostUploadType.CAMERA) {
      final pickImage = await imagePicker.pickImage(source: ImageSource.camera);
      return (pickImage != null) ? File(pickImage.path) : null;
    } else {
      final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
      return (pickImage != null) ? File(pickImage.path) : null;
    }
  }

  Future<Location> getLocation() async {
    return await locationManager.getLocation();
  }

  Future<Location> changeLocation(double latitude, double longitude) async {
    return await locationManager.changeLocation(latitude, longitude);
  }

  Future<void> post(
    String postCaption,
    File imageFile,
    Location? location,
    String locationString,
    LoginUser currentUser,
  ) async {
    // 一意のIDの作成(firebaseストレージ用)
    final storageId = Uuid().v1();

    // firebaseストレージに画像をアップロード、アップロードした画像のURLを取得
    final imageUrl = await dbManager.upLoadImageStorage(imageFile, storageId);

    // 一意のIDの作成(投稿データ・fireStore用)
    final postId = Uuid().v1();

    // 投稿データの作成
    final post = Post(
      postId: postId,
      userId: currentUser.userId,
      imageUrl: imageUrl,
      imageStoragePath: imageUrl,
      caption: postCaption,
      locationString: locationString,
      latitude: location != null ? location.latitude : 0.00,
      longitude: location != null ? location.longitude : 0.00,
                     // 現在時刻
      postDateTime: DateTime.now(),
    );

    await dbManager.insertPost(post);
  }
}
