import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/product/model/product.dart';
import 'package:e_commerce_app/user/model/order_model.dart';
import 'package:e_commerce_app/views/shared/fonts/google_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox adminOrderSource(User? user, String status) {
  return SizedBox(
    height: 120.h,
    child: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collectionGroup(
              'order') // Use collectionGroup to query all 'order' collections under 'user_data'
          .where('status',
              isEqualTo: status) // Add any additional filters as needed
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          print('--------products has error--------------');
          print(snapshot.error.toString());
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (!snapshot.hasData) {
          print('--------products has data--------------');
        }

        final products = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Product.fromMap(data, id: doc.id);
        }).toList();
        print('--------products--------------');
        return products.isEmpty
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No products available",
                    style: textStyle(
                        20.sp,
                        const Color.fromARGB(255, 98, 96, 96),
                        FontWeight.bold,
                        1),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Image.asset(
                  //   'image/search.png',
                  //   width: 300,
                  //   height: 300,
                  // )
                ],
              ))
            : Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 10, right: 10, bottom: 10),
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: ((context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Card(
                          color: Colors.grey[200],
                          elevation: 0,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    // image: DecorationImage(
                                    //   image: AssetImage('image/search.png'),
                                    // ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            product.name,
                                            style: textStyle(
                                                18.sp,
                                                Colors.black,
                                                FontWeight.bold,
                                                1),
                                          ),
                                          Text(
                                            product.brand,
                                            style: textStyle(
                                                16.sp,
                                                const Color.fromARGB(
                                                    255, 116, 115, 115),
                                                FontWeight.bold,
                                                1),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "\$${product.price}",
                                            style: textStyle(
                                                16.sp,
                                                const Color(0xFF6055D8),
                                                FontWeight.bold,
                                                1),
                                          ),
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MaterialButton(
                                    padding: const EdgeInsets.all(10),
                                    color: const Color(0xFF6055D8),
                                    onPressed: () {},
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Text(
                                      "Track Order",
                                      style: textStyle(17.sp, Colors.white,
                                          FontWeight.bold, 1),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      );
                    })),
              );
      },
    ),
  );
}
