import 'package:atom_poc/core.dart';
import 'package:flutter/material.dart';

import '../services/scaffold_messenger_service.dart';
import '../states/internet_state.dart';
import '../states/product_state.dart';

class ProductOnSaleReducer extends Reducer {
  final ProductState productState;
  final InternetState internetState;
  final ScaffoldMessengerService scaffoldMessengerService;

  ProductOnSaleReducer({
    required this.productState,
    required this.internetState,
    required this.scaffoldMessengerService,
  }) {
    observe(
      () => [internetState.isConnected, productState.price],
      onConnectionAndPriceChange,
    );
  }

  void onConnectionAndPriceChange(List data) {
    debugPrint('[ProductOnSaleController] onConnectionAndPriceChange');
    bool isConnected = data[0];
    double productPrice = data[1];

    if (!isConnected && productPrice > 100) {
      scaffoldMessengerService.showSnackBar(const SnackBar(
        duration: Duration(seconds: 6),
        content: Text(
          "Maybe this product is in sale. Enable your internet connection to see the updated price",
        ),
      ));
    }
  }
}
