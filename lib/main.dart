import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/views/purchase/editPurchaseScreen.dart';
import 'package:flutter_firebase/views/purchase/formPurchaseScreen.dart';
import 'package:flutter_firebase/views/purchase/listPurchaseScreen.dart';
import 'package:flutter_firebase/views/user/user.dart';
import 'package:flutter_firebase/views/user/userForm.dart';
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
        '/addPurchase': (context) => FormPurchaseScreen(),
        '/editPurchase': (context) => EditPurchaseScreen()
=======
        '/': (context) => UserScreen(),
        '/addPurchase': (context) => FormPurchaseScreen(),
        '/user-form': (context) => UserFormScreen()
>>>>>>> 66d0249f4611e188ba7422406bad972bbfca7f5f
      },
    );
  }
}
