import 'package:atom_poc/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart' as mobx;

import '../core/reaction_widget.dart';
import '../dependencies.dart';
import '../states/internet_state.dart';
import '../states/product_state.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final ProductState productState = Dependencies.get();
  final InternetState internetState = Dependencies.get();

  void onConnectionChange(bool isConnected) {
    debugPrint('[EditProductPage] onConnectionChange');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("You are disconnected, so you can't edit the product."),
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ReactionWidget(
      reactions: [
        Reaction(() => internetState.isConnected).effect(onConnectionChange),
      ],
      child: mobx.Observer(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Product'),
            actions: [
              ElevatedButton(
                child: const Text('update name'),
                onPressed: () {
                  productState.setName('new product name');
                },
              ),
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
      }),
    );
  }
}
