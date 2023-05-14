import 'package:cloud_firestore/cloud_firestore.dart';

//Aqui va toda la funcionalidad de firestore
FirebaseFirestore db = FirebaseFirestore.instance;

//============== Purchase CRUD =================

//==>Obtener todos las compras
Future<List> getProducts() async {
  List products = [];
  //Hacemos refencia a la colección de FireBase
  CollectionReference collectionReferencePurchase = db.collection('product');
  //Traemos por medio del metodo get todo lo que tiene la colección
  QuerySnapshot queryPurchase = await collectionReferencePurchase.get();

  //Hacemos un ForeEach para agregarlos a la lista
  queryPurchase.docs.forEach((productfb) {
    final Map<String, dynamic> data = productfb.data() as Map<String, dynamic>;
    final product = {
      "uid": productfb.id,
      "name": data['name'],
      "description": data['description'],
      "units": data['units'],
      "cost": data['cost'],
      "price": data['price'],
      "utility": data['utility'],
    };
    products.add(product);
  });
  //Accion para esperar a que se llene la lista
  Future.delayed(const Duration(seconds: 2));

  return products;
}

//==>Añadir un Usuario
Future<void> addProduct(String name, String description, String price, String units, String cost,
    String utility) async {
  //Enviamos como si fuera un json
  await db.collection('product').add({
      "name": name,
      "description": description,
      "units": units,
      "cost": cost,
      "price": price,
      "utility": utility,
  });
}

// Actualizar user
Future<void> updateProduct(String uid, String name, String description, String price, String units, String cost,
    String utility) async {
  await db.collection('product').doc(uid).set({
    "name": name,
    "description": description,
    "price": price,
    "units": units,
    "cost": cost,
    "utility": utility,
  });
}

// Borrar user
Future<void> deleteProduct(String uid) async {
  await db.collection("product").doc(uid).delete();
}