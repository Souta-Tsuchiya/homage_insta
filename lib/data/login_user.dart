class LoginUser {
  final String userId;
  final String displayName;
  final String appName;
  final String email;
  final String photoURL;
  final String bio;

//<editor-fold desc="Data Methods">

  const LoginUser({
    required this.userId,
    required this.displayName,
    required this.appName,
    required this.email,
    required this.photoURL,
    required this.bio,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginUser &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          displayName == other.displayName &&
          appName == other.appName &&
          email == other.email &&
          photoURL == other.photoURL &&
          bio == other.bio);

  @override
  int get hashCode =>
      userId.hashCode ^
      displayName.hashCode ^
      appName.hashCode ^
      email.hashCode ^
      photoURL.hashCode ^
      bio.hashCode;

  @override
  String toString() {
    return 'LoginUser{' +
        ' userId: $userId,' +
        ' displayName: $displayName,' +
        ' appName: $appName,' +
        ' email: $email,' +
        ' photoURL: $photoURL,' +
        ' bio: $bio,' +
        '}';
  }

  LoginUser copyWith({
    String? userId,
    String? displayName,
    String? appName,
    String? email,
    String? photoURL,
    String? bio,
  }) {
    return LoginUser(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      appName: appName ?? this.appName,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'displayName': this.displayName,
      'appName': this.appName,
      'email': this.email,
      'photoURL': this.photoURL,
      'bio': this.bio,
    };
  }

  factory LoginUser.fromMap(Map<String, dynamic> map) {
    return LoginUser(
      userId: map['userId'] as String,
      displayName: map['displayName'] as String,
      appName: map['appName'] as String,
      email: map['email'] as String,
      photoURL: map['photoURL'] as String,
      bio: map['bio'] as String,
    );
  }

//</editor-fold>
}
