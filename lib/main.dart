import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/views/login.dart';
import 'package:flutter_firebase/views/purchase/formPurchaseScreen.dart';
import 'package:flutter_firebase/views/purchase/listPurchaseScreen.dart';
import 'package:flutter_firebase/views/user/user.dart';
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
<<<<<<< HEAD
        '/': (context) => ListPurchaseScreen(),
        '/addPurchase': (context) => FormPurchaseScreen()
=======
        '/': (context) => UserScreen(),
        '/addPurchase': (context) => FormPurchaseScreen(),
        '/user-list': (context) => UserScreen()
>>>>>>> 382a26f9b6044e24e596cbd8e7f910fc973a371a
      },
    );
  }
}
