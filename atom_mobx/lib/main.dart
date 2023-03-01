import 'package:flutter/material.dart';

import 'dependencies.dart';
import 'pages/product_page.dart';
import 'services/scaffold_messenger_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    final scaffoldMessenger = Dependencies.get<ScaffoldMessengerService>();
    scaffoldMessenger.setKey(scaffoldMessengerKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const ProductPage(),
    );
  }
}
