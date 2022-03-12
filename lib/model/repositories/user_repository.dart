import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homage_insta/data/login_user.dart';
import 'package:homage_insta/model/managers/database_manager.dart';

class UserRepository{
  final DatabaseManager dbManager;

  UserRepository({required this.dbManager});

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static LoginUser? currentUser;

  // アプリ起動時のサインインのチェック
  Future<bool> checkSignIn() async{
    final firebaseUser = _auth.currentUser;

    if(firebaseUser != null) {
      // サインイン済みの時にログインユーザー情報を取得しておく
      currentUser = await dbManager.getUser(firebaseUser.uid);
      return true;
    }else{
      return false;
    }
  }

  // ログイン画面からのサインイン処理
  Future<bool> signIn() async{
    try {
      // グーグルサインイン処理
      GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();

      // グーグルサインイン出来た事を証明する認証情報の取得
      if(signInAccount == null) return false;
      GoogleSignInAuthentication signInAuthentication = await signInAccount.authentication;

      // グーグルサインイン認証情報からfirebase認証するための信用状作成
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        idToken: signInAuthentication.idToken,
        accessToken: signInAuthentication.accessToken,
      );

      // firebase認証処理
      final firebaseUser = (await _auth.signInWithCredential(credential)).user;

      // 認証失敗したらリターン
      if(firebaseUser == null) {
        return false;
      }

      // firebase認証したユーザーがDBにいるかどうかの確認
      final isUser = await dbManager.checkIsUser(firebaseUser);

      // DBに登録
      if(!isUser) {
        await dbManager.resistUser(_convertToLoginUser(firebaseUser));
      }

      // DBに登録したユーザーデータの取得
      currentUser = await dbManager.getUser(firebaseUser.uid);

      return true;
    }catch(e) {
      print(e);
      return false;
    }
  }

  // firebaseUserからLoginUserへの変換
  LoginUser _convertToLoginUser(auth.User firebaseUser) {
    return LoginUser(
        userId: firebaseUser.uid,
        displayName: firebaseUser.displayName ?? "",
        appName: firebaseUser.displayName ?? "",
        email: firebaseUser.email ?? "",
        photoURL: firebaseUser.photoURL ?? "",
        bio: "",
    );
  }

}