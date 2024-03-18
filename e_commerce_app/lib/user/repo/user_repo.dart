import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/user/model/cart_model.dart';
import 'package:e_commerce_app/user/model/order_model.dart';

class UserRepo {
  Future<void> addToCart(
      {required Product product, required String userId}) async {
    try {
      CollectionReference cartProd = FirebaseFirestore.instance
          .collection('user_data')
          .doc(userId)
          .collection('cart');
      Map<String, dynamic> productMap = product.toMap();
      await cartProd.doc(product.name).set(productMap);
      await cartProd.doc(product.name).set({
        'name': product.name,
        'description': product.description,
        'brand': product.brand,
        'toWhom': product.toWhom,
        'price': product.price,
        'star': product.star,
        'color': product.color,
        'imageUrl': product.imageUrl,
        'review': product.review,
        'size': product.size,
        'quantity': 1,
      });
      print('--------bugging inside addToCart -------------');
    } catch (e) {
      print('Error occured while adding to cart $e');
    }
  }

  Future<List<Map<String, dynamic>>> retrieveCart(String userId) async {
  try {
    QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(userId)
        .collection('cart')
        .get();

    List<Map<String, dynamic>> cartList = [];
    cartSnapshot.docs.toList();

    return cartList;
  } catch (e) {
    print('Error occurred while retrieving cart: $e');
    return [];
  }
}

  Future<void> removeFromCart(
      {
      required String userId,
      required String docId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_data')
          .doc(userId)
          .collection('cart')
          .doc(docId)
          .delete();
    } catch (e) {
      print('Error occured while removing from cart $e');
    }
  }

  Future<void> updateCartItem({required Cart product,
      required String userId,
      required String docId , required int quantity})async {
        try {
          await FirebaseFirestore.instance
           .collection('user_data')
           .doc(userId)
           .collection('cart')
           .doc(docId)
           .update({
            'quantity': quantity,
          });
        } catch (e) {
          print('Error occured while updating cart $e');
        }
      }

  Future<void> addToFavorite(
      {required Product product, required String userId}) async {
    try {
      CollectionReference cartProd = FirebaseFirestore.instance
          .collection('user_data')
          .doc(userId)
          .collection('favorite');
      Map<String, dynamic> productMap = product.toMap();
      await cartProd.doc(product.name).set(productMap);
      print('--------bugging inside addToFavorite -------------');
    } catch (e) {
      print('Error occured while adding to cart $e');
    }
  }

  Future<void> removeFromFavorite(
      {required Product product,
      required String userId,
      required String docId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .collection('favorite')
          .doc(docId)
          .delete();
    } catch (e) {
      print('Error occured while removing from cart $e');
    }
  }

  Future<void> addToOrder(
      {required Product product,
      required String userId}) async {
    try {
      CollectionReference cartProd = FirebaseFirestore.instance
          .collection('user_data')
          .doc(userId)
          .collection('order');
      Map<String, dynamic> productMap = product.toMap();
      await cartProd.doc(product.name).set(productMap);
      await cartProd.doc(product.name).set({
        'name': product.name,
        'description': product.description,
        'brand': product.brand,
        'toWhom': product.toWhom,
        'price': product.price,
        'star': product.star,
        'color': product.color,
        'imageUrl': product.imageUrl,
        'review': product.review,
        'size': product.size,
        'status': 'active',
      });
      print('--------bugging inside addToOrder -------------');
      // return Product.fromMap(productMap);
    } catch (e) {
      print('Error occured while adding to order $e');
      // return null;
    }
  }
}
