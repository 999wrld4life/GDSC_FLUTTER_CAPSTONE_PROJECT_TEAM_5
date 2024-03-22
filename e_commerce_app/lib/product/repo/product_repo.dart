import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class ProductRepo {

  Future<String?> uploadImage(File imageFile) async {
  try {
    final String randomImageName = '${const Uuid().v4()}.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child('images/$randomImageName');
    UploadTask uploadTask = storageReference.putFile(imageFile);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}

Future<void> addProduct({required Product product, required File imageFile}) async {
  String? imageUrl = await uploadImage(imageFile);

  if (imageUrl != null) {
    CollectionReference products = FirebaseFirestore.instance.collection('products');

    await products.add({
      'name': product.name,
      'description': product.description,
      'brand': product.brand,
      'toWhom': product.toWhom,
      'price': product.price,
      'star': product.star,
      'color': product.color,
      'imageUrl': imageUrl, 
      'review': product.review,
      'size': product.size,
    });
  } else {
    print('Failed to upload image.');
  }
}

Future<void> deleteProduct(String productId) async {
  try {
    await FirebaseFirestore.instance.collection('products').doc(productId).delete();
  } catch (e) {
    print('Error deleting product and image: $e');
  }
}

Future<void> editProduct({required Product newProduct, required String imageUrl, required String productId}) async {
    try {
      CollectionReference products = FirebaseFirestore.instance.collection('products');

      await products.doc(productId).update({
        'name': newProduct.name,
        'description': newProduct.description,
        'brand': newProduct.brand,
        'toWhom': newProduct.toWhom,
        'price': newProduct.price,
        'star': newProduct.star,
        'color': newProduct.color,
        'imageUrl': imageUrl,
        'review': newProduct.review,
        'size': newProduct.size,

      });
    } catch (e) {
      print('Error editing product: $e');
    }
  }

  Future<List<Product>> searchProduct({required String query}) async {
    try {
      CollectionReference products = FirebaseFirestore.instance.collection('products');
      QuerySnapshot querySnapshot = await products.where('name', isEqualTo: query).get();

      List<Product> searchResults = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Product.fromMap(data,id: doc.id);
      }).toList();

      return searchResults;
    } catch (e) {
      print('Error searching product: $e');
      return [];
    }
  }


}