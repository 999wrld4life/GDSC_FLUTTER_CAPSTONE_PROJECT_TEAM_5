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
      {required String userId, required String docId}) async {
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

  Future<void> updateCartItem(
      {required Cart product,
      required String userId,
      required String docId,
      required int quantity}) async {
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
      {required Product product, required String userId}) async {
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

  Future<void> addOrder(
      {required List<Cart> products, required double price, required String userId}) async {
    try {
      List<Map<String, dynamic>> productsData =
          products.map((product) => product.toMap()).toList();
      await FirebaseFirestore.instance.collection('user_data')
      .doc(userId)
      .collection('order')
      .add(
        {
          'products': productsData,
          'price': price,
        },
      );
    } catch (e) {
      print('Error adding MyOrders to Firestore: $e');
      rethrow;
    }
  }

  Future<List<MyOrders>> getOrders(String userId) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(userId)
        .collection('order')
        .get();

    List<MyOrders> orders = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      // Here you can convert the retrieved data into your Order object.
      // Assuming you have an Order class, you can create an instance of it like this:
      return MyOrders(
        orders: List<Cart>.from(data['products'].map((product) => Cart.fromMap(product))),
        totalPrice: data['price'],
        // Add any other fields you might need.
      );
    }).toList();

    return orders;
  } catch (e) {
    print('Error getting orders from Firestore: $e');
    rethrow;
  }
}
}
