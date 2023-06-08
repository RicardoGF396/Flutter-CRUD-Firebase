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

  for (var doc in queryPurchase.docs) {
    //Mofificacion para actualizar
    //Hacemos un Ciclo para agregarlos a la lista

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final purchaseB = {
      'uid': doc.id,
      'name': data['name'],
      'pieces': data['pieces'],
      'ida': data['ida']
    };
    purchase.add(purchaseB);
  }

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

//==> Actualizar una compra

Future<void> updatePurchase(
    String uid, String name, String pieces, String ida) async {
  await db
      .collection('purchase')
      .doc(uid)
      .set({"name": name, "pieces": pieces, "ida": ida});
}

// ===> Eliminar
Future<void> deletePurchase(String uid) async {
  await db.collection('purchase').doc(uid).delete();
}

// ===> Todos Los ID
 Future<List<String>> getPurchaseIds() async {
    CollectionReference collectionReference = db.collection('purchase');
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<String> ids = querySnapshot.docs.map((doc) => doc.id).toList();
    return ids;
  }