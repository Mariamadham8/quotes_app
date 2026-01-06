import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {

Future<bool> isConnected();


}

class NetworkInfoImpl implements NetworkInfo{
  @override
  Future<bool> isConnected() async {
     return await InternetConnection().hasInternetAccess;
  }
}