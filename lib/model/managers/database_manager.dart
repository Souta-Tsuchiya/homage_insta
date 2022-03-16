import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:homage_insta/data/login_user.dart';
import 'package:homage_insta/data/post.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> checkIsUser(User firebaseUser) async {
    final query = await _db.collection("users").where("userId", isEqualTo: firebaseUser.uid).get();

    if (query.docs.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> resistUser(LoginUser loginUser) async {
    await _db.collection("users").doc(loginUser.userId).set(loginUser.toMap());
  }

  Future<LoginUser> getUser(String userId) async {
    final query = await _db.collection("users").where("userId", isEqualTo: userId).get();
    return LoginUser.fromMap(query.docs[0].data());
  }

  // 写真をfirebaseストレージにアップロード
  Future<String> upLoadImageStorage(File imageFile, String storageId) async {
    // ストレージ上のファイルの保存場所の参照を取得
    final storageRef = FirebaseStorage.instance.ref().child(imageFile.path);

    // 上記で取得した参照先にファイルをアップロード
    final uploadTask = storageRef.putFile(imageFile);

    // 画像ファイルのダウンロードURLを取得
    final downloadUrl =
        await (await uploadTask.then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL()));
    return downloadUrl;
  }

  // 投稿データをfireStoreにアップロード
  Future<void> insertPost(Post post) async{
    await _db.collection("posts").doc(post.postId).set(post.toMap());
  }
}
