import 'package:flutter/material.dart';

class ScaffoldMessengerService {
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  void setKey(GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey) {
    this.scaffoldMessengerKey = scaffoldMessengerKey;
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(
    SnackBar snackBar,
  ) {
    return scaffoldMessengerKey?.currentState?.showSnackBar(snackBar);
  }
}
