import 'package:cloud_firestore/cloud_firestore.dart';

//Aqui va toda la funcionalidad de firestore
FirebaseFirestore db = FirebaseFirestore.instance;

//============== Purchase CRUD =================

//==>Obtener todos las compras
Future<List> getPurchase() async {
  List purchase = [];
  //Hacemos refencia a la colección de FireBase
  CollectionReference collectionReferencePurchase = db.collection('purchase');
  //Traemos por medio del metodo get todo lo que tiene la colección
  QuerySnapshot queryPurchase = await collectionReferencePurchase.get();

  //Hacemos un ForeEach para agregarlos a la lista
  queryPurchase.docs.forEach((purchasefb) {
    purchase.add(purchasefb.data());
  });
  //Accion para esperar a que se llene la lista
  Future.delayed(const Duration(seconds: 2));

  return purchase;
}

//==>Añadir una compra
Future<void> addPurchase(String name, String pieces, String ida) async {
  //Enviamos como si fuera un json
  await db
      .collection('purchase')
      .add({"name": name, "pieces": pieces, "ida": ida});
}
