import '../core.dart';

class InternetState {
  final _isConnected = Atom<bool>(false);
  bool get isConnected => _isConnected.value;
  void setIsConnected(bool newValue) => _isConnected.value = newValue;
}
