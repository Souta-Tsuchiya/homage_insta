import 'package:homage_insta/data/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;

class LocationManager {
  Future<Location> getLocation() async {
    // 端末設定の位置情報サービスのオン/オフチェック
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) return Future.error("位置情報サービスがオフになっています");

    // 端末のパーミッションチェック
    LocationPermission permission = await Geolocator.checkPermission();
    // 端末の設定がオフならユーザーにリクエスト
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("位置情報へのアクセスをユーザーに拒否されました");
      }
    }
    // 端末の設定が完全オフならリターン
    if (permission == LocationPermission.deniedForever) {
      return Future.error("永遠拒否");
    }

    // 位置情報取得
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // 場所の詳細情報取得
    final placeMarks =
        await geoCoding.placemarkFromCoordinates(position.latitude, position.longitude);
    final placeMark = placeMarks.first;

    // 場所の位置情報・詳細情報をLocationに変換してリターン
    return Future.value(
      Location(
        latitude: position.latitude,
        longitude: position.longitude,
        country: placeMark.country ?? "",
        state: placeMark.administrativeArea ?? "",
        city: placeMark.locality ?? "",
      ),
    );
  }
}
