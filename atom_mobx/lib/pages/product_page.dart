import 'package:atom_poc/states/product_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart' as mobx;

import '../dependencies.dart';
import '../states/internet_state.dart';
import 'edit_product_page_with_disposer_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductState productState = Dependencies.get();
  final InternetState internetState = Dependencies.get();

  @override
  Widget build(BuildContext context) {
    return mobx.Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Page'),
          actions: [
            const Text('Is Connected:'),
            CupertinoSwitch(
              value: internetState.isConnected,
              onChanged: internetState.setIsConnected,
              activeColor: Colors.green,
              trackColor: Colors.red,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${productState.name ?? 'not defined'}'),
            Text('Description: ${productState.description ?? 'not defined'}'),
            Text('Price: ${productState.price}'),
          ],
        ),
        floatingActionButton: internetState.isConnected
            ? FloatingActionButton(
                disabledElevation: 0,
                tooltip: "Edit product",
                child: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => const EditProductPage(),
                  ));
                },
              )
            : FloatingActionButton(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.grey[400],
                disabledElevation: 0,
                onPressed: null,
                tooltip: "No internet connection for editing the product",
                child: const Icon(Icons.edit),
              ),
      );
    });
  }
}
