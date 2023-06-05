import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/views/services/product-service/product_service.dart';

//Aqui va toda la funcionalidad de firestore
FirebaseFirestore db = FirebaseFirestore.instance;

//============== Purchase CRUD =================

//==>Obtener todos las ventas
Future<List> getSales() async {
  List sales = [];
//Hacemos refencia a la colección de FireBase
  CollectionReference collectionReferencePurchase = db.collection('sale');
  //Traemos por medio del metodo get todo lo que tiene la colección
  QuerySnapshot queryPurchase = await collectionReferencePurchase.get();
  for (var doc in queryPurchase.docs) {
    //Mofificacion para actualizar
    //Hacemos un Ciclo para agregarlos a la lista

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final purchaseB = {
      'uid': doc.id,
      'name': data['name'],
      'quantity': data['quantity'],
      'pieces': data['pieces'],
      'idc': data['idc'],
      'idv': data['idv'],
      'subtotal': data['subtotal'],
      'total': data['total'],
    };
    sales.add(purchaseB);
  }
  //Accion para esperar a que se llene la lista
  Future.delayed(const Duration(seconds: 2));

  return sales;
}

//==> Actualizar una venta
Future<void> updateSale(String uid, String name, String quantity, String pieces,
    String idc, String idv, String subtotal, String total) async {
  await db.collection('sale').doc(uid).set({
    "name": name,
    "quantity": quantity,
    "pieces": pieces,
    "idc": idc,
    "idv": idv,
    "subtotal": subtotal,
    "total": total
  });
}

//==>Añadir una Sale
Future<void> addSale(String uidProduct, String name, String finalQuantity, String quantity, String pieces, String idc,
    String idv, String subtotal, String total) async {

  //Enviamos como si fuera un json
  await db.collection('sale').add({
    "name": name,
    "quantity": quantity,
    "pieces": pieces,
    "idc": idc,
    "idv": idv,
    "subtotal": subtotal,
    "total": total
  });

  await updateUnitsProduct(uidProduct, finalQuantity);
}

// ===> Eliminar
Future<void> deleteSale(String uid) async {
  await db.collection('sale').doc(uid).delete();
}
