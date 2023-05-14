import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/views/menu.dart';
import 'package:flutter_firebase/views/product/add-product.dart';
import 'package:flutter_firebase/views/product/list-product.dart';
import 'package:flutter_firebase/views/product/update-product.dart';
import 'package:flutter_firebase/views/purchase/editPurchaseScreen.dart';
import 'package:flutter_firebase/views/purchase/formPurchaseScreen.dart';
import 'package:flutter_firebase/views/purchase/listPurchaseScreen.dart';
import 'package:flutter_firebase/views/sale/editSaleScreen.dart';
import 'package:flutter_firebase/views/sale/formSaleScreen.dart';
import 'package:flutter_firebase/views/sale/listSaleScreen.dart';
import 'package:flutter_firebase/views/user/add-user.dart';
import 'package:flutter_firebase/views/user/list-user.dart';
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
        '/': (context) => Login(),
        '/menu': (context) => MenuScreen(),
        /* Purchase */
        '/listPurchase':(context) => ListPurchaseScreen(),
        '/addPurchase': (context) => FormPurchaseScreen(),
        '/editPurchase': (context) => EditPurchaseScreen(),
        /* Sales */
        '/listSales' : (context) => ListSaleScreen(),
        '/addSale': (context) => FormSaleScreen(),
        '/editSale': (context) => EditSaleScreen(),
        /* User */
        '/listUser':(context) => UserScreen(),
        '/addUser':(context) => UserFormScreen(),
        '/updateUser':(context) => UpdateUserScreen(),
        /* Product */
        '/listProduct': (context) => ProductScreen(),
        '/addProduct': (context) => ProductFormScreen(),
        '/updateProduct': (context) => UpdateProductScreen(),
      },
    );
  }
}
