import 'package:connectivity_plus/connectivity_plus.dart';

class Utils {


  static Future<bool> isConnected() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }
    return true;
  }



}
