import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homage_insta/data/login_user.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> checkIsUser(User firebaseUser) async{
    final query = await _db.collection("users").where("userId", isEqualTo: firebaseUser.uid).get();

    if(query.docs.length > 0) {
      return true;
    }else{
      return false;
    }
  }

  Future<void> resistUser(LoginUser loginUser) async{
    await _db.collection("users").doc(loginUser.userId).set(loginUser.toMap());
  }

  Future<LoginUser> getUser(String userId) async{
    final query = await _db.collection("users").where("userId", isEqualTo: userId).get();
    return LoginUser.fromMap(query.docs[0].data());
  }

}