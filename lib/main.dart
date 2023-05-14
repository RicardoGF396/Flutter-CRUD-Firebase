import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/views/product/add-product.dart';
import 'package:flutter_firebase/views/product/list-product.dart';
import 'package:flutter_firebase/views/product/update-product.dart';
import 'package:flutter_firebase/views/purchase/formPurchaseScreen.dart';
import 'package:flutter_firebase/views/purchase/listPurchaseScreen.dart';
import 'package:flutter_firebase/views/user/list-user.dart';
import 'package:flutter_firebase/views/user/add-user.dart';
import 'package:flutter_firebase/views/user/update-user.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boline',
      initialRoute: '/',
      routes: {
        '/': (context) => ProductScreen(),
        '/addPurchase': (context) => FormPurchaseScreen(),
        '/add-user': (context) => UserFormScreen(),
        '/update-user': (context) => UpdateUserScreen(),
        '/list-user': (context) => UserScreen(),
        '/list-product': (context) => ProductScreen(),
        '/add-product': (context) => ProductFormScreen(),
        '/update-product': (context) => UpdateProductScreen(),

      },
    );
  }
}
