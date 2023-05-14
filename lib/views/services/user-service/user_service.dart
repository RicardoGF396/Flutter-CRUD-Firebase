import 'package:cloud_firestore/cloud_firestore.dart';

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
    users.add(usersfb.data());
  });
  //Accion para esperar a que se llene la lista
  Future.delayed(const Duration(seconds: 2));

  return users;
}

//==>Añadir un Usuario
Future<void> addUser(String age, String email, String gender, String id,
    String name, String lastname, String password) async {
  //Enviamos como si fuera un json
  await db.collection('user').add({
    "age": name,
    "email": email,
    "gender": gender,
    "id": id,
    "name": name,
    "lastname": lastname,
    "password": password
  });
}
