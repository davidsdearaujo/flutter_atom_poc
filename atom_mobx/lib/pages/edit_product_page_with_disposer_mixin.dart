import 'package:atom_mobx/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart' as mobx;

import '../dependencies.dart';
import '../states/internet_state.dart';
import '../states/product_state.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage>
    with ReactionDisposerMixin {
  final ProductState productState = Dependencies.get();
  final InternetState internetState = Dependencies.get();

  @override
  void initState() {
    super.initState();
    reaction(() => internetState.isConnected, onConnectionChange);
  }

  void onConnectionChange(bool isConnected) {
    debugPrint('[EditProductPage] onConnectionChange');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("You are disconnected, so you can't edit the product."),
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return mobx.Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          actions: [
            const Text('Is Connected:'),
            CupertinoSwitch(
              value: internetState.isConnected,
              onChanged: internetState.setIsConnected,
            ),
          ],
        ),
        body: Column(children: [
          TextFormField(
            decoration: const InputDecoration(label: Text('Name')),
            initialValue: productState.name,
            onChanged: productState.setName,
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text('Description')),
            initialValue: productState.description,
            onChanged: productState.setDescription,
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text('Price')),
            initialValue: productState.price.toString(),
            onChanged: (value) {
              productState.setPrice(double.tryParse(value) ?? 0);
            },
          ),
        ]),
      );
    });
  }
}
