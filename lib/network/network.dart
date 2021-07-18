import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetwork {
  Future isConnected();
}

class Network implements INetwork{

  @override
  Future<bool> isConnected() async{
    final connectionChecker = InternetConnectionChecker();
    return connectionChecker.hasConnection;
  }
}