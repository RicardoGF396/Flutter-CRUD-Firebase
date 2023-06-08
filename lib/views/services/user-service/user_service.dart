import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
//Aqui va toda la funcionalidad de firestore
FirebaseFirestore db = FirebaseFirestore.instance;

//============== Purchase CRUD =================

//==>Obtener todos las compras
Future<List> getUsers() async {
  List users = [];
  //Hacemos refencia a la colección de FireBase
  CollectionReference collectionReferencePurchase = db.collection('user');
  //Traemos por medio del metodo get todo lo que tiene la colección
  QuerySnapshot queryPurchase = await collectionReferencePurchase.get();

  //Hacemos un ForeEach para agregarlos a la lista
  queryPurchase.docs.forEach((usersfb) {
    final Map<String, dynamic> data = usersfb.data() as Map<String, dynamic>;
    final user = {
      "uid": usersfb.id,
      "name": data['name'],
      "lastname": data['lastname'],
      "email": data['email'],
      "age": data['age'],
      "gender": data['gender'],
      "password": data['password'],
      "id": data['id'],
    };
    users.add(user);
  });
  //Accion para esperar a que se llene la lista
  Future.delayed(const Duration(seconds: 2));

  return users;
}

//==>Añadir un Usuario


// Función para hashear la contraseña
String hashPassword(String password) {
  var bytes = utf8.encode(password); // Convierte la contraseña en bytes
  var digest = sha256.convert(bytes); // Aplica la función hash SHA-256
  return digest.toString(); // Devuelve el hash como una cadena de texto
}

// Añadir un Usuario
Future<void> addUser(String age, String email, String gender,
    String name, String lastname, String password) async {
    String hashedPassword = hashPassword(password); // Hashear la contraseña
  
  // Enviamos como si fuera un json
  await db.collection('user').add({
    "age": name,
    "email": email,
    "gender": gender,
    "name": name,
    "lastname": lastname,
    "password": hashedPassword // Almacenar el hash en lugar de la contraseña original
  });
}

// Actualizar user
Future<void> updateUser(String uid, String name, String lastname, String email,
    String age, String gender, String password, String id) async {
  await db.collection('user').doc(uid).set({
    "name": name,
    "lastname": lastname,
    "email": email,
    "age": age,
    "gender": gender,
    "password": password,
    "id": id
  });
}

// Borrar user
Future<void> deleteUser(String uid) async {
  await db.collection("user").doc(uid).delete();
}